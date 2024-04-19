# Syllabus-Generator-System

The Syllabus Generator project aims to streamline syllabus management for university courses, reducing manual effort and ensuring accuracy. It utilizes a department-centric approach with an emphasis on minimizing errors. The project is divided into phases, with Phase 1 employing NORMA for conceptual schema design and SQL code generation.

Key features include:

Database Structure: The system is based on SQL databases initially, with tables for professors, courses, textbooks, and program chairs. It encompasses semester-wise scheduling, including fall and spring semesters.
Functionality: Professors can easily update syllabi, while the program chair oversees and approves changes. Textbooks required for courses are stored, and the system ensures unique identification for professors, courses, and program chairs.
Integration: The project incorporates both relational (SQL) and NoSQL (Couchbase) databases, allowing for flexibility in data management. JSON format is utilized for NoSQL implementation.
Automation: The system automates manual tasks such as syllabus updates, reducing the burden on professors and program chairs. Stored procedures, triggers, and user-defined functions enhance functionality and data integrity.
Notification System: When syllabi are modified, the program chair receives notifications for review and approval, ensuring transparency and accountability.
Efficiency: By centralizing syllabus management, the project aims to improve administrative efficiency within universities. It provides comprehensive support for syllabus creation, modification, and dissemination.
Conclusion: The Syllabus Generator offers a centralized repository for syllabus management, benefiting both professors and program chairs. Its implementation reduces manual effort, ensures data accuracy, and enhances overall administrative efficiency within universities.
