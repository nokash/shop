<?php

namespace App\Http\Controllers;

use App\Order;
use App\OrderDetails;
use Illuminate\Http\Request;
use DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function all()
    {
        $orders = Order::all();

        return response()->json(['error' => false, 'data' => $orders]);
    }

    public function detailed()
    {
        $orders = DB::table('order_details')
            ->join('orders', 'order_details.order_id', '=','orders.id')
            ->join('products', 'order_details.product_id', '=', 'products.id')
            ->select('order_details.id', 'orders.order_number', 'orders.created_at', 'products.name', 'products.description')
            ->get();

        return response()->json(['error' => false, 'data' => $orders]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $detail = $request->input('products');

        $this->validate($request, [
            // 'id' => 'required|unique:orders',
            'order_number' => 'required',
            'product_id' => 'required',
            'order_id' => 'required'
        ]);

        $order = new Order;
        $order->order_number = $request->input('order_number');
        $order->save();

        foreach($detail as $detail){
            $order_dts = new OrderDetails;
            $order_dts->order_id = $request->input('order_id');
            $order_dts->product_id = $detail;

            $order_dts->save();
        }

        return $order;
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
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Order::destroy($id);

        return response()->json("ok");

    }


    public function lastMile(){
        $id = DB::table('orders')->orderBy('id', 'DESC')->first();
        return response()->json($id);
    }
}
