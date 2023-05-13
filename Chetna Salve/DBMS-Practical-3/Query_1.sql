SELECT e.ename,
    e.city
FROM employee e
WHERE e.ename IN (
        SELECT ec.ename
        FROM Emp_company ec
        WHERE ec.cname = "Accenture"
    );