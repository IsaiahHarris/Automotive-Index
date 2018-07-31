DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars
OWNER = indexed_cars_user;

\c indexed_cars

\i scripts/car_models.sql

\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql

\timing

SELECT DISTINCT ON (make_title) make_title FROM car_models
WHERE make_code = 'LAM';
--time 25ms

SELECT DISTINCT ON (model_title) model_title FROM car_models
WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
--time 21ms

SELECT make_code, model_code, model_title, year FROM car_models
WHERE make_code = 'LAM';
--time 18ms

SELECT * FROM car_models 
WHERE year BETWEEN 2010 AND 2015;
--time 62ms

SELECT * FROM car_models 
WHERE year = 2010;
--time 29ms

-- CREATE INDEX idx_car_models 
-- ON car_models (make_code);

-- SELECT DISTINCT ON (make_title) make_title FROM car_models
-- WHERE make_code = 'LAM';
-- --time 1ms

-- SELECT DISTINCT ON (model_title) model_title FROM car_models
-- WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
-- --time 1 ms

-- SELECT make_code, model_code, model_title, year FROM car_models
-- WHERE make_code = 'LAM';
-- --1ms

-- SELECT * FROM car_models
-- WHERE year BETWEEN 2010 AND 2015;
-- --60ms

-- SELECT * FROM car_models 
-- WHERE year = 2010;
-- --27ms

