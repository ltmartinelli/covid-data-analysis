-- Table: public.covid_vaccinations

-- DROP TABLE IF EXISTS public.covid_vaccinations;

CREATE TABLE IF NOT EXISTS public.covid_vaccinations
(
    iso_code character varying(50) COLLATE pg_catalog."default" NOT NULL,
    continent character varying(50) COLLATE pg_catalog."default",
    location character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    total_tests bigint,
    new_tests bigint,
    total_tests_per_thousand double precision,
    new_tests_per_thousand double precision,
    new_tests_smoothed double precision,
    new_tests_smoothed_per_thousand double precision,
    positive_rate double precision,
    tests_per_case double precision,
    tests_units character varying(50) COLLATE pg_catalog."default",
    total_vaccinations bigint,
    people_vaccinated bigint,
    people_fully_vaccinated bigint,
    total_boosters bigint,
    new_vaccinations bigint,
    new_vaccinations_smoothed double precision,
    total_vaccinations_per_hundred double precision,
    people_vaccinated_per_hundred double precision,
    people_fully_vaccinated_per_hundred double precision,
    total_boosters_per_hundred double precision,
    new_vaccinations_smoothed_per_million bigint,
    new_people_vaccinated_smoothed bigint,
    new_people_vaccinated_smoothed_per_hundred double precision,
    stringency_index double precision,
    population_density double precision,
    median_age double precision,
    aged_65_older double precision,
    aged_70_older double precision,
    gdp_per_capita double precision,
    extreme_poverty double precision,
    cardiovasc_death_rate double precision,
    diabetes_prevalence double precision,
    female_smokers double precision,
    male_smokers double precision,
    handwashing_facilities double precision,
    hospital_beds_per_thousand double precision,
    life_expectancy double precision,
    human_development_index double precision,
    excess_mortality_cumulative_absolute double precision,
    excess_mortality_cumulative double precision,
    excess_mortality double precision,
    excess_mortality_cumulative_per_million double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.covid_vaccinations
    OWNER to postgres;