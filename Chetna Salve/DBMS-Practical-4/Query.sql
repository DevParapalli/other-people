DROP TABLE IF EXISTS Reserves;
DROP TABLE IF EXISTS Boats;
DROP TABLE IF EXISTS Sailors;

CREATE TABLE Sailors (
  sid INTEGER,
  sname VARCHAR(20),
  rating INTEGER,
  age INTEGER
);

CREATE TABLE Boats (
  bid INTEGER,
  bname VARCHAR(20),
  color VARCHAR(20)
);

CREATE TABLE Reserves (
  sid INTEGER,
  bid INTEGER,
  DAY DATE
);

INSERT INTO Sailors
VALUES (1, 'Akash', 10, 20),
       (2, 'Chetna', 1, 62),
       (3, 'Pratik', 4, 64),
       (4, 'Malhar', 8, 20),
       (5, 'Ketaki', 2, 24),
       (6, 'Sapna', 9, 20),
       (7, 'Hemant', 5, 28);

INSERT INTO Boats
VALUES (1, 'B1', 'Red'),
       (2, 'B2', 'Blue'),
       (3, 'B3', 'Green'),
       (4, 'B4', 'Red'),
       (5, 'B5', 'Blue'),
       (6, 'B6', 'Green'),
       (7, 'B7', 'Red');

INSERT INTO Reserves (sid, bid, DAY)
VALUES (1, 1, '2023-08-10'),
       (2, 2, '2023-08-10'),
       (1, 3, '2023-08-10'),
       (6, 4, '2023-08-11'),
       (8, 5, '2023-08-11'),
       (5, 3, '2023-08-10'),
       (9, 4, '2023-08-11'),
       (3, 5, '2023-08-11');

SELECT s.sname
FROM Boats b, Reserves r,Sailors s
WHERE b.color = 'Red' and 
b.bid = r.bid and
r.sid = s.sid 
EXCEPT 
SELECT  s.sname 
FROM Boats b, Reserves r,Sailors s
WHERE b.color = 'Green' and 
b.bid = r.bid and
r.sid = s.sid;

SELECT s.sname
FROM Boats b, Reserves r,Sailors s
WHERE b.color = 'Red' and 
b.bid = r.bid and
r.sid = s.sid 
INTERSECT 
SELECT  s.sname 
FROM Boats b, Reserves r,Sailors s
WHERE b.color = 'Green' and 
b.bid = r.bid and
r.sid = s.sid;