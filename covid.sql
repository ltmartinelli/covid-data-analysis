/*

Covid 19 Data Exploration 

*/

-- Total Cases vs Total Deaths

SELECT location, date, total_cases,total_deaths, (total_deaths::float/total_cases::float)*100 as death_percentage
FROM covid_deaths
WHERE LOWER(location) LIKE '%brazil%'
order by 1,2


-- Total Cases vs Population

SELECT location, date, population, total_cases,  (total_cases::float/population::float)*100 as percent_population_infected
FROM covid_deaths
WHERE LOWER(location) like '%brazil%'
ORDER BY 1,2

-- Countries with the highest infection rate

SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX(total_cases::float/population::float)*100 AS infection_rate
FROM covid_deaths
WHERE total_cases IS NOT NULL AND continent IS NOT NULL
GROUP BY location, population
ORDER BY infection_rate DESC

-- Countries with the highest death count

SELECT location, MAX(total_deaths) AS highest_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY location
ORDER BY highest_death_count DESC

-- Highest death count by continent

SELECT continent,MAX(total_deaths) AS highest_death_count
FROM covid_deaths
WHERE 
	total_deaths IS NOT NULL 
	AND continent IS NOT NULL
GROUP BY continent
ORDER BY highest_death_count DESC

-- GLOBAL

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as death_percentage
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 1,2

-- Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null 
ORDER BY 2,3

-- Using CTE to perform calculation with previous query to obtain percentage of people vaccinated

WITH pop_vs_vac(continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
AS(
	SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null 
)
SELECT *, (rolling_people_vaccinated/population)*100 AS percentage_vaccinated
FROM pop_vs_vac

-- Creating View to store data for later visualizations

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null 