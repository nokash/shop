<?php

use App\Order;
use App\Product;
use App\Supplier;
use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Supplier::truncate();

        $productQuantity = 20;

        factory(Order::class, $productQuantity)->create();
    }
}
