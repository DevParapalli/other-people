SELECT e2.ename
FROM Employee AS e2
WHERE EXISTS (
        SELECT e1.city
        FROM Employee e1
        WHERE e1.ename = "Pooja"
            AND e2.city = e1.city
    );