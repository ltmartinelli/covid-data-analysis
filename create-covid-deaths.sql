-- Table: public.covid_deaths

-- DROP TABLE IF EXISTS public.covid_deaths;

CREATE TABLE IF NOT EXISTS public.covid_deaths
(
    iso_code character varying(50) COLLATE pg_catalog."default" NOT NULL,
    continent character varying(50) COLLATE pg_catalog."default",
    location character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    population bigint NOT NULL,
    total_cases bigint,
    new_cases bigint,
    new_cases_smoothed double precision,
    total_deaths bigint,
    new_deaths bigint,
    new_deaths_smoothed double precision,
    total_cases_per_million double precision,
    new_cases_per_million double precision,
    new_cases_smoothed_per_million double precision,
    total_deaths_per_million double precision,
    new_deaths_per_million double precision,
    new_deaths_smoothed_per_million double precision,
    reproduction_rate double precision,
    icu_patients bigint,
    icu_patients_per_million double precision,
    hosp_patients bigint,
    hosp_patients_per_million double precision,
    weekly_icu_admissions bigint,
    weekly_icu_admissions_per_million double precision,
    weekly_hosp_admissions bigint,
    weekly_hosp_admissions_per_million double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.covid_deaths
    OWNER to postgres;