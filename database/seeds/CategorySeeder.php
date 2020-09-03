<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = collect([
            'Football', 'Basketball', 'Ice Hockey',
        ]);

        $categories->each(function ($category) {
            DB::table('categories')
                ->insert([
                    'name' => $category,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
        });

    }
}
