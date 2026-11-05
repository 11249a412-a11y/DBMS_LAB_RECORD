Aim:

To design and implement a Timetable Management System for storing subjects, teachers and class schedules.

Algorithm:
1. Create a teacher table.
2. Create a subject table.
3. Create a timetable table.
4. Establish relationships between the tables.
5. Insert teacher and subject details.
6. Assign periods and classrooms.
7. Retrieve the timetable using JOIN.
Code:CREATE TABLE e11d_teachers (
    teacher_id NUMBER PRIMARY KEY,
    teacher_name VARCHAR2(30)
);

CREATE TABLE e11d_subjects (
    subject_id NUMBER PRIMARY KEY,
    subject_name VARCHAR2(30),
    teacher_id NUMBER,
    FOREIGN KEY (teacher_id)
        REFERENCES e11d_teachers(teacher_id)
);

CREATE TABLE e11d_timetable (
    slot_id NUMBER PRIMARY KEY,
    subject_id NUMBER,
    day_name VARCHAR2(15),
    period_no NUMBER,
    room_no VARCHAR2(15),
    FOREIGN KEY (subject_id)
        REFERENCES e11d_subjects(subject_id),
    UNIQUE (day_name, period_no, room_no)
);

INSERT INTO e11d_teachers VALUES (1, 'Meena');
INSERT INTO e11d_teachers VALUES (2, 'Arun');

INSERT INTO e11d_subjects VALUES (101, 'DBMS', 1);
INSERT INTO e11d_subjects VALUES (102, 'OS', 2);

INSERT INTO e11d_timetable
VALUES (1, 101, 'Monday', 1, 'Lab1');

INSERT INTO e11d_timetable
VALUES (2, 102, 'Monday', 2, 'Lab1');

SELECT
    t.day_name,
    t.period_no,
    s.subject_name,
    a.teacher_name,
    t.room_no
FROM e11d_timetable t
JOIN e11d_subjects s
ON t.subject_id = s.subject_id
JOIN e11d_teachers a
ON s.teacher_id = a.teacher_id
ORDER BY t.day_name, t.period_no;

Output:
DAY_NAME  PERIOD_NO  SUBJECT_NAME  TEACHER_NAME  ROOM_NO
Monday    1          DBMS          Meena         Lab1
Monday    2          OS            Arun          Lab1
