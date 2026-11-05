Aim:

To create and use views, sequences, indexes and savepoints in an Oracle database.

Algorithm:
1. Create a product table.
2. Create a sequence to generate product IDs.
3. Insert product records.
4. Create a view to display selected products.
5. Create an index on the product name.
6. Use SAVEPOINT and ROLLBACK to undo a change.
7. Display the records.  
Code:CREATE TABLE e7_products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(30),
    price NUMBER
);

CREATE SEQUENCE e7_product_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO e7_products
VALUES (e7_product_seq.NEXTVAL, 'Pen', 20);

INSERT INTO e7_products
VALUES (e7_product_seq.NEXTVAL, 'Notebook', 150);

INSERT INTO e7_products
VALUES (e7_product_seq.NEXTVAL, 'Bag', 700);

CREATE VIEW e7_costly_products AS
SELECT * FROM e7_products
WHERE price > 100;

CREATE INDEX e7_product_name_idx
ON e7_products(product_name);

COMMIT;

SAVEPOINT s7;

UPDATE e7_products
SET price = 300
WHERE product_name = 'Pen';

ROLLBACK TO s7;

COMMIT;

SELECT * FROM e7_products
ORDER BY product_id;

SELECT * FROM e7_costly_products
ORDER BY product_id;
Output:

Product Table:

PRODUCT_ID  PRODUCT_NAME  PRICE
1           Pen           20
2           Notebook      150
3           Bag           700

View Output:

PRODUCT_ID  PRODUCT_NAME  PRICE
2           Notebook      150
3           Bag           700

Sequence created.
View created.
Index created.
Savepoint rollback successful.
  
