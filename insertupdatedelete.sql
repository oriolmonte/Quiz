INSERT INTO dept
VALUES(
    50,
    'Programacio',
    'Girona'
);

INSERT INTO dept(dept_num,dept_nom,dept_loc)
VALUES(
    60,
    'Distribucio',
    'Angles'
);
INSERT INTO dept(dept_num,dept_nom,dept_loc)
VALUES(
    (SELECT MAX(dept_num)+1 FROM dept),
    'Finances',
    'Girona'
);
UPDATE dept 
SET
dept_loc = 'Girona'
WHERE dept_num = 60;

UPDATE dept 
SET
dept_loc = 'Barcelona'
WHERE dept_loc = 'Girona';

DELETE FROM dept
WHERE dept_num = 61;

DELETE FROM dept
WHERE dept_num > 40;

INSERT INTO empl(empl_num,empl_nom,empl_ofici,empl_dir,
empl_datalt,empl_salari,empl_comissio,empl_dept_num) 
VALUES
(
    (SELECT MAX(empl_num)+1 FROM empl),
    'Oriol',
    'Estudiant',
    (SELECT MIN(empl_num) FROM empl),
    TO_DATE('21/02/2024','DD/MM/YYYY'),
    1000.00,
    100.00,
    10
);

INSERT INTO empl(empl_num,empl_nom,empl_ofici,empl_dir,
empl_datalt,empl_salari,empl_comissio,empl_dept_num) 
VALUES
(
    (SELECT MAX(empl_num)+1 FROM empl),
    'PEP',
    'Estudiant',
    (SELECT MIN(empl_num) FROM empl),
    TO_DATE('21/02/2024','DD/MM/YYYY'),
    1000.00,
    100.00,
    (SELECT DISTINCT empl_dept_num FROM empl
    WHERE empl_dept_num IS NOT NULL
    GROUP BY empl_dept_num 
    ORDER BY COUNT(*) ASC
    FETCH FIRST ROW ONLY)
);


SELECT * FROM empl

SELECT * FROM dept
