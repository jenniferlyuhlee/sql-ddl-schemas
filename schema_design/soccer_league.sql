-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;


CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    startdate DATE   NOT NULL,
    enddate DATE   NOT NULL
);

INSERT INTO season
    (startdate, enddate)
VALUES
    ('2023-08-01', '2024-05-15');


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    coach TEXT   NOT NULL,
    rank INT   NOT NULL
);

INSERT INTO teams
    (name, coach, rank)
VALUES
    ('Poland', 'Franciszek Smuda', 2),
    ('Czech Republic', 'Michael Bilek', 3),
    ('Greece', 'Fernando Santos', 1);


CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    team_id INT REFERENCES teams(id)
);

INSERT INTO players
    (name, team_id)
VALUES
    ('Robert Lewandowski', 1),
    ('Václav Pilar', 2),
    ('Dimitris Salpingidis', 3);


CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
);

INSERT INTO referees
    (name)
VALUES
    ('Alan Dzagoev'),
    ('Roman Advocaat');


CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    season_id INT REFERENCES season(id),
    gamedate DATE NOT NULL,
    location TEXT NOT NULL,
    team1_id INT REFERENCES teams(id),
    team1_score INT NOT NULL,
    team2_id INT REFERENCES teams(id),
    team2_score INT NOT NULL,
    referee_id INT REFERENCES referees(id),
    CHECK (team2_id != team1_id)
);

INSERT INTO games
    (season_id, gamedate, location, team1_id, team1_score, 
    team2_id, team2_score, referee_id)
VALUES
    (1, '2023-11-13', 'National Stadium, Warsaw', 1, 2, 3, 3, 1),
    (1, '2023-11-13', 'Stadion Miejski (Wroclaw)', 3, 1, 2, 2, 2);


CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    game_id INT REFERENCES games(id),
    player_id INT REFERENCES players(id),
    team_id INT REFERENCES teams(id)
);

INSERT INTO goals
    (game_id, player_id, team_id)
VALUES
    (1, 1, 1),
    (1, 3, 3),
    (2, 2, 2),
    (2, 2, 2);



