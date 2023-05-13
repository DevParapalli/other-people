SELECT ec.ename
FROM Emp_Company ec
WHERE EXISTS (SELECT ec.ename
                FROM Employee e
                WHERE e.city ='Mumbai'and 
                 ec.ename = e.ename);
                AND 
        EXISTS (SELECT ec.ename
                  FROM Employee e
                  WHERE e.city ='Nagpur'and 
                  ec.ename = e.ename);