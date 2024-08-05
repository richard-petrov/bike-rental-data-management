-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.end_station
(
    end_station_id bigint NOT NULL,
    end_station_name text COLLATE pg_catalog."default",
    end_station_latitude double precision,
    end_station_longitude double precision,
    CONSTRAINT end_station_pkey PRIMARY KEY (end_station_id)
);

CREATE TABLE IF NOT EXISTS public.jc_ride
(
    index bigint NOT NULL,
    trip_duration bigint,
    start_time timestamp without time zone,
    stop_time timestamp without time zone,
    foreign_start_station_id bigint,
    foreign_end_station_id bigint,
    bike_id bigint,
    user_type text COLLATE pg_catalog."default",
    birth_year integer,
    gender bigint,
    CONSTRAINT jc_ride_pkey PRIMARY KEY (index)
);

CREATE TABLE IF NOT EXISTS public.na_station
(
    station_id text COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default",
    CONSTRAINT na_station_pkey PRIMARY KEY (station_id)
);

CREATE TABLE IF NOT EXISTS public.na_weather
(
    station text COLLATE pg_catalog."default",
    date text COLLATE pg_catalog."default" NOT NULL,
    awnd double precision,
    prcp double precision,
    snow double precision,
    snwd double precision,
    tavg bigint,
    tmax bigint,
    tmin bigint,
    wdf2 bigint,
    wdf5 integer,
    wsf2 double precision,
    wsf5 double precision,
    CONSTRAINT na_weather_pkey PRIMARY KEY (date)
);

CREATE TABLE IF NOT EXISTS public.start_station
(
    start_station_id bigint NOT NULL,
    start_station_name text COLLATE pg_catalog."default",
    start_station_latitude double precision,
    start_station_longitude double precision,
    CONSTRAINT start_station_pkey PRIMARY KEY (start_station_id)
);

ALTER TABLE IF EXISTS public.jc_ride
    ADD CONSTRAINT jc_ride_foreign_end_station_id_fkey FOREIGN KEY (foreign_end_station_id)
    REFERENCES public.end_station (end_station_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.jc_ride
    ADD CONSTRAINT jc_ride_foreign_start_station_id_fkey FOREIGN KEY (foreign_start_station_id)
    REFERENCES public.start_station (start_station_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.na_weather
    ADD CONSTRAINT na_weather_station_fkey FOREIGN KEY (station)
    REFERENCES public.na_station (station_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;