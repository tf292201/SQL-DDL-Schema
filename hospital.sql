


DROP DATABASE IF EXISTS hospital_db;

CREATE DATABASE hospital_db;

\c hospital_db


-- Create Doctor Table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    contact_info VARCHAR(50)
);

-- Create Patient Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    date_of_birth DATE,
    contact_info VARCHAR(50)
);

-- Create Visit Table
CREATE TABLE Visit (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    prescription TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Create Diagnosis Table
CREATE TABLE Diagnosis (
    diagnosis_id INT PRIMARY KEY,
    visit_id INT,
    disease_name VARCHAR(100),
    FOREIGN KEY (visit_id) REFERENCES Visit(visit_id)
);
