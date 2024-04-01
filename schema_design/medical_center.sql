--Schema plan:
--https://docs.google.com/spreadsheets/d/1erHx33CmJ9eREXWAGu-RMkZDo6NI_6mBuZ_R6MuaDmc/edit#gid=0

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialization TEXT NOT NULL
);

INSERT INTO doctors
    (first_name, last_name, specialization)
VALUES 
    ('Jennifer', 'Lee', 'pediatrics'),
    ('Gary', 'Connor', 'cardiology'),
    ('Daniel', 'Charles', 'general'),
    ('Sarah', 'Schilling', 'gynecology');


CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birthdate DATE NOT NULL,
  contact TEXT NOT NULL
);

INSERT INTO patients
    (first_name, last_name, birthdate, contact)
VALUES 
    ('Carol', 'Dwecker', '1954-10-06', '213-849-2640'),
    ('Shane', 'Golde', '1987-02-22', '310-183-7264'),
    ('Helen', 'Carrillo', '1974-09-14', '561-202-4595'),
    ('Jorge', 'Blackburn', '1995-07-03', '310-241-6904'),
    ('Emma', 'Marte', '2022-04-28', '213-341-6153');

CREATE TABLE diseases(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO diseases
    (name)
VALUES
    ('anemia'),
    ('bronchitis'),
    ('strep throat'),
    ('high blood pressure'),
    ('depression'),
    ('anxiety'),
    ('preeclampsia'),
    ('irritable bowel syndrome'),
    ('constipation');


CREATE TABLE visits(
  id SERIAL PRIMARY KEY,
  visit_date DATE NOT NULL,
  doctor_id INTEGER REFERENCES doctors (id),
  patient_id INTEGER REFERENCES patients (id)
);

INSERT INTO visits
    (visit_date, doctor_id, patient_id)
VALUES
    ('2024-01-13', 1, 5),
    ('2024-01-14', 3, 2),
    ('2024-02-06', 3, 1),
    ('2024-03-11', 2, 1),
    ('2024-03-17', 4, 3),
    ('2024-03-20', 3, 3),
    ('2024-03-22', 2, 4);


CREATE TABLE diagnoses(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits(id),
  patient_id
  disease_id INTEGER REFERENCES diseases (id)
);

INSERT INTO diagnoses
    (visit_id, disease_id)
VALUES
    (1, 1),
    (1, 3),
    (1, 6),
    (2, 8),
    (3, 9),
    (4, 4),
    (5, 7),
    (5, 4),
    (6, 9),
    (7, 4);





