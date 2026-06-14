# school-portal-database-design
Production-ready relational database schema featuring multi-layer data ingestion safeguards and policy compliance auditing.

# Enterprise School Portal: Relational Database Design & Data Ingestion Safeguards

## Project Overview
This project demonstrates the architecture and implementation of a robust, production-ready relational database schema designed to manage a school portal ecosystem (`ATC_scholl_portal`). The primary objective of this architecture is to enforce absolute data integrity, prevent structural corruption, and apply multi-layer ingestion safeguards to eliminate "dirty data" before it enters the storage engine.

The system maps out complex real-world entities, including student profiles, financial billing, master course catalogs, and structural student enrollments utilizing a Many-to-Many relationship model.

---

## Key Business Logic & Data Safeguards Implemented

### 1. Orphan Record Protection (Foreign Key Guardrails)
* **Problem:** Preventing financial billing records or class enrollments from pointing to non-existent students.
* **Solution:** Explicitly enforced `REFERENCES students_portal(student_id) ON DELETE CASCADE`. If a student record is removed, all associated billing and enrollment dependencies are automatically purged to prevent database clutter and orphan rows.

### 2. Multi-Column Duplicate Prevention (Composite Unique Constraints)
* **Problem:** Ensuring a student cannot be enrolled in the same course multiple times (e.g., registering for "Bangla" twice).
* **Solution:** Implemented a composite unique constraint `CONSTRAINT uq_student_course_combination UNIQUE (student_id, course_id)`. This blocks redundant data entries at the engine layer, guaranteeing each student-to-course link is a unique pair.

### 3. Data Compliance & Policy Auditing
* **Problem:** Identifying students violating the institutional policy requiring enrollment in at least two courses.
* **Solution:** Developed an aggregation audit script utilizing `GROUP BY`, `COUNT()`, and `HAVING` filters to track non-compliant user behaviors dynamically without degrading table performance.

---

## Technical Skills Demonstrated
* **Relational Database Design:** Table normalization, Primary and Foreign Key structures.
* **Data Management & Integrity:** Composite constraints, cascading rules (`ON DELETE CASCADE`), data validation check constraints.
* **Data Ingestion Safeguards:** Strict exception tracking for duplicate values (SQL state 23505) and foreign key violations (SQL state 23503).
* **Data Analysis Foundations:** Intermediate aggregate processing using multi-table groupings.
