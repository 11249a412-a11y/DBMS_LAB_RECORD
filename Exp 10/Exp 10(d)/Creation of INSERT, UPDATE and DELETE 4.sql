Aim:

To create database triggers that execute automatically during INSERT, UPDATE and DELETE operations.

Algorithm:
1. Create a product table.
2. Create an audit table.
3. Create an INSERT trigger to check product quantity.
4. Create an UPDATE trigger to record quantity changes.
5. Create a DELETE trigger to record deleted quantities.
6. Perform the operations and view the output.
Code:CREATE TABLE e10d_products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(30),
    quantity NUMBER
);

CREATE TABLE e10d_audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    operation VARCHAR2(10),
    old_qty NUMBER,
    new_qty NUMBER
);

-- INSERT Trigger

CREATE OR REPLACE TRIGGER e10d_insert_trigger
BEFORE INSERT ON e10d_products
FOR EACH ROW
BEGIN
    IF :NEW.quantity < 0 THEN
        :NEW.quantity := 0;
    END IF;
END;
/

-- UPDATE Trigger

CREATE OR REPLACE TRIGGER e10d_update_trigger
AFTER UPDATE ON e10d_products
FOR EACH ROW
BEGIN
    INSERT INTO e10d_audit (operation, old_qty, new_qty)
    VALUES ('UPDATE', :OLD.quantity, :NEW.quantity);
END;
/

-- DELETE Trigger

CREATE OR REPLACE TRIGGER e10d_delete_trigger
AFTER DELETE ON e10d_products
FOR EACH ROW
BEGIN
    INSERT INTO e10d_audit (operation, old_qty, new_qty)
    VALUES ('DELETE', :OLD.quantity, NULL);
END;
/

-- Testing Triggers

INSERT INTO e10d_products
VALUES (1, 'Pen', -5);

SELECT * FROM e10d_products;

UPDATE e10d_products
SET quantity = 10
WHERE product_id = 1;

DELETE FROM e10d_products
WHERE product_id = 1;

SELECT operation, old_qty, new_qty
FROM e10d_audit
ORDER BY audit_id;

Output:
After INSERT:

PRODUCT_ID  PRODUCT_NAME  QUANTITY
1           Pen           0

Audit Table:

OPERATION  OLD_QTY  NEW_QTY
UPDATE     0        10
DELETE     10       NULL

Insert trigger executed.
Update trigger executed.
Delete trigger executed.
