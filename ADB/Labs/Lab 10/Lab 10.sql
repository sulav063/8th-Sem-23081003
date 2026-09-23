--CREATE TABLE students (
--    student_id NUMBER PRIMARY KEY,
--    name VARCHAR2(50),
--    department VARCHAR2(20),
--    marks NUMBER,
--    created_date DATE
--);
--
--INSERT INTO students
--(student_id, name, department, marks, created_date)
--VALUES
--(101, 'Ram', 'CS', 75, SYSDATE);
--
--INSERT INTO students
--(student_id, name, department, marks, created_date)
--VALUES
--(102, 'Hari', 'CS', 82, SYSDATE);
--INSERT INTO students
--(student_id, name, department, marks, created_date)
--VALUES
--(103, 'Sita', 'IT', 68, SYSDATE);
--COMMIT;

--SELECT * FROM students;




--CREATE OR REPLACE PROCEDURE process_student_marks (
--    p_student_id IN NUMBER,
--    p_marks IN OUT NUMBER,
--    p_name OUT VARCHAR2
--)
--IS
--BEGIN
--    SELECT name
--    INTO p_name
--    FROM students
--    WHERE student_id = p_student_id;
--
--    p_marks := p_marks + 5;
--END;
--/


--DECLARE
--    v_marks NUMBER := 75;
--    v_name VARCHAR2(50);
--BEGIN
--    process_student_marks(101, v_marks, v_name);
--
--    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
--    DBMS_OUTPUT.PUT_LINE('Updated Marks: ' || v_marks);
--END;
--/


--CREATE OR REPLACE PROCEDURE update_reexam_marks (
--    p_student_id IN NUMBER,
--    p_additional_marks IN NUMBER,
--    p_current_marks IN OUT NUMBER,
--    p_department OUT VARCHAR2
--)
--IS
--BEGIN
--    SELECT department
--    INTO p_department
--    FROM students
--    WHERE student_id = p_student_id;
--
--    p_current_marks := p_current_marks + p_additional_marks;
--
--    IF p_current_marks > 100 THEN
--        p_current_marks := 100;
--    END IF;
--END;
--/




--DECLARE
--    v_marks NUMBER := 82;
--    v_department VARCHAR2(20);
--BEGIN
--    update_reexam_marks(
--        102,
--        25,
--        v_marks,
--        v_department
--    );
--
--    DBMS_OUTPUT.PUT_LINE('Department: ' || v_department);
--    DBMS_OUTPUT.PUT_LINE('Final Marks: ' || v_marks);
--END;
--/



--CREATE OR REPLACE FUNCTION calculate_grade (
--    p_student_id IN NUMBER,
--    p_bonus_marks IN NUMBER,
--    p_name OUT VARCHAR2,
--    p_marks IN OUT NUMBER
--)
--RETURN VARCHAR2
--IS
--    v_grade VARCHAR2(2);
--BEGIN
--    SELECT name, marks
--    INTO p_name, p_marks
--    FROM students
--    WHERE student_id = p_student_id;
--
--    p_marks := p_marks + p_bonus_marks;
--
--    IF p_marks > 100 THEN
--        p_marks := 100;
--    END IF;
--
--    IF p_marks >= 90 THEN
--        v_grade := 'A';
--    ELSIF p_marks >= 80 THEN
--        v_grade := 'B';
--    ELSIF p_marks >= 70 THEN
--        v_grade := 'C';
--    ELSIF p_marks >= 60 THEN
--        v_grade := 'D';
--    ELSE
--        v_grade := 'F';
--    END IF;
--
--    RETURN v_grade;
--END;
--/


--DECLARE
--    v_name VARCHAR2(50);
--    v_marks NUMBER;
--    v_grade VARCHAR2(2);
--BEGIN
--    v_grade := calculate_grade(
--        101,
--        5,
--        v_name,
--        v_marks
--    );
--
--    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
--    DBMS_OUTPUT.PUT_LINE('Final Marks: ' || v_marks);
--    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
--END;
----/
--
--
--CREATE OR REPLACE TRIGGER trg_student_created_date
--BEFORE INSERT ON students
--FOR EACH ROW
--BEGIN
--    :NEW.created_date := SYSDATE;
--END;
----/
--
--INSERT INTO students
--(student_id, name, department, marks)
--VALUES
--(104, 'Gita', 'CS', 91);
--
--COMMIT;
--
--SELECT * FROM students
--WHERE student_id = 104;


--CREATE OR REPLACE TRIGGER trg_validate_marks
--BEFORE UPDATE OF marks ON students
--FOR EACH ROW
--BEGIN
--    IF :NEW.marks < 0 OR :NEW.marks > 100 THEN
--        RAISE_APPLICATION_ERROR(
--            -20001,
--            'Marks must be between 0 and 100'
--        );
--    END IF;
--END;
--/


--UPDATE students
--SET marks = 90
--WHERE student_id = 101;


--UPDATE students
--SET marks = 85
--WHERE student_id = 101;
--
--COMMIT;
--SELECT * FROM students
--WHERE student_id = 101;

--CREATE TABLE marks_history (
--    history_id NUMBER PRIMARY KEY,
--    student_id NUMBER,
--    old_marks NUMBER,
--    new_marks NUMBER,
--    changed_date DATE
--);
--CREATE SEQUENCE marks_history_seq
--START WITH 1
--INCREMENT BY 1;



--CREATE OR REPLACE TRIGGER trg_marks_history
--AFTER UPDATE OF marks ON students
--FOR EACH ROW
--BEGIN
--    INSERT INTO marks_history
--    (
--        history_id,
--        student_id,
--        old_marks,
--        new_marks,
--        changed_date
--    )
--    VALUES
--    (
--        marks_history_seq.NEXTVAL,
--        :OLD.student_id,
--        :OLD.marks,
--        :NEW.marks,
--        SYSDATE
--    );
--END;
--/



--UPDATE students
--SET marks = 90
--WHERE student_id = 101;
--
--COMMIT;

--SELECT *
--FROM marks_history;

--CREATE OR REPLACE TRIGGER trg_student_update
--AFTER UPDATE ON students
--BEGIN
--    DBMS_OUTPUT.PUT_LINE(
--        'Students table was updated.'
--    );
--END;
--/

--UPDATE students
--SET marks = marks + 1
--WHERE department = 'CS';


--CREATE TABLE deleted_students (
--    student_id NUMBER,
--    name VARCHAR2(50),
--    department VARCHAR2(20),
--    marks NUMBER,
--    deleted_date DATE
--);


--CREATE OR REPLACE TRIGGER trg_student_delete
--AFTER DELETE ON students
--FOR EACH ROW
--BEGIN
--    INSERT INTO deleted_students
--    (student_id, name, department, marks, deleted_date)
--    VALUES
--    (:OLD.student_id,
--     :OLD.name,
--     :OLD.department,
----     :OLD.marks,
----     SYSDATE);
----END;
----/
----DELETE FROM students
----WHERE student_id = 104;
----COMMIT;
--
--
--
----SELECT * FROM deleted_students;
--
--
--CREATE OR REPLACE VIEW student_details AS
--SELECT student_id,
--       name,
--       department
--FROM students;

--
--CREATE OR REPLACE TRIGGER trg_student_details_insert
--INSTEAD OF INSERT ON student_details
--FOR EACH ROW
--BEGIN
--    INSERT INTO students
--    (
--        student_id,
--        name,
--        department,
--        marks,
--        created_date
--    )
--    VALUES
--    (
--        :NEW.student_id,
--        :NEW.name,
--        :NEW.department,
--        0,
--        SYSDATE
--    );
--END;
--/



--INSERT INTO student_details
--(student_id, name, department)
--VALUES
--(105, 'John', 'CS');



--SELECT *
--FROM students
----WHERE student_id = 105;
--
--
--CREATE OR REPLACE TRIGGER trg_student_details_update
--INSTEAD OF UPDATE ON student_details
--FOR EACH ROW
--BEGIN
--    UPDATE students
--    SET name = :NEW.name
--    WHERE student_id = :OLD.student_id;
--END;
--/
--SELECT *
--FROM student_details
--WHERE student_id = 101;

SELECT *
FROM student_details
WHERE student_id = 105;

