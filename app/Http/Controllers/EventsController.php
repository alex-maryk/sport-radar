<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EventsController extends Controller
{
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $query = DB::table('events AS e')
            ->join('categories AS c', 'e.category_id', '=', 'c.category_id')
            ->join('teams AS h', 'e.home_team_id', '=', 'h.team_id')
            ->join('teams AS v', 'e.visitors_team_id', '=', 'v.team_id')
            ->select([
                'e.start_date',
                'c.category_id AS category_id',
                'c.name AS category',
                'h.team_id AS home_id',
                'h.name AS home_name',
                'v.team_id AS visitors_id',
                'v.name AS visitors_name'
            ])
            ->orderBy('e.start_date', 'ASC');

        if ( $request->query->has('category') ) {
            $query->where('c.category_id', '=', (int)$request->query->get('category'));
        }

        if ( $request->query->has('team') ) {
            $query->where('h.team_id', '=', (int)$request->query->get('team'))
                ->orWhere('v.team_id', '=', (int)$request->query->get('team'));
        }

        $result = $query
            ->paginate(10);


        $result->withPath(route('event.list', collect($request->query->all())->except('page')->toArray()));

        return view('calendar.events.index', [
            'result' => $result,
        ]);
    }
}
