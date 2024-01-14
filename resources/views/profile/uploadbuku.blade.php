@extends('dashboard.dashboard')

@section('content')

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body" style="background-color: #f0f0f0;">
                    <form>
                        <div class="mb-3">
                            <label for="judulBuku" class="form-label">Judul Buku</label>
                            <input type="text" class="form-control" id="judulBuku" placeholder="Masukkan Judul Buku">
                        </div>
                        <div class="mb-3">
                            <label for="kategori" class="form-label">Kategori</label>
                            <select name="kategori" id="kategori">
                                @foreach ($kategori as $item)
                                <option value="{{$item['jenis_buku']}}">{{$item['jenis_buku']}}</option>

                                @endforeach
                            </select>


                        </div>
                        <div class="mb-3">
                            <label for="penerbit" class="form-label">Penerbit</label>
                            <input type="text" class="form-control" id="penerbit" placeholder="Masukkan Penerbit">
                        </div>
                        <div class="mb-3">
                            <label for="thterbit" class="form-label">Tahun Terbit</label>
                            <input type="text" class="form-control" id="thterbit" placeholder="Masukkan Penerbit">
                        </div>
                        <div class="mb-3">
                            <label for="tahunTerbit" class="form-label">Tanggal Upload</label>
                            <input type="date" class="form-control" id="tahunTerbit">
                        </div>

                        <div class="mb-3">
                            <label for="deskripsi" class="form-label">Deskripsi Buku</label>
                            <textarea class="form-control" id="deskripsi" rows="3" placeholder="Masukkan Deskripsi Buku"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="fotoSampul" class="form-label">Foto Sampul (JPEG/JPG/PNG)</label>
                            <input type="file" class="form-control" id="fotoSampul">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    var idusr = " {{ Auth::user()->id }}";

    // console.log(idusr);

    $(document).ready(function() {
        $('form').submit(function(event) {
            event.preventDefault();


            var judulBuku = $('#judulBuku').val();

            var kategori = $('#kategori').val();
            var penerbit = $('#penerbit').val();
            var tahunTerbit = $('#tahunTerbit').val();
            var deskripsi = $('#deskripsi').val();
            var thterbit = $('#thterbit').val();
            var fotoSampul = $('#fotoSampul')[0].files[0];




            var formData = new FormData();
            formData.append('_token', $('input[name="_token"]').val());
            formData.append('judulBuku', judulBuku);
            formData.append('kategori', kategori);
            formData.append('penerbit', penerbit);
            formData.append('tahunTerbit', tahunTerbit);
            formData.append('deskripsi', deskripsi);
            formData.append('fotoSampul', fotoSampul);
            formData.append('userid', idusr);
            formData.append('thterbit', thterbit);


            $.ajax({
                url: "{{ route('sendbuku') }}",
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    // Handle success response here
                    console.log('Form submitted successfully.');
                    console.log('Response:', response);

                    // If the response indicates successful book upload
                    if (response.message === 'Upload buku berhasil') {
                        // Show success message using SweetAlert
                        Swal.fire({
                            icon: 'success',
                            title: 'Buku berhasil diupload',
                            text: 'Buku berhasil diupload.',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            // Reload the page after the user clicks OK
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error submitting form:', error);
                    console.log('XHR:', xhr);
                    console.log('Status:', status);
                    // You can also check xhr.responseText for a more detailed error message
                    // console.log('Response Text:', xhr.responseText);

                    // Display a generic error message using SweetAlert or console log it
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'There was an error submitting the form. Please try again later.'
                    });
                }
            });

        });
    });
</script>


@endsection