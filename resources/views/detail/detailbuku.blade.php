@extends('dashboard.dashboard')

@section('content')

			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
                    <div class="tab-pane active d-flex justify-content-center" id="pic-1">
                        <img style="height: 400px; width:300px;" src="{{ asset('img/' . $buku[0]['img']) }}" />
                    </div>


					</div>
					<div class="details col-md-6">
						<h3 class="product-title">{{$buku[0]['judul']}}</h3>
						<p class="product-description">{{$buku[0]['deskripsi_buku']}}</p>
						<h4 class="price">Nama Pemilik : <span>{{$buku[0]['pengguna']}}</span></h4>
						<p> Kategori : <span>{{$buku[0]['kategori']}}</span></p>
						<p> Penerbit : <span>{{$buku[0]['penerbit']}}</span></p>
						<p> Tahun Terbit : <span>{{$buku[0]['tahun_terbit']}}</span></p>
						<div class="action">
							<button id="pinjam" class="add-to-cart btn btn-default" type="button"> Pinjam Buku </button>
						</div>
							<label for="datetimeInput">Pilih Tanggal Pinjam:</label>
							<input type="date" id="tanggalpinjam" name="datetimeInput">
							<input type="hidden" id="idbuku" value="{{$buku[0]['id']}}">
							<input type="hidden" id="idpemilik" value="{{$buku[0]['id_user']}}">
							<input type="hidden" id="idpeminjam" value="{{ Auth::user()->id }}">
							<br>
							<label for="datetimeInput">Pilih Tanggal Kembalikan:</label>
							<input type="date" id="tanggalkembali" name="datetimeInput">
					</div>
				</div>
			</div>
		</div>
	</div>

    
	<script>
    $("#pinjam").click(function(){
        console.log("tes")
        var id_buku = $("#idbuku").val()
        var id_pemilik = $("#idpemilik").val()
        var id_peminjam = $("#idpeminjam").val()
        var tgl_pinjam = $("#tanggalpinjam").val()
        var tgl_kembali = $("#tanggalkembali").val()

        var _token = $('input[name="_token"]').val();

        $.ajax({
          url: "{{ route('pinjam') }}",
            method: "get",
            data: {
                _token: _token,
                idbuku: id_buku,
                idpemilik: id_pemilik,
                idpeminjam: id_peminjam,
                tglpinjam: tgl_pinjam,
                tglkembali: tgl_kembali

            },
            success: function(response) {
                if (response.status === "sukses") {
                    Swal.fire({
  title: "Buku Berhasil dipinjam, silahkan tunggu konfirmasi",
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

window.location.href = '/';
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