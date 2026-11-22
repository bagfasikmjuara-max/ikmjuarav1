<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Halaman Tidak Ditemukan - IKM JUARA</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Arvo:wght@400;700&family=Plus+Jakarta+Sans:wght@700;800;900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', 'Arvo', serif;
            background-color: #ffffff;
        }
        .page_404 {
            padding: 40px 0;
            background: #fff;
        }
        .four_zero_four_bg {
            background-image: url('https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif');
            height: 400px;
            background-position: center;
            background-repeat: no-repeat;
        }
        .four_zero_four_bg h1 {
            font-size: 80px;
            font-family: 'Arvo', serif;
        }
        .link_404 {
            color: #fff !important;
            padding: 14px 32px;
            background: #10b981;
            margin: 20px 0;
            display: inline-block;
            border-radius: 16px;
            font-weight: 800;
            font-size: 14px;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            box-shadow: 0 10px 25px -5px rgba(16, 185, 129, 0.4);
            transition: all 0.3s ease;
        }
        .link_404:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 15px 30px -5px rgba(16, 185, 129, 0.5);
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen p-4 bg-white select-none">
    <section class="page_404 w-full max-w-3xl text-center">
        <div class="container mx-auto">
            <div class="four_zero_four_bg flex items-start justify-center pt-2">
                <h1 class="text-center font-black text-slate-800 tracking-wider select-none">404</h1>
            </div>
            
            <div class="contant_box_404 -mt-12 space-y-3">
                <h3 class="text-2xl sm:text-3xl font-black text-slate-800">
                    Waduh! Sepertinya Anda Tersesat
                </h3>
                
                <p class="text-slate-500 font-medium text-sm sm:text-base max-w-md mx-auto">
                    Halaman yang Anda cari tidak tersedia atau sudah dipindahkan.
                </p>
                
                <a href="{{ url('/') }}" class="link_404">
                    Kembali Ke Beranda
                </a>
            </div>
        </div>
    </section>
</body>
</html>
