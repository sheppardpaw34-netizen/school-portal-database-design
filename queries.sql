-- Automated Policy Compliance Audit
-- Isolates any student violating the institutional policy of taking at least 2 courses
SELECT 
    student_id, 
    COUNT(course_id) AS total_enrolled_courses
FROM students_enrollment
GROUP BY student_id
HAVING COUNT(course_id) < 2;
