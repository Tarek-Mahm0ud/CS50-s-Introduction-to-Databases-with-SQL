# **Design Document**

**By Tarek Mahmoud**

[**Video Overview**](https://youtu.be/BPemIsFCye0)

---

## **Scope**

### **Purpose of the Database**
The purpose of this database is to manage and store data related to the operations of a college. It tracks key information about students, teachers, subjects, departments, and student performance (grades). The database ensures efficient management of these elements, helping to streamline data retrieval and updates, and maintaining the integrity of relationships between entities like students and their departments, teachers and their subjects, and grades for students in each course.

### **Included in the Scope**
The following entities are included in the scope of the database:
- **Students**: Personal information such as name, contact details, and department.
- **Teachers**: Teacher information, including contact details and assigned departments.
- **Subjects**: The courses offered at the college and the teachers assigned to each subject.
- **Departments**: The various academic departments, like Mathematics or Computer Science, to which students and teachers belong.
- **Grades**: The performance or grades that students receive in their subjects.

### **Outside the Scope**
The following areas are excluded from the database scope:
- **Financial Information**: No tracking of tuition fees, scholarships, or payments.
- **Class Scheduling**: Information about class times, rooms, or teaching schedules is not included.
- **Attendance**: Student attendance data is not stored.
- **Historical Data**: There is no support for storing past records (e.g., previous enrollments, old grades).

---

## **Functional Requirements**

### **What Users Can Do**
A user of this database can:
- Add or update student records, including assigning students to departments.
- Assign teachers to subjects and link them to departments.
- Record and update grades for students in their enrolled subjects.
- Query relationships, such as:
  - Which students are enrolled in a particular subject.
  - Which subjects are taught by a specific teacher.
  - Which students belong to a particular department.
  - The performance of students in each subject.

### **Beyond the Scope**
The database does not support:
- Managing class schedules, including room assignments and time slots.
- Tracking attendance or participation in extracurricular activities.
- Conducting performance analytics, such as historical analysis of student grades over time.

---

## **Representation**

### **Entities**

The key entities represented in the database are:

1. **Students**
   - **Attributes**: `student_id (PK)`, `name`, `phone_number`, `email`, `date_of_birth`, `dept_id (FK)`
   - **Type**: Each student is uniquely identified by `student_id` and is associated with a department through the foreign key `dept_id`.
   - **Why these types**: Each attribute represents essential information about students, and `dept_id` is used to establish relationships between students and their departments.
   - **Constraints**: The student must be assigned to a valid department, ensuring referential integrity.

2. **Teachers**
   - **Attributes**: `teacher_id (PK)`, `name`, `phone_number`, `email`, `dept_id (FK)`
   - **Type**: Teachers are uniquely identified by `teacher_id`, and each teacher belongs to a department.
   - **Why these types**: These attributes capture essential teacher details and link teachers to departments through `dept_id`.
   - **Constraints**: Teachers must belong to a department, which ensures that each teacher is appropriately categorized.

3. **Subjects**
   - **Attributes**: `sub_id (PK)`, `sub_name`, `teacher_id (FK)`, `dept_id (FK)`
   - **Type**: Each subject is uniquely identified by `sub_id` and is associated with both a teacher and a department.
   - **Why these types**: The attributes are essential for managing the courses offered, and the foreign keys (`teacher_id`, `dept_id`) maintain relationships between subjects, teachers, and departments.
   - **Constraints**: Each subject must be assigned to a teacher and a department.

4. **Departments**
   - **Attributes**: `dept_id (PK)`, `dept_name`
   - **Type**: Departments are uniquely identified by `dept_id` and store the name of each department.
   - **Why these types**: These attributes are necessary for categorizing both students and teachers within the system.
   - **Constraints**: Departments must have a unique identifier, and this serves as a reference for other tables.

5. **Grades**
   - **Attributes**: `grade_id (PK)`, `grade_name`, `grade_value`
   - **Type**: Grades are uniquely identified by `grade_id`, with attributes for the grade’s name and value.
   - **Why these types**: This captures the student’s performance in a subject using descriptive and numeric values.
   - **Constraints**: The grade must reference a valid value and name.

6. **Student Grades**
   - **Attributes**: `student_id (FK)`, `sub_id (FK)`, `grade_id (FK)`
   - **Type**: This table tracks the performance of students in subjects.
   - **Why these types**: This table creates many-to-many relationships between students and subjects, with grades assigned to these combinations.
   - **Constraints**: Ensures valid student, subject, and grade references through foreign keys.

### **Relationships**

Here’s a summary of the relationships in the database:
1. **Students and Departments**:
   - **Many-to-One**: Each student is associated with a single department, while a department can have multiple students.
   - Foreign key: `dept_id` in the **Students** table references the **Departments** table.

2. **Teachers and Departments**:
   - **Many-to-One**: Each teacher is associated with one department, while a department can have multiple teachers.
   - Foreign key: `dept_id` in the **Teachers** table references the **Departments** table.

3. **Subjects and Teachers**:
   - **Many-to-One**: Each subject is taught by one teacher, but a teacher may teach multiple subjects.
   - Foreign key: `teacher_id` in the **Subjects** table references the **Teachers** table.

4. **Departments and Subjects**:
   - **Many-to-One**: Each subject belongs to one department, while a department can offer multiple subjects.
   - Foreign key: `dept_id` in the **Subjects** table references the **Departments** table.

5. **Students and Subjects (via Grades)**:
   - **Many-to-Many**: A student can be enrolled in many subjects, and a subject can have many students. The **Student Grades** table links them and stores their grades.

Here’s the entity-relationship diagram (ERD):

[Entity Relationship Diagram](https://drive.google.com/file/d/1dmhMJDsJnunB1l3RfAn2a6TMj9hI2Krw/view?usp=sharing)

---

## **Optimizations**

### **Indexes**
The following indexes are created to optimize the performance of the database:
- **Foreign key indexes**:
  - On `student_id` in the **Student Grades** table to speed up queries retrieving a student’s subjects and grades.
  - On `teacher_id` in the **Subjects** table for faster retrieval of teacher assignments.
  - On `dept_id` in the **Students**, **Teachers**, and **Subjects** tables to optimize department-related queries.

- **Composite indexes**:
  - On **Student Grades** for `(student_id, sub_id)` to optimize performance when querying student performance in specific subjects.

These optimizations ensure faster query times for common database operations.

---

## **Limitations**

### **Design Limitations**
- **Scalability**: As the number of records grows (e.g., large student bodies or multiple departments), performance may degrade unless additional optimizations like partitioning or replication are introduced.
- **No Historical Tracking**: The database does not track historical data such as past grades or previous course enrollments.
- **No Scheduling Data**: Class schedules and conflicts are not represented, so course timings, locations, and scheduling logistics are outside the scope of the database.

### **Representation Limitations**
- **Extracurricular Activities**: The database only captures academic performance, with no support for tracking student participation in non-academic activities.
- **Advanced Analytics**: While basic queries are supported, advanced analytics such as student performance trends or predictive modeling would require additional features.
