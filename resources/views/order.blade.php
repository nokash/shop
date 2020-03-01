
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6" style="height: 32rem; overflow-y: scroll">
          <order-component></order-component>
        </div>
        <div class="col-md-2" style="height: 32rem; overflow-y: scroll">
            <h2>Hum</h2>
          </div>
        <div class="col-md-4" style="height: 32rem; overflow-y: scroll">
            <orderdisplay-component></orderdisplay-component>
        </div>
    </div>
</div>
@endsection
