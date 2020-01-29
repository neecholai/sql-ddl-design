-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  f_name TEXT NOT NULL,
  l_name TEXT NOT NULL,
  area TEXT NOT NULL
  email TEXT NOT NULL
  phone TEXT 
);

CREATE TABLE areas
(
  id SERIAL PRIMARY KEY,
  state TEXT NOT NULL,
  region TEXT NOT NULL,
  city TEXT NOT NULL,
  neighborhood TEXT NOT NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL
  details TEXT NOT NULL,
  user_id INTEGER REFERENCES users_areas (id),
  category_id INTEGER REFERENCES categories (id)
);

CREATE TABLE areas_posts 
(
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts (id),
  area_id INTEGER REFERENCES areas (id),
)

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);
