<?php

use Illuminate\Database\Seeder;
use App\Models\Team;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class EventSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = Category::all()->pluck('category_id');
        $teams = Team::all()->map(function ($item) {
            return $item->only(['team_id', 'category_id']);
        });

        for ( $i = 1; $i <= 50; $i++ ) {
            $categoryId = $categories->random();

            $allowedTeams = $teams->filter(function ($team) use ( $categoryId ) {
                return $team['category_id'] == $categoryId;
            });

            $homeTeamId = $allowedTeams->random()['team_id'];
            $visitorTeamId = $allowedTeams->filter(function ($team) use ( $homeTeamId ) {
                return $team['team_id'] != $homeTeamId;
            })->random()['team_id'];

            $startDate = Carbon::now()->startOfDay()->getTimestamp() + mt_rand(1, 750) * (15 * 60);

            DB::table('events')->insert([
                'category_id' => $categoryId,
                'home_team_id' => $homeTeamId,
                'visitors_team_id' => $visitorTeamId,
                'start_date' => Carbon::createFromTimestamp($startDate)->toDateTime(),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
