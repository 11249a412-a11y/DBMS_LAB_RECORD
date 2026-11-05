Aim:

To design and implement a Railway Reservation System for managing train, passenger and ticket booking information.

Algorithm:
1. Create a train table.
2. Create a passenger table.
3. Create a reservation table.
4. Establish relationships using foreign keys.
5. Insert train and passenger information.
6. Book tickets for passengers.
7. Display reservation details.
Code:CREATE TABLE e11c_trains (
    train_id NUMBER PRIMARY KEY,
    train_name VARCHAR2(40),
    source_station VARCHAR2(30),
    destination_station VARCHAR2(30)
);

CREATE TABLE e11c_passengers (
    passenger_id NUMBER PRIMARY KEY,
    passenger_name VARCHAR2(30)
);

CREATE TABLE e11c_reservations (
    booking_id NUMBER PRIMARY KEY,
    passenger_id NUMBER,
    train_id NUMBER,
    journey_date DATE,
    seat_no VARCHAR2(10),
    FOREIGN KEY (passenger_id)
        REFERENCES e11c_passengers(passenger_id),
    FOREIGN KEY (train_id)
        REFERENCES e11c_trains(train_id),
    UNIQUE (train_id, journey_date, seat_no)
);

INSERT INTO e11c_trains
VALUES (101, 'Chennai Express', 'Chennai', 'Bangalore');

INSERT INTO e11c_trains
VALUES (102, 'Coastal Express', 'Chennai', 'Pondicherry');

INSERT INTO e11c_passengers VALUES (1, 'Ravi');
INSERT INTO e11c_passengers VALUES (2, 'Priya');

INSERT INTO e11c_reservations
VALUES (1, 1, 101, DATE '2026-11-07', 'S1');

INSERT INTO e11c_reservations
VALUES (2, 2, 102, DATE '2026-11-07', 'S2');

SELECT
    p.passenger_name,
    t.train_name,
    r.seat_no
FROM e11c_reservations r
JOIN e11c_passengers p
ON r.passenger_id = p.passenger_id
JOIN e11c_trains t
ON r.train_id = t.train_id
ORDER BY r.booking_id;
Output:
PASSENGER_NAME  TRAIN_NAME       SEAT_NO
Ravi            Chennai Express  S1
Priya           Coastal Express  S2
