-- 1. Parent Table: Student Profiles
CREATE TABLE students_portal (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 15 AND age <= 30)
);

-- 2. Child Table: Financial Billing
CREATE TABLE students_billing (
    bill_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students_portal(student_id) ON DELETE CASCADE,
    amount_bdt DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Unpaid'
);

-- 3. Master Table: Course Catalog
CREATE TABLE school_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) UNIQUE NOT NULL
);

-- 4. Junction Table: Course Enrollments (Many-to-Many Bridge)
CREATE TABLE students_enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students_portal(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES school_courses(course_id) ON DELETE CASCADE,
    CONSTRAINT uq_student_course_combination UNIQUE (student_id, course_id)
);
