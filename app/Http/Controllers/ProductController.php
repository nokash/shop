<?php

namespace App\Http\Controllers;

use App\Product;
use App\SupplierProduct;
use Illuminate\Http\Request;
use DB;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            'id' => 'required|unique:products|integer',
            'name' => 'required',
            'description' => 'required',
            'supplier_id' => 'required',
            'quantity' => 'required'
        ]);

        $product = new Product;
        $product->name = $request->input('name');
        $product->id = $request->input('id');
        $product->description = $request->input('description');
        $product->quantity = $request->input('quantity');

        $supplier_product = new SupplierProduct;
        $supplier_product->supplier_id =$request->input('supplier_id');
        $supplier_product->product_id = $request->input('id');


        $product->save();

        $supplier_product->save();

        return $product;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function all(Product $product)
    {
            $product = Product::all();

            return ($product);
            // return ($products);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function detailed(Product $product_details)
    {
        $product_details = DB::table('supplier_products')
            ->join('products', 'supplier_products.product_id', '=','products.id')
            ->join('suppliers', 'supplier_products.supplier_id', '=', 'suppliers.id')
            ->select('supplier_products.id', 'products.id as product_id', 'suppliers.name as supplier', 'products.name', 'products.quantity', 'products.description')
            ->orderBy('products.id', 'DESC')
            ->get();
            return response()->json(['error' => false, 'data' => $product_details]);
        }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $product)
    {
        $this->validate($request, [

            'name' => 'required',
            'description' => 'required',
            'quantity' => 'required'
        ]);

        $product = Product::find($product);;
        $product->name = $request->input('name');
        $product->description = $request->input('description');
        $product->quantity = $request->input('quantity');
        $product->save();

        return $product;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        SupplierProduct::destroy($id);

        return response()->json("ok");

    }


    public function lastMile(){
        $id = DB::table('products')->orderBy('id', 'DESC')->first();
        return response()->json($id);
    }
}
