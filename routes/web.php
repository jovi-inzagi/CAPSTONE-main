<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\notifikasiController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\uploadController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Auth::routes();

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/dashboard', [App\Http\Controllers\HomeController::class, 'index'])->name('dashboard');

Route::get('/detail/{id}', [App\Http\Controllers\HomeController::class, 'detail'])->name('detail');

Route::get('/pinjam', [App\Http\Controllers\HomeController::class, 'pinjam'])->name('pinjam');

Route::get('/notifikasi', [App\Http\Controllers\notifikasiController::class, 'index'])->name('notifikasi');

Route::get('/konfirmation', [App\Http\Controllers\notifikasiController::class, 'konfirmasi'])->name('konfirmasi');

Route::get('/profile', [ProfileController::class, 'show'])->middleware('auth')->name('profile.show');


Route::get('/uploadbuku', [uploadController::class, 'index'])->name('uploadbuku');
Route::post('/sendbuku', [uploadController::class, 'getUpload'])->name('sendbuku');


// ...
