SELECT ec.ename
FROM Emp_Company ec
WHERE EXISTS (
                SELECT *
                FROM Employee e
                WHERE e.city = 'Mumbai'
                        AND ec.ename = e.ename
        )
        AND EXISTS (
                SELECT *
                FROM Company c
                WHERE c.city = 'Nagpur'
                        AND c.cname = ec.cname
        );