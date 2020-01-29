-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  f_name TEXT NOT NULL,
  l_name TEXT NOT NULL,
  specialty TEXT
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  f_name TEXT NOT NULL,
  l_name TEXT NOT NULL,
  age TEXT NOT NULL,
  gender TEXT NOT NULL
);

CREATE TABLE appointments
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients (id),
  doctor_id INTEGER REFERENCES doctors (id),
  date_time TIMESTAMP NOT NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL,
  fatal Boolean NOT NULL  
);

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  appointment_id INTEGER REFERENCES appointments (id),
  diseases_id INTEGER REFERENCES diseases (id)
);