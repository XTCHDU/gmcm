-- This is an SQL script to build a database for the 
-- TRANDB.LG4 sample model.  If you use Oracle, you can 
-- run this script by starting SQL Plus (Start|Run|Sqlplusw).
-- Enter your Oracle User ID and password, then type
-- "@\lingo11\samples\trandb.sql" to the SQL Plus prompt
-- Next, from the Windows Control Panel, you will need to
-- run the ODBC Administrator to add a User DSN called
-- "transportation".  If you are using Oracle, be sure
-- to use the "Microsoft ODBC Driver for Oracle".  Do
-- not use the "Oracle ODBC Driver", because it does
-- not provide all the necessary functionality.  You 
-- should then be able to run the TRANDB.LG4 model in
-- LINGO, which reads data from and writes data to the 
-- tables created by this script.

CREATE TABLE PLANTS
(
 PLANTS		CHAR(32)	NOT NULL,
 CAPACITY	NUMBER		NOT NULL
);

CREATE TABLE CUSTOMERS
(
 CUSTOMERS		CHAR(32)	NOT NULL,
 DEMAND     	NUMBER		NOT NULL
);

CREATE TABLE ARCS
(
 PLANTS		CHAR(32)	NOT NULL,
 CUSTOMERS	CHAR(32)	NOT NULL,
 COST   	NUMBER		NOT NULL,
 VOLUME   	NUMBER		NOT NULL
);

COMMIT;

DELETE FROM PLANTS;
DELETE FROM CUSTOMERS;
DELETE FROM ARCS;
COMMIT;

INSERT INTO PLANTS VALUES ('Plant1', 30);
INSERT INTO PLANTS VALUES ('Plant2', 25);
INSERT INTO PLANTS VALUES ('Plant3', 21);
COMMIT;

INSERT INTO CUSTOMERS VALUES ('Cust1', 15);
INSERT INTO CUSTOMERS VALUES ('Cust2', 17);
INSERT INTO CUSTOMERS VALUES ('Cust3', 22);
INSERT INTO CUSTOMERS VALUES ('Cust4', 12);
COMMIT;

INSERT INTO ARCS VALUES ('Plant1', 'Cust1', 6, 0);
INSERT INTO ARCS VALUES ('Plant1', 'Cust2', 2, 0);
INSERT INTO ARCS VALUES ('Plant1', 'Cust3', 6, 0);
INSERT INTO ARCS VALUES ('Plant1', 'Cust4', 7, 0);

INSERT INTO ARCS VALUES ('Plant2', 'Cust1', 4, 0);
INSERT INTO ARCS VALUES ('Plant2', 'Cust2', 9, 0);
INSERT INTO ARCS VALUES ('Plant2', 'Cust3', 5, 0);
INSERT INTO ARCS VALUES ('Plant2', 'Cust4', 3, 0);

INSERT INTO ARCS VALUES ('Plant3', 'Cust1', 8, 0);
INSERT INTO ARCS VALUES ('Plant3', 'Cust2', 8, 0);
INSERT INTO ARCS VALUES ('Plant3', 'Cust3', 1, 0);
INSERT INTO ARCS VALUES ('Plant3', 'Cust4', 5, 0);

COMMIT; 