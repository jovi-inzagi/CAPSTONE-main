<?php

namespace App\Providers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
// use auth;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot()
    {


        // View::composer('dashboard.dashboard', function ($view) {
        //     $angka = 0; // Set your value here, or fetch it from wherever you want
        //     $view->with('angka', $angka);
        // });

        View::composer('*', function ($view) {
            if (Auth::check()) {
                $userId = Auth::user()->id;

                $getnotif = DB::connection('mysql')
                    ->table('notifikasi')
                    ->where('id_pemilik', $userId)
                    ->where('status_transaksi','=','belum selesai')
                    ->count();



                $view->with('angka', $getnotif);
            }
        });
    }
}