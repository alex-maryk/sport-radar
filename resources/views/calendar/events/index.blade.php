@extends('app')
@section('title')
    Events Calendar
@endsection
@section('content')
    <table class="table">
        <tbody>
        @foreach($result AS $event)
        <tr>
            <td>{{ \Carbon\Carbon::createFromTimeString($event->start_date)->format('D., d.m.Y, H:i') }}</td>
            <td><a href="{{ route('event.list', ['category' => $event->category_id]) }}">{{ $event->category }}</a></td>
            <td><a href="{{ route('event.list', ['team' => $event->home_id]) }}">{{ $event->home_name }}</a>  - <a href="{{ route('event.list', ['team' => $event->visitors_id]) }}">{{ $event->visitors_name }}</a></td>
        </tr>
        @endforeach
        </tbody>
    </table>
    {{ $result->links() }}
@endsection
