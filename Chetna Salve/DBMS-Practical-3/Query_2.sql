SELECT ec.ename
FROM Emp_Company ec
WHERE ec.ename IN (
        SELECT e.ename
        FROM Employee e
        WHERE e.city = "Delhi"
    )
    AND ec.cname IN (
        SELECT c.cname
        FROM Company c
        WHERE c.city = "Nagpur"
    );