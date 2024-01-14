<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $currentDate = Carbon::now();

        // Get the start and end of the current week
        $startOfWeek = $currentDate->startOfWeek()->format('Y-m-d'); // Start of the current week (usually Monday)
        $endOfWeek = $currentDate->endOfWeek()->format('Y-m-d'); // End of the current week (usually Sunday)

        // dd($startOfWeek, $endOfWeek);

        $features = DB::connection('mysql')
            ->table('buku')
            ->select('buku.*')
            ->where('status_buku', 0)
            ->where('id_user','!=',Auth::user()->id)
            ->whereBetween('upload_date', [$startOfWeek, $endOfWeek])
            ->get();

        $features = json_decode($features, true);
        // dd($features);

        $listbuku = DB::connection('mysql')
            ->table('buku')
            ->select('buku.*')
            ->where('status_buku', 0)
            ->get();

        $listbuku = json_decode($listbuku, true);

        // dd($listbuku);

        return view('dashboard.katalogbuku', ['features' => $features, 'buku' => $listbuku]);
    }

    public function detail($id) {
        
        $buku = DB::connection('mysql')
        ->table('buku')
        ->select('buku.*','users.name as pengguna' )
        ->join('users','users.id','=','buku.id_user')
        ->where('buku.id', '=', $id)
        ->get();

        $buku = json_decode($buku, true);
        // dd($buku, $id);

        return view('detail/detailbuku', ['id' => $id, 'buku' => $buku] );

    }

    public function pinjam(Request $request) {
        $idbuku = $request -> input('idbuku');
        $idpemilik = $request -> input('idpemilik');
        $idpeminjam = $request -> input('idpeminjam');
        $tglpinjam = $request -> input('tglpinjam');
        $tglkembali = $request -> input('tglkembali');

        DB::connection('mysql')
        ->table('notifikasi')
        ->insert([
            'id_peminjam' => $idpeminjam,
            'id_buku' => $idbuku,
            'id_pemilik' => $idpemilik,
            'status_pinjam' => 'tidak dipinjam',
            'status_transaksi' => 'belum selesai',
            'waktu_pinjam' => $tglpinjam,
            'waktu_kembali' => $tglkembali
        ]);

        return response()->json(['status'=>'sukses']);

        // dd($idbuku);
    }


}
