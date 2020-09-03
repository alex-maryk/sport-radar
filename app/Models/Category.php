<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';
    protected $primaryKey = 'category_id';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|Team[]
     */
    public function teams()
    {
        return $this->hasMany(Team::class, 'category_id', 'category_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|Event[]
     */
    public function events()
    {
        return $this->hasMany(Event::class, 'category_id', 'category_id');
    }
}
