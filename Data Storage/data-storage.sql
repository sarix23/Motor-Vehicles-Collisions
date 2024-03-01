-- Active: 1707688166984@@127.0.0.1@1433

CREATE TABLE COLLISIONS (
    collision_id INT PRIMARY KEY,
    borough VARCHAR(255),
    zip_code INT,
    crash_date DATE,
    crash_time TIME,
    number_of_persons_injured INT,
    number_of_persons_killed INT,
    day_period VARCHAR(255)
);
CREATE TABLE VEHICLES (
    unique_id INT PRIMARY KEY,
    collision_id INT,
    pre_crash VARCHAR(255),
    vehicle_occupants INT,
    contributing_factor_1 VARCHAR(255),
    driver_license_status VARCHAR(255),
    FOREIGN KEY (collision_id) REFERENCES COLLISIONS(collision_id)
);
CREATE TABLE WEATHER (
    date DATE,
    time TIME,
    zip_code INT,
    temperature_2m INT,
    relative_humidity_2m FLOAT,
    rain VARCHAR(255),
    snowfall VARCHAR(255),
    cloud_cover VARCHAR(255),
    unique(date, time, zip_code),
    FOREIGN KEY (date) REFERENCES COLLISIONS(crash_date),
    FOREIGN KEY (time) REFERENCES COLLISIONS(crash_time),
    FOREIGN KEY (zip_code) REFERENCES COLLISIONS(zip_code)
);
CREATE TABLE CALENDAR (
    date DATE PRIMARY KEY,
    day VARCHAR(255),
    flag_holiday BOOLEAN,
    FOREIGN KEY (date) REFERENCES COLLISIONS(crash_date)
);
