@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
          <product-component></product-component>
        </div>
        <div class="col-md-6">
            <products-component></products-component>
        </div>
    </div>
</div>
@endsection
