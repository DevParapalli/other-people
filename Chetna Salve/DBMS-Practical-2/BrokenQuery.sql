DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Emp_Company;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Emp_Shift;
CREATE TABLE Employee (ename varchar2(10), 
                       city varchar2(10));
CREATE TABLE Emp_Company ( ename varchar2(10),
                           cname varchar2(11),
                           salary number(7, 2),
                           jdate date);
CREATE TABLE Company (cname varchar2(10),
                      city varchar2(10));
CREATE TABLE Manager (ename varchar2(10),
                      mname varchar2(10));
CREATE TABLE Emp_Shift (ename varchar2(10), 
                        shift varchar2(1));
INSERT INTO Employee VALUES ('Akash', 'Aurangabad'),
                            ('Pooja', 'Pune'),
                            ('Priya', 'Mumbai'),
                            ('Sakshi', 'Hyderabad'),
                            ('Siya', 'Delhi'),
                            ('Aarav', 'Nagpur');
INSERT INTO Emp_Company VALUES ('Akash ', 'Microsoft', 18000, '11-01-23'),
                               ('Pooja', 'Google ', 16000, '18-03-23'),
                               ('Priya', 'Accenture', 18000, '19-04-23'),
                               ('Rohan', 'Zoho', 17000, '12-03-23'),
                               ('Siya', 'Hexaware', 19000, '14-01-23'),
                               ('Aarav', 'Persistent', 15000, '13-05-23');
INSERT INTO Company VALUES ('Microsoft', 'san Fron '),
                           ('Google', 'California'),
                           ('Accenture', 'Mumbai'),
                           ('zoho', 'Pune'),
                           ('Hexaware', 'Nagpur'),
                           ('Persistant', 'Nagpur');
INSERT INTO Manager VALUES ('Akash', 'Rahul Meshra'),
                           ('Pooja', 'Raghav Gupta'),
                           ('Priya', 'Shree Joshi'),
                           ('Sakshi', 'Parth Vyas'),
                           ('Siya', 'Aditya Sahu'),
                           ('Aarav', 'Kiran Tajne');
INSERT INTO Emp_Shift VALUES ('Akash', 'A'),
                             ('Pooja', 'B'),
                             ('Priya', 'A'),
                             ('Sakshi', 'A'),
                             ('Siya', 'B'),
                             ('Aarav', 'B');
SELECT * FROM Employee;
SELECT * FROM Emp_Company;
SELECT * FROM Company;
SELECT * FROM Manager;
SELECT * FROM Emp_shift;

SELECT e.ename,e.city 
FROM Employee e
WHERE e.ename IN (SELECT ec.ename
                  FROM Emp_Company ec 
                  WHERE  ec.cname ='Hexaware');