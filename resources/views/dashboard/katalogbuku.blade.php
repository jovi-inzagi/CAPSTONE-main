@extends('dashboard.dashboard')

@section('content')
<div class="row justify-content-center">
    <p class="text-center">Daftar Buku Terbaru Minggu Ini</p>
    @foreach ($features as $key => $items)
    <div class="card" style="width:400px;margin:10px">
    <img class="card-img-top" src="{{ asset('img/' . $items['img']) }}" style="height: 200px; width: auto; display: block; margin: 0 auto;" alt="Card image">
        <div class="card-body">
            <h4 class="card-title">{{$items['judul']}}</h4>
            <p class="card-text">{{$items['kategori']}}</p>
            <a href="/detail/{{$items['id']}}" target="_blank" class="btn btn-primary">Detail Buku</a>
        </div>
    </div>
    @endforeach
</div>

<div class="row">
    <table class="table table-primary" id="buku">
        <thead>

        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<script>
    var buku = <?php echo json_encode($buku); ?>;

var dataBuku = $('#buku').DataTable({
    columns: [
        {
            title: 'ID',
            data: 'id'
        },
        {
            title: 'Judul',
            data: 'judul'
        },
        {
            title: 'Tahun Terbit',
            data: 'tahun_terbit'
        },
        {
            title: 'Penerbit',
            data: 'penerbit'
        },
        {
            title: 'Actions',
            render: function(data, type, row, meta) {
                var buttons =
                    '<form action="/detail/' + row.id + '" method="GET" class="form-inline" style="display: inline;" target="_blank">' +
                    '<button class="button button-green">Pinjam Buku</button>' +
                    '</form>';
                return buttons;
            }
        }
    ],
});

dataBuku.clear().rows.add(buku).draw();

</script>

@endsection