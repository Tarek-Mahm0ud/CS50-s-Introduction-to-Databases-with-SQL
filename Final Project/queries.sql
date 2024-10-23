-- Insert a new department into the departments table
INSERT INTO departments (dept_id, dept_name)
VALUES (1, 'Computer Science');

-- Insert another department to fix the foreign key error
INSERT INTO departments (dept_id, dept_name)
VALUES (2, 'Mathematics');

-- Insert a new student into the students table
INSERT INTO students (student_id, dep_id, name, phone_number, date_of_birth, email)
VALUES (101, 1, 'John Doe', '555-1234', '2000-05-15', 'john.doe@example.com');

-- Insert a grade into the grades table
INSERT INTO grades (grade_id, grade_name)
VALUES (1, 'A');

-- Insert a student's grade into the student_grade table
INSERT INTO student_grade (student_id, grade_id, grade_value)
VALUES (101, 1, 95);

-- Insert a new teacher into the teachers table
INSERT INTO teachers (teacher_id, name, email, phone_number, dept_id)
VALUES (201, 'Alice Smith', 'alice.smith@example.com', '555-5678', 1);

-- Insert a new subject into the subjects table
INSERT INTO subjects (sub_id, sub_name, teacher_id, dep_id)
VALUES (301, 'Introduction to Programming', 201, 1);

-- Select all students and their department information
SELECT s.student_id, s.name, s.phone_number, s.date_of_birth, s.email, d.dept_name
FROM students s
JOIN departments d ON s.dep_id = d.dept_id;

-- Select students' grades and related information
SELECT s.name, g.grade_name, sg.grade_value
FROM students s
JOIN student_grade sg ON s.student_id = sg.student_id
JOIN grades g ON sg.grade_id = g.grade_id
WHERE sg.grade_value > 90; -- Select students with grades greater than 90

-- Select teachers and their assigned subjects
SELECT t.name AS teacher_name, sub.sub_name AS subject_name
FROM teachers t
JOIN subjects sub ON t.teacher_id = sub.teacher_id;

-- Update a student's phone number
UPDATE students
SET phone_number = '555-4321'
WHERE student_id = 101;

-- Insert a new department to fix foreign key constraint issue
-- Ensure dept_id = 2 exists before updating the teacher
INSERT INTO departments (dept_id, dept_name)
VALUES (2, 'Mathematics');

-- Update a teacher's department
UPDATE teachers
SET dept_id = 2
WHERE teacher_id = 201;

-- Delete a student's grade
DELETE FROM student_grade
WHERE student_id = 101 AND grade_id = 1;

-- Delete a teacher from the teachers table
DELETE FROM teachers
WHERE teacher_id = 201;
