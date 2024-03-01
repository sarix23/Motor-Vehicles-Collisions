-- Active: 1707688166984@@127.0.0.1@1433
/*DATA QUALITY*/
/*MVC_DATA*/
/*Completeness*/
SELECT 'unique_id' AS VARIABLE, SUM(CASE WHEN borough = '' THEN 1 ELSE 0 END) AS NULL_COUNT FROM MVC_DATA
UNION ALL
SELECT 'borough', SUM(CASE WHEN borough = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'zip_code', SUM(CASE WHEN zip_code = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'crash_date', SUM(CASE WHEN crash_date = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'crash_time', SUM(CASE WHEN crash_time = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'number_of_persons_injured', SUM(CASE WHEN number_of_persons_injured = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'number_of_persons_killed', SUM(CASE WHEN number_of_persons_killed = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'day_period', SUM(CASE WHEN day_period = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'pre_crash', SUM(CASE WHEN TRIM(pre_crash) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'vehicle_occupants', SUM(CASE WHEN TRIM(vehicle_occupants) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'contributing_factor', SUM(CASE WHEN TRIM(contributing_factor) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'driver_license_status', SUM(CASE WHEN TRIM(driver_license_status) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'day', SUM(CASE WHEN day = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'flag_holiday', SUM(CASE WHEN flag_holiday = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'cloud_cover', SUM(CASE WHEN TRIM(cloud_cover) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'rain', SUM(CASE WHEN TRIM(rain) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'relative_humidity_2m', SUM(CASE WHEN relative_humidity_2m IS NULL THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'snowfall', SUM(CASE WHEN TRIM(snowfall) = '' THEN 1 ELSE 0 END) FROM MVC_DATA
UNION ALL
SELECT 'temperature_2m', SUM(CASE WHEN temperature_2m IS NULL THEN 1 ELSE 0 END) FROM MVC_DATA;

/*Syntactic Accuracy for Borough and Day*/
SELECT DISTINCT borough
FROM "MVC_DATA"
GROUP BY borough;

SELECT DISTINCT day
FROM "MVC_DATA"
GROUP BY day;

/*Primary Key Consistency*/
SELECT COUNT(*) AS unique_id_duplicate
FROM (
    SELECT unique_id
    FROM MVC_DATA
    GROUP BY unique_id
    HAVING COUNT(*) > 1
) AS duplicates;
