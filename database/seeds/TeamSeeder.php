<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Category;
use Carbon\Carbon;

class TeamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $teams = collect([
            'Real Madrid', 'FC Barcelona', 'Manchester United',
            'Arsenal', 'FC Rapid', 'FC Salzburg',
            'Bayern Munich', 'Borussia Dortmund', 'Liverpool',
            'AC Milan', 'Inter', 'Lazio',
        ]);

        $categories = Category::all()->pluck('category_id');

        $teams->each(function ($team) use ( $categories ) {
            DB::table('teams')->insert([
                'name' => $team,
                'category_id' => $categories->random(),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        });

    }
}
