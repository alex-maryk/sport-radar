## Sportradar

**Instructions**
1. Clone this repository
2. Copy configuration file 
`cp .env.example .env`
3. Change database credentials in file .env
4. Import data into database from file **sport-radar.sql** 
or use default Laravel migration  `php artisan migrate --seed`

**Filters**
1. Pagination is fully functionally
2. For filter data by team or category - click on needed item

P.S. Retrieve data from database can in different ways (Eloquent, DB::table, raw queries DB::raw). If other ways are important for this task tell me and I do it ASAP. 
