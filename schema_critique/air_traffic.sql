-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airlines 
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Amvianca Brasil');


CREATE TABLE location
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

INSERT INTO location
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Tokyo', 'Japan'),
  ('Beijing', 'China'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('Casablanca', 'Morocco'),
  ('Sao Paolo', 'Brazil'),
  ('Mexico City', 'Mexico'),
  ('Santiago', 'Chile'),
  ('London', 'United Kingdom');

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

INSERT INTO flight
  (departure, arrival)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00');


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passengers(id),
  seat TEXT NOT NULL,
  flight_id INT REFERENCES flight(id),
  airline_id INT REFERENCES airlines(id),
  from_id INT REFERENCES location(id),
  to_id INT REFERENCES location(id)
);

INSERT INTO tickets
  (passenger_id, seat, flight_id, airline_id, from_id, to_id)
VALUES
  (1, '33B', 1, 1, 1, 2),
  (2, '8A', 2, 2, 10, 18),
  (3, '12F', 3, 3, 3, 4),
  (1, '20A', 4, 3, 2, 16),
  (4, '23D', 5, 4, 12, 14),
  (5, '18C', 6, 5, 13, 11),
  (6, '9E', 7, 1, 5, 6),
  (7, '1A', 8, 6, 7, 8),
  (6, '32B', 9, 6, 6, 9),
  (8, '10D', 10, 7, 15, 17);