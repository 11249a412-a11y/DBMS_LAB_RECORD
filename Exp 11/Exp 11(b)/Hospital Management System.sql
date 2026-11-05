Aim:

To design and implement a Hospital Management System to store patient details, doctor information and appointment records.

Algorithm:
1. Create a patient table.
2. Create a doctor table.
3. Create an appointment table.
4. Establish relationships between the tables.
5. Insert patient, doctor and appointment details.
6. Retrieve appointment information using JOIN.
Code:CREATE TABLE e11b_patients (
    patient_id NUMBER PRIMARY KEY,
    patient_name VARCHAR2(30),
    age NUMBER
);

CREATE TABLE e11b_doctors (
    doctor_id NUMBER PRIMARY KEY,
    doctor_name VARCHAR2(30),
    specialization VARCHAR2(30)
);

CREATE TABLE e11b_appointments (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER,
    doctor_id NUMBER,
    visit_date DATE,
    FOREIGN KEY (patient_id)
        REFERENCES e11b_patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES e11b_doctors(doctor_id)
);

INSERT INTO e11b_patients VALUES (1, 'Ravi', 30);
INSERT INTO e11b_patients VALUES (2, 'Priya', 25);

INSERT INTO e11b_doctors
VALUES (1, 'Meera', 'Cardiology');

INSERT INTO e11b_doctors
VALUES (2, 'Arun', 'General');

INSERT INTO e11b_appointments
VALUES (1, 1, 1, DATE '2026-11-05');

INSERT INTO e11b_appointments
VALUES (2, 2, 2, DATE '2026-11-06');

SELECT
    p.patient_name,
    d.doctor_name,
    TO_CHAR(a.visit_date, 'YYYY-MM-DD') AS visit_date
FROM e11b_appointments a
JOIN e11b_patients p
ON a.patient_id = p.patient_id
JOIN e11b_doctors d
ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_id;

Output:PATIENT_NAME  DOCTOR_NAME  VISIT_DATE
Ravi          Meera        2026-11-05
Priya         Arun         2026-11-06
