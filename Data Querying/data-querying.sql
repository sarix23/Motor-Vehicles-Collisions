-- Active: 1708361567891@@127.0.0.1@1433
/*Query Data*/
/*A.Observing the distribution of collisions across the five boroughs of New York City 
(Brooklyn, Manhattan, Queens, Staten Island, Bronx).*/
CREATE VIEW VIEWA AS 
SELECT borough, COUNT(*) AS total_collisions
FROM "MVC_DATA"
GROUP BY borough
ORDER BY TOTAL_COLLISIONS DESC;

/*B.Investigating the pre-collision dynamics to identify situations that may lead to collisions more frequently.*/
CREATE VIEW VIEWG AS
SELECT pre_crash, COUNT(*) AS total_collisions
FROM "MVC_DATA"
GROUP BY pre_crash
ORDER BY total_collisions DESC;

/*C.Evaluating which driving behaviours may increase the probability of a collision.*/
CREATE VIEW VIEWH AS 
SELECT contributing_factor, COUNT(*) AS total_collisions
FROM "MVC_DATA"
GROUP BY contributing_factor
ORDER BY total_collisions DESC;

/*D.Exploring the meteorological conditions in which collisions primarily occur.*/
CREATE VIEW weather_view AS
    SELECT
        wcr.zip_code,
        wcr.date,
        COUNT(DISTINCT CASE WHEN wcr.rain != 'No Rain' THEN wcr.time END) AS rain_hours,
        COUNT(DISTINCT CASE WHEN wcr.rain = 'No Rain' THEN wcr.time END) AS no_rain_hours,
        COUNT(DISTINCT CASE WHEN wcr.snowfall != 'No Snow' THEN wcr.time END) AS snow_hours,
        COUNT(DISTINCT CASE WHEN wcr.snowfall = 'No Snow' THEN wcr.time END) AS no_snow_hours,
        COUNT(DISTINCT CASE WHEN wcr.cloud_cover != 'No Cloud' THEN wcr.time END) AS cloud_hours,
        COUNT(DISTINCT CASE WHEN wcr.cloud_cover = 'No Cloud' THEN wcr.time END) AS no_cloud_hours
    FROM weather wcr
    GROUP BY wcr.zip_code, wcr.date;
CREATE VIEW collisions_view AS
    SELECT 
        wcr.zip_code,
        wcr.date,
        SUM(CASE WHEN wcr.rain != 'No Rain' THEN 1 ELSE 0 END) AS collision_with_rain,
        SUM(CASE WHEN wcr.rain = 'No Rain' THEN 1 ELSE 0 END) AS collision_no_rain,
        SUM(CASE WHEN wcr.snowfall != 'No Snow' THEN 1 ELSE 0 END) AS collision_with_snow,
        SUM(CASE WHEN wcr.snowfall = 'No Snow' THEN 1 ELSE 0 END) AS collision_no_snow,
        SUM(CASE WHEN wcr.cloud_cover != 'No Cloud' THEN 1 ELSE 0 END) AS collision_cloud,
        SUM(CASE WHEN wcr.cloud_cover = 'No Cloud' THEN 1 ELSE 0 END) AS collision_no_cloud
    FROM weather wcr
    INNER JOIN collisions cc ON wcr.zip_code = cc.zip_code AND wcr.date = cc.crash_date AND wcr.time = cc.crash_time
    GROUP BY wcr.zip_code,wcr.date;
CREATE VIEW rain_view as
SELECT
    wcr.zip_code,
    wcr.date,
    CASE WHEN wcr.rain_hours = 0 THEN 9999 ELSE ROUND(cc.collision_with_rain / CAST(wcr.rain_hours AS REAL), 4) END AS rain,
    CASE WHEN wcr.no_rain_hours = 0 THEN 9999 ELSE ROUND(cc.collision_no_rain / CAST(wcr.no_rain_hours AS REAL), 4) END AS not_rain
FROM weather_view wcr JOIN collisions_view cc ON wcr.zip_code = cc.zip_code and wcr.date = cc.date
group by wcr.zip_code, wcr.date
having rain != 9999 and not_rain != 9999;
CREATE VIEW snow_view as
SELECT  
    wcr.zip_code,
    wcr.date,
    CASE WHEN wcr.snow_hours = 0 THEN 9999 ELSE ROUND(cc.collision_with_snow / CAST(wcr.snow_hours AS REAL), 4) END AS snow,
    CASE WHEN wcr.no_snow_hours = 0 THEN 9999 ELSE ROUND(cc.collision_no_snow / CAST(wcr.no_snow_hours AS REAL), 4) END AS not_snow
FROM weather_view wcr JOIN collisions_view cc ON wcr.zip_code = cc.zip_code and wcr.date = cc.date
group by wcr.zip_code, wcr.date
having snow != 9999 and not_snow != 9999;
create VIEW cloud_view AS
select 
    wcr.zip_code,
    wcr.date,
    CASE WHEN wcr.cloud_hours = 0 THEN 9999 ELSE ROUND(cc.collision_cloud / CAST(wcr.cloud_hours AS REAL), 4) END AS cloud,
    CASE WHEN wcr.no_cloud_hours = 0 THEN 9999 ELSE ROUND(cc.collision_no_cloud / CAST(wcr.no_cloud_hours AS REAL), 4) END AS not_cloud
FROM weather_view wcr JOIN collisions_view cc ON wcr.zip_code = cc.zip_code and wcr.date = cc.date
group by wcr.zip_code, wcr.date
having cloud != 9999 and not_cloud != 9999;

create VIEW rain_mean AS
    SELECT AVG(rain) AS rain_index,
        AVG(not_rain) as no_rain_index
        FROM rain_view;

create VIEW snow_mean AS
    SELECT AVG(snow) AS snow_index,
        AVG(not_snow) as no_snow_index
        FROM snow_view;

create VIEW cloud_mean AS
    SELECT AVG(cloud) AS cloud_index,
        AVG(not_cloud) as no_cloud_index
        FROM cloud_view;

CREATE VIEW weather_indices AS
SELECT 'rain_index' AS weather_index, rain_index AS index_value FROM rain_mean
UNION ALL
SELECT 'no_rain_index', no_rain_index FROM rain_mean
UNION ALL
SELECT 'snow_index', snow_index FROM snow_mean
UNION ALL
SELECT 'no_snow_index', no_snow_index FROM snow_mean
UNION ALL
SELECT 'cloud_index', cloud_index FROM cloud_mean
UNION ALL
SELECT 'no_cloud_index', no_cloud_index FROM cloud_mean; 

/*E.Verifying if there are certain days of the week or holidays when collisions occur more frequently, 
and if there is a variation compared to the daily average.*/
CREATE VIEW VIEWL AS
SELECT Day,
    COUNT(*) AS total_collisions
FROM MVC_DATA
GROUP BY Day
ORDER BY total_collisions;

/*F.Analysing if there are specific moments of the day when there is a higher concentration of collisions.*/
CREATE VIEW VIEWN AS
SELECT day_period,
    COUNT(*) AS total_collisions
FROM MVC_DATA
GROUP BY day_period
ORDER BY total_collisions;