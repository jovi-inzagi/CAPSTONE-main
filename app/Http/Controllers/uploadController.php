<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class uploadController extends Controller
{
    //

    public function index()
    {
        $ktg = DB::table('kategori')
            ->select('kategori.*')
            ->get();

        $kategori = json_decode($ktg, true);

        // dd($kategori);

        return view('profile.uploadbuku', ['kategori' => $kategori]);
    }

    public function getUpload(Request $request)
    {
        // Retrieve form data
        $judulBuku = $request->input('judulBuku');
        $kategori = $request->input('kategori');
        $penerbit = $request->input('penerbit');
        $thterbit = $request->input('thterbit');
        $tahunTerbit = $request->input('tahunTerbit');
        $deskripsi = $request->input('deskripsi');
        $userid = $request->input('userid');
        $fotoSampul = $request->file('fotoSampul');

        if ($request->hasFile('fotoSampul')) {
            $fotoSampul = $request->file('fotoSampul');


            $filename = uniqid() . '_' . $fotoSampul->getClientOriginalName();

            try {

                $fotoSampul->move(public_path('img'), $filename);


                DB::table('buku')->insert([
                    'judul' => $judulBuku,
                    'img' => $filename,
                    'kategori' => $kategori,
                    'id_user' => $userid,
                    'status_buku' => 0,
                    'deskripsi_buku' => $deskripsi,
                    'upload_date' => $tahunTerbit,
                    'penerbit' => $penerbit,
                    'tahun_terbit' => $thterbit,

                ]);
                return response()->json(['message' => 'Upload buku berhasil']);
            } catch (\Illuminate\Database\QueryException $e) {
                // This catches any database-related errors
                return response()->json(['message' => 'Database error: ' . $e->getMessage()], 500);
            } catch (\Throwable $th) {
                // This catches other types of exceptions
                return response()->json(['message' => 'Unexpected error occurred'], 500);
            }
        }


        // You can customize the JSON response message here

    }
}
