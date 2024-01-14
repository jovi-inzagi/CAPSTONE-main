<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class notifikasiController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index() {
        $angka = 1;
        // dd($angka);

        $userId = Auth::user()->id;

                $getnotif = DB::connection('mysql')
                    ->table('notifikasi')
                    ->select('notifikasi.*','notifikasi.id as idnotif','buku.*','users.name as peminjam')
                    ->join('buku','buku.id','=','notifikasi.id_buku')
                    ->join('users','users.id','=','notifikasi.id_peminjam')
                    ->where('id_pemilik', $userId)
                    ->where('status_transaksi','=','belum selesai')
                    ->get();

                    $getnotif = json_decode($getnotif, true);
                    // dd($getnotif);

        return view('notifikasi', ['angka' => $angka,'getnotif' => $getnotif]);

    }

    public function konfirmasi(Request $request) {
        $idnotif = $request -> input('idnotif');

        // dd($idnotif);

        DB::connection('mysql')
        ->table('notifikasi')
        ->where('id','=', $idnotif)
        ->update([
            'status_pinjam' => 'dipinjam',
            'status_transaksi' => 'selesai',
        ]);

        $datanotif = DB::connection('mysql')
        ->table('notifikasi')
        ->select('notifikasi.*')
        ->where('id','=', $idnotif)
        ->get();

        $datanotif = json_decode($datanotif, true);

        // dd($datanotif);

        DB::connection('mysql')
        ->table('transaksi')
        ->insert([
            'id_peminjam' => $datanotif[0]['id_peminjam'],
            'id_buku' => $datanotif[0]['id_buku'],
            'tgl_mulai' => $datanotif[0]['waktu_pinjam'],
            'tgl_akhir' => $datanotif[0]['waktu_kembali'],
            'status_peminjam' => 1
        ]);

        DB::connection('mysql')
        ->table('buku')
        ->where('id','=', $datanotif[0]['id_buku'])
        ->update([
            'status_buku' => 1,
        ]);

        return response()->json(['status'=>'sukses']);

       


    }
}
