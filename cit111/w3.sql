SELECT Name, Continent, SurfaceArea
FROM world.country
WHERE SurfaceArea < 500
ORDER BY SurfaceArea DESC;
