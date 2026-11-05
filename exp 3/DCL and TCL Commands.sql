Aim:

To execute Data Control Language (DCL) and Transaction Control Language (TCL) commands.

Algorithm:
1. Create an account table.
2. Insert account details.
3. Use GRANT and REVOKE for permissions.
4. Use SAVEPOINT to mark a transaction.
5. Use ROLLBACK to undo a change.
6. Use COMMIT to save the final changes.
Code:
CREATE TABLE e3_accounts (
    account_id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    balance NUMBER
);

INSERT INTO e3_accounts VALUES (1, 'Ravi', 1000);
INSERT INTO e3_accounts VALUES (2, 'Priya', 500);

COMMIT;

-- DCL commands (lab demonstration)
GRANT SELECT ON e3_accounts TO PUBLIC;

REVOKE SELECT ON e3_accounts FROM PUBLIC;

-- TCL commands
SAVEPOINT s1;

UPDATE e3_accounts
SET balance = 800
WHERE account_id = 1;

ROLLBACK TO s1;

UPDATE e3_accounts
SET balance = balance - 100
WHERE account_id = 1;

UPDATE e3_accounts
SET balance = balance + 100
WHERE account_id = 2;

COMMIT;

Output:

Grant succeeded.
Revoke succeeded.

ACCOUNT_ID  NAME    BALANCE
1           Ravi    900
2           Priya   600

Transaction committed.  

SELECT * FROM e3_accounts
ORDER BY account_id;
