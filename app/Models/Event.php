<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = 'events';
    protected $primaryKey = 'event_id';
    protected $perPage = 10;

    protected $dates = ['start_date'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo|Category
     */
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'category_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne|Team
     */
    public function home()
    {
        return $this->hasOne(Team::class, 'team_id', 'home_team_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne|Team
     */
    public function visitors()
    {
        return $this->hasOne(Team::class, 'team_id', 'visitors_team_id');
    }

    public function getDateStartAttribute()
    {
        return $this->start_date->format('D., d.m.Y, H:i');
    }
}
