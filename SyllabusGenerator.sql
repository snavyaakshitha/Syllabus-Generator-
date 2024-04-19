USE master;
GO

IF  DB_ID('SyllabusGenerator') IS NOT NULL
DROP DATABASE SyllabusGenerator;
GO

CREATE DATABASE SyllabusGenerator;
GO

USE SyllabusGenerator;

CREATE TABLE Department (
  DepartmentID        INT            PRIMARY KEY   IDENTITY,
  DepartmentName      VARCHAR(255)   NOT NULL,     
  DepartmentCode      VARCHAR(20)    NOT NULL      UNIQUE
);

CREATE TABLE Professor (
  ProfessorID          INT            PRIMARY KEY   IDENTITY,
  DepartmentID         INT            REFERENCES Department (DepartmentID),
  Name                 VARCHAR(100)   NOT NULL,
  EmailID              VARCHAR(100)   NOT NULL UNIQUE,
  ContactNumber        varchar(20)    NOT NULL
);

CREATE TABLE ProgramChair (
  ProgramChairID       INT            PRIMARY KEY   IDENTITY,
  DepartmentID         INT            REFERENCES Department (DepartmentID),
  Name                 VARCHAR(100)   NOT NULL,
  EmailID              VARCHAR(100)   NOT NULL UNIQUE,
  ContactNumber        varchar(20)    NOT NULL
);

CREATE TABLE Course (
  CourseID         INT            PRIMARY KEY   IDENTITY,
  DepartmentID     INT            REFERENCES Department (DepartmentID), 
  ProfessorID      INT            REFERENCES Professor (ProfessorID), 
  CourseCode       VARCHAR(50)    NOT NULL UNIQUE,
  CourseName       VARCHAR(50)    NOT NULL,
  CourseType       VARCHAR(10)    NOT NULL
);




CREATE TABLE TextBook (
  TextBookID        INT            PRIMARY KEY   IDENTITY,
  TextBookName      VARCHAR(255)   NOT NULL,
  Category          VARCHAR(255)   NOT NULL,

);

CREATE TABLE Syllabus (
  SyllabusID           INT            PRIMARY KEY   IDENTITY,
  CourseID             INT            REFERENCES Course (CourseID), 
  ProfessorID          INT            REFERENCES Professor (ProfessorID), 
  TextBookID           varchar(100)   Default Null, 
  Semester             VARCHAR(60)    NOT NULL,
  LearningObjective    VARCHAR(max)   NOT NULL,
  prerequisite         INT            DEFAULT NULL
);

CREATE TABLE SyllabusAudit (
  SyllabusAuditID      INT            PRIMARY KEY   IDENTITY,
  SyllabusID           INT            ,
  CourseID             INT            , 
  ProfessorID          INT            , 
  TextBookID           varchar(100)   , 
  Semester             VARCHAR(60)    ,
  LearningObjective    VARCHAR(max)   ,
  prerequisite         INT            ,
  Audit_Action         varchar(10)    ,
  Action_By            INT            ,
  Action_At            DATETIME       ,
  Remark               Varchar(max)
);

CREATE TABLE CourseSchedule (
  CourseScheduleID      INT            PRIMARY KEY  IDENTITY,
  SyllabusID            INT            REFERENCES Syllabus (SyllabusID),
  CourseID              INT            REFERENCES Course (CourseID),
  Module                Varchar(20)    NOT NULL,
  CourseContents        Varchar(max)   NOT NULL,
  StartDate             Date           NOT NULL,
  EndDate               Date            NOT NULL
);

SET IDENTITY_INSERT Department ON;
INSERT INTO Department (DepartmentID, DepartmentName, DepartmentCode) VALUES
(1, 'Information Technology', 'IFT'),
(2, 'Computer Science','CS'),
(3, 'Software Engineering','SE'), 
(4, 'Computer Engineering', 'CE');
SET IDENTITY_INSERT Department OFF;

SET IDENTITY_INSERT Professor ON;
INSERT INTO Professor (ProfessorID, DepartmentID, Name,EmailID,ContactNumber) VALUES
(1, 1, 'Robert R','RR@gmail.com','6021133444'),
(2, 1,'Asmaa E','AE@gmail.com','6021133444'),
(3, 1,'Dinesh S','DS@gmail.com','6021133444'), 
(4, 1, 'Sushmita H','SH@gmail.com','6023342846'),
(5, 1, 'Navya T','NT@gmail.com','4255314445');
SET IDENTITY_INSERT Professor OFF;

SET IDENTITY_INSERT ProgramChair ON;
INSERT INTO ProgramChair (ProgramChairID, DepartmentID, Name,EmailID,ContactNumber) VALUES
(1, 1, 'Tatiana W','TT@gmail.com','6021133444');
SET IDENTITY_INSERT ProgramChair OFF;


SET IDENTITY_INSERT course ON;
INSERT INTO course (CourseID, DepartmentID, ProfessorID,CourseCode,CourseName,CourseType) VALUES
(1, 1, 1,'IFT1','Advanced Database Management','icourse'),
(2, 1,2, 'IFT2','Analyzing Big Data','in-person'),
(3, 1,3, 'IFT3','Principle of Computer Architecture','in-person');
SET IDENTITY_INSERT course OFF;


SET IDENTITY_INSERT TextBook ON;
INSERT INTO TextBook (TextBookID, TextBookName,Category) VALUES
(1, 'Murachs SQL server for developers','Database'),
(2, 'Halpin, Morgan( 2008) Information Modeling and Relational Databases 2nd edition, Kaufman','Database');
SET IDENTITY_INSERT TextBook OFF;

SET IDENTITY_INSERT Syllabus ON;
INSERT INTO Syllabus (SyllabusID, CourseID, ProfessorID,textbookid,Semester,LearningObjective, prerequisite) VALUES
(1, 1, 1,'1,2','fall','1.Understand the principles of conceptual modeling,2.understand the use of scripts when implementing SQL code', NULL),
(2, 1, 1,'1,2','Spring','1.Understand the principles of conceptual modeling,2.understand the use of scripts when implementing SQL code', NULL);
SET IDENTITY_INSERT Syllabus OFF;

