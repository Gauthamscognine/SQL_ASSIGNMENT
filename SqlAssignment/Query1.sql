use joins;

select * from emp;
insert into emp values(191 ,'suresh', 77 , 45000 , 33);
INSERT INTO emp VALUES (192, 'Suresha', 94, 47000, 33);
INSERT INTO emp VALUES (193, 'Surekha', 78, 42000, 33);
INSERT INTO emp VALUES (194, 'Suraj', 78, 40000, 34);;


SELECT 
    ename,
    SOUNDEX(ename) AS soundex_code,
    DIFFERENCE(ename, 'Suresh') AS similarity_score
FROM 
    emp
WHERE 
    SOUNDEX(ename) = SOUNDEX('Suresh')
ORDER BY 
    similarity_score DESC;
