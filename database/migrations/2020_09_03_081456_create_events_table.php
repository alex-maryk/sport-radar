<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->increments('event_id');
            $table->unsignedInteger('category_id', false);
            $table->unsignedInteger('home_team_id', false);
            $table->unsignedInteger('visitors_team_id', false);
            $table->dateTime('start_date');

            $table->foreign('category_id', '_fk--events-category_id--category-category_id')
                ->on('categories')
                ->references('category_id')
                ->onDelete('cascade');

            $table->foreign('home_team_id', '_fk--events-home_team_id--teams-team_id')
                ->on('teams')
                ->references('team_id')
                ->onDelete('cascade');

            $table->foreign('visitors_team_id', '_fk--events-visitors_team_id--teams-team_id')
                ->on('teams')
                ->references('team_id')
                ->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
