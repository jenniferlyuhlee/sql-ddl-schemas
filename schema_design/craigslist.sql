-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;


CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO region
    (name)
VALUES
    ('Seattle'),
    ('San Francisco'),
    ('Los Angeles'),
    ('Dallas'),
    ('Chicago'),
    ('New York'),
    ('Boston');


CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    username TEXT NOT NULL,
    pref_region INT REFERENCES region(id)
);

INSERT INTO users
    (name, username, pref_region)
VALUES
    ('Jennifer', 'jenbanana', 3),
    ('Breana', 'noseinabook', 6),
    ('Jacob', 'jocowboy123', 4),
    ('Drake', 'shoetrader', 7);


CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO categories
    (name)
VALUES
    ('cats'),
    ('job opps'),
    ('rescue dogs'),
    ('furniture sale'),
    ('NY apartments');


CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT   NOT NULL,
    content TEXT   NOT NULL,
    userid INT REFERENCES users(id),
    categoryid INT REFERENCES categories(id),
    location TEXT NOT NULL,
    regionid INT REFERENCES region(id)
);

INSERT INTO posts
    (title, content, userid, categoryid, location, regionid)
VALUES
    ('FOUND DOG', 'mixed breed, gray and brown', 1, 3, 'North Hollywood', 3),
    ('NEED A SUBLEASER', '1 room in 3 bed apartment available for June-August', 2, 5, 'Midtown Manhattan', 6);
