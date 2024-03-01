-- Active: 1708361567891@@127.0.0.1@1433
/*DATA INTEGRATION*/
CREATE VIEW MVC_DATA
AS
SELECT A.* 
    , B.unique_id
    , B.pre_crash
    , B.vehicle_occupants
    , B.contributing_factor_1 as contributing_factor
    , B.driver_license_status
    , C.day
    , C.flag_holiday
    , D.cloud_cover
    , D.rain
    , D.relative_humidity_2m
    , D.snowfall
    , D.temperature_2m
FROM "COLLISIONS" AS A 
INNER JOIN "VEHICLES" AS B 
ON A.collision_id = B.collision_id
INNER JOIN "CALENDAR" as C 
ON A.crash_date = C."date"
INNER JOIN "WEATHER" AS D 
ON A.crash_date = D."date"
    AND A.crash_time = D.time
    AND A.zip_code = D.zip_code;

