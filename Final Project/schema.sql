-- Departments table creation
CREATE TABLE "departments" (
    "dept_id" INTEGER PRIMARY KEY,
    "dept_name" TEXT NOT NULL
);

-- Students table creation
CREATE TABLE "students" (
    "student_id" INTEGER PRIMARY KEY,
    "dep_id" INTEGER,
    "name" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    FOREIGN KEY ("dep_id") REFERENCES "departments" ("dept_id")
);

-- Grades table creation
CREATE TABLE "grades" (
    "grade_id" INTEGER PRIMARY KEY,
    "grade_name" TEXT NOT NULL
);

-- Student grade junction table creation
CREATE TABLE "student_grade" (
    "student_id" INTEGER,
    "grade_id" INTEGER,
    "grade_value" INTEGER,
    FOREIGN KEY ("student_id") REFERENCES "students" ("student_id"),
    FOREIGN KEY ("grade_id") REFERENCES "grades" ("grade_id"),
    PRIMARY KEY ("student_id", "grade_id"),
    CHECK ("grade_value" <= 100 AND "grade_value" >= 50)
);

-- Teachers table creation
CREATE TABLE "teachers" (
    "teacher_id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "phone_number" TEXT NOT NULL UNIQUE,
    "dept_id" INTEGER,
    FOREIGN KEY ("dept_id") REFERENCES "departments" ("dept_id")
);

-- Subjects table creation
CREATE TABLE "subjects" (
    "sub_id" INTEGER PRIMARY KEY,
    "sub_name" TEXT NOT NULL UNIQUE,
    "teacher_id" INTEGER,
    "dep_id" INTEGER,
    FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("teacher_id"),
    FOREIGN KEY ("dep_id") REFERENCES "departments" ("dept_id")
);

-- VIEWS creation :

-- Information view about students
CREATE VIEW "student_info" AS
    SELECT s.student_id, s.name, s.phone_number, s.date_of_birth, s.email, d.dept_id, d.dept_name, sg.grade_value
    FROM students s
    JOIN departments d ON d.dept_id = s.dep_id
    JOIN student_grade sg ON s.student_id = sg.student_id;

-- Information view about teachers
CREATE VIEW "teacher_info" AS
    SELECT t.teacher_id, t.name, t.email, t.phone_number, t.dept_id, d.dept_name
    FROM teachers t
    JOIN departments d ON t.dept_id = d.dept_id;

--INDEXES creation :

-- Foreign key index on student_id in the Student Grades table
CREATE INDEX idx_student_grades_student_id
ON student_grade (student_id);

-- Foreign key index on teacher_id in the Subjects table
CREATE INDEX idx_subjects_teacher_id
ON subjects (teacher_id);

-- Foreign key index on dept_id in the Students table
CREATE INDEX idx_students_dept_id
ON students (dep_id);

-- Foreign key index on dept_id in the Teachers table
CREATE INDEX idx_teachers_dept_id
ON teachers (dept_id);

-- Foreign key index on dept_id in the Subjects table
CREATE INDEX idx_subjects_dept_id
ON subjects (dep_id);

-- Composite index on student_id and grade_id in the Student Grades table
CREATE INDEX idx_student_grades_composite
ON student_grade (student_id, grade_id);
