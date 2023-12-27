-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space
-- Drop existing database if it exists
DROP DATABASE IF EXISTS outer_space;

-- Create a new database
CREATE DATABASE outer_space;

-- Connect to the new database
\c outer_space

-- Create the planet table
CREATE TABLE planet
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  orbital_period NUMERIC NOT NULL,
  orbits_around VARCHAR(100) NOT NULL,
  galaxy VARCHAR(100) NOT NULL
);

-- Create the moon table
CREATE TABLE moon
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  planet_id INT REFERENCES planet(id)
);

-- Insert data into the planet table
INSERT INTO planet
  (name, orbital_period, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

-- Insert data into the moon table
INSERT INTO moon
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Proxima Centauri b Moon', 5),
  ('Gliese 876 b Moon', 6);
