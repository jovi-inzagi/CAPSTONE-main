@extends('dashboard.dashboard')

@section('content')

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
    <!-- Header -->
  <div class="header">
    <h1>Request Peminjaman Buku</h1>
  </div>

  <!-- Photo Grid -->
      <!-- Row 1 -->
  <div class="card-deck">
    <div class="row">
    @foreach ($getnotif as $key => $item)


    <div class="col-md-4 card-container">
      <div class="card">
        <img class="card-img-top" src="{{ asset('img/' . $item['img']) }}" alt="Company logo">
        <div class="card-body">
          <h5 class="card-title">{{$item['judul']}}</h5>
          <ul class="list-group">
            <li class="list-group-item list-group-item-success"><i class="fa fa-user"style="font-size:20px;"></i>{{$item['peminjam']}}</li>
            <li class="list-group-item list-group-item-success"><i class="fa fa-clock-o"style="font-size:20px;"></i>{{$item['waktu_pinjam']}} / {{$item['waktu_kembali']}} </li>
          </ul>
          
        </div>
        <div class="card-footer">
        <input type="hidden" class="idnotif" name="idnotif" value="{{$item['idnotif']}}">
        <button class="button button-green setuju">Setuju</button>

        </div>
      </div>
      </div>
    @endforeach

      </div>
</div>

<script>
    $(".setuju").click(function(){

    // Temukan elemen .idnotif yang berada di parent card yang sama
    var id_notif = $(this).closest('.card-container').find(".idnotif").val();
    console.log(id_notif);

        var _token = $('input[name="_token"]').val();

        $.ajax({
          url: "/konfirmation",
            method: "get",
            data: {
                _token: _token,
                idnotif: id_notif,

            },
            success: function(response) {
              if (response.status === "sukses") {
                    Swal.fire({
  title: "Buku Berhasil dipinjamkan",
  showClass: {
    popup: `
      animate__animated
      animate__fadeInUp
      animate__faster
    `
  },
  hideClass: {
    popup: `
      animate__animated
      animate__fadeOutDown
      animate__faster
    `
  }
});

location.reload();
                    console.log("Data Berhasil dimasukkan")
                }
                else {
                    console.log("Error")
                }

            }
        });
        
    })
</script>



@endsection