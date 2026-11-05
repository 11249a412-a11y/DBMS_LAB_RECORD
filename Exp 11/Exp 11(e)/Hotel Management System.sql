Aim:

To design and implement a Hotel Management System to manage room details, guest information, bookings and bill calculation.

Algorithm:
1. Create a room table.
2. Create a guest table.
3. Create a booking table.
4. Establish relationships using foreign keys.
5. Insert room and guest details.
6. Store check-in and check-out dates.
7. Calculate the total bill and display booking details.
Code:CREATE TABLE e11e_rooms (
    room_no NUMBER PRIMARY KEY,
    room_type VARCHAR2(20),
    price_per_night NUMBER
);

CREATE TABLE e11e_guests (
    guest_id NUMBER PRIMARY KEY,
    guest_name VARCHAR2(30)
);

CREATE TABLE e11e_bookings (
    booking_id NUMBER PRIMARY KEY,
    guest_id NUMBER,
    room_no NUMBER,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id)
        REFERENCES e11e_guests(guest_id),
    FOREIGN KEY (room_no)
        REFERENCES e11e_rooms(room_no),
    CHECK (check_out > check_in)
);

INSERT INTO e11e_rooms
VALUES (101, 'Single', 1500);

INSERT INTO e11e_rooms
VALUES (102, 'Double', 2500);

INSERT INTO e11e_guests VALUES (1, 'Ravi');
INSERT INTO e11e_guests VALUES (2, 'Priya');

INSERT INTO e11e_bookings
VALUES (
    1, 1, 101,
    DATE '2026-11-10',
    DATE '2026-11-12'
);

INSERT INTO e11e_bookings
VALUES (
    2, 2, 102,
    DATE '2026-11-10',
    DATE '2026-11-13'
);

SELECT
    g.guest_name,
    r.room_no,
    r.room_type,
    (b.check_out - b.check_in) * r.price_per_night
    AS total_bill
FROM e11e_bookings b
JOIN e11e_guests g
ON b.guest_id = g.guest_id
JOIN e11e_rooms r
ON b.room_no = r.room_no
ORDER BY b.booking_id;

Output:

GUEST_NAME  ROOM_NO  ROOM_TYPE  TOTAL_BILL
Ravi        101      Single     3000
Priya       102      Double     7500
