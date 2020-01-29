-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  mascot TEXT NOT NULL,
  coach TEXT NOT NULL,
  wins INTEGER NOT NULL,
  losses INTEGER NOT NULL,
  rank_id INTEGER REFERENCES rankings(id)
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER NOT NULL,
  jersey_number INTEGER NOT NULL,
  team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  date_time TIMESTAMP NOT NULL,
  stadium TEXT NOT NULL,
  winner TEXT NOT NULL,
  team1_id INTEGER REFERENCES teams(id),
  team2_id INTEGER REFERENCES teams(id),
  season_id INTEGER REFERENCES seasons(id)
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE matches_referees
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches(id),
  referee_id INTEGER REFERENCES referees(id)
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  champion_id INTEGER REFERENCES teams(id)
)

CREATE TABLE rankings 
(
  id SERIAL PRIMARY KEY,
)
