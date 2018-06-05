--Create a demo table for the demonstration
CREATE TABLE stu_info(
    student_name    VARCHAR2(20)
);
--Insert data into the table
--TRUNCATE TABLE stu_info;
INSERT INTO stu_info (student_name) VALUES ('Tony');
INSERT INTO stu_info (student_name) VALUES ('Banner');
INSERT INTO stu_info (student_name) VALUES ('Leo'); --Strange
INSERT INTO stu_info (student_name) VALUES ('Rocket');
INSERT INTO stu_info (student_name) VALUES ('Steve');

--Check the data
SELECT student_name FROM stu_info;

--Multiple bind variable
SET SERVEROUTPUT ON;
DECLARE
    sql_smt VARCHAR2(150);
BEGIN
    sql_smt := 'UPDATE stu_info SET student_name = :new_name 
    WHERE student_name = :old_name ';
    EXECUTE IMMEDIATE sql_smt USING 'Strange','Leo';   
END;
/
--Table name using Bind variable. Will we get an error or will it work?
SET SERVEROUTPUT ON;
DECLARE
    sql_smt VARCHAR2(150);
BEGIN
    sql_smt := 'UPDATE :tab_name SET student_name = :new_name 
    WHERE student_name = :old_name ';
    EXECUTE IMMEDIATE sql_smt USING 'stu_info', 'Strange','Leo';   
END;
/
--Check the data after dynamic updation
SELECT student_name FROM stu_info;