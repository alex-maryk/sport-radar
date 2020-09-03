<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $table = 'teams';
    protected $primaryKey = 'team_id';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo|Category
     */
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'category_id');
    }
}
