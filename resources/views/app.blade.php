<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style type="text/css">
        body {
            padding-top: 25px;
        }
        .starter-template {
            padding: 20px 15px;
            text-align: center;
        }
    </style>
</head>
<body>
<main role="main">
    <section class="text-center flex-row">
        <div class="container">
            <h1>@yield('title')</h1>
            @yield('content')
        </div>
    </section>
</main>

</body>
</html>
