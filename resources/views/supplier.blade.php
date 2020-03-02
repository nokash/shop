@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
          <supplier-component></supplier-component>
        </div>
        <div class="col-md-4" style="height: 32rem; overflow-y: scroll">
            <supplierdisplay-component></supplierdisplay-component>
        </div>
    </div>
</div>
@endsection
