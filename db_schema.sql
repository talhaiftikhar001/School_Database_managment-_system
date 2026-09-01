-- PostgreSQL Schema for School Database Management System
-- Run this in your Supabase SQL Editor to create all tables

-- Drop tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS ExamResults CASCADE;
DROP TABLE IF EXISTS Exams CASCADE;
DROP TABLE IF EXISTS TeacherActivities CASCADE;
DROP TABLE IF EXISTS TeacherAssignments CASCADE;
DROP TABLE IF EXISTS TeacherSubjects CASCADE;
DROP TABLE IF EXISTS Attendance CASCADE;
DROP TABLE IF EXISTS Fees CASCADE;
DROP TABLE IF EXISTS Enrollments CASCADE;
DROP TABLE IF EXISTS Subjects CASCADE;
DROP TABLE IF EXISTS Sections CASCADE;
DROP TABLE IF EXISTS Classes CASCADE;
DROP TABLE IF EXISTS Students CASCADE;
DROP TABLE IF EXISTS Guardians CASCADE;
DROP TABLE IF EXISTS Teachers CASCADE;
DROP TABLE IF EXISTS Admins CASCADE;

-- Admins table
CREATE TABLE Admins (
    AdminID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL DEFAULT 'admin'
);

-- Guardians table
CREATE TABLE Guardians (
    GuardianID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Relationship VARCHAR(100),
    Contact VARCHAR(50),
    Email VARCHAR(255)
);

-- Teachers table
CREATE TABLE Teachers (
    TeacherID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(10),
    Contact VARCHAR(50),
    Email VARCHAR(255) UNIQUE
);

-- Students table
CREATE TABLE Students (
    StudentID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Address TEXT,
    Contact VARCHAR(50),
    GuardianID INTEGER REFERENCES Guardians(GuardianID),
    AdmissionDate DATE DEFAULT CURRENT_DATE
);

-- Classes table
CREATE TABLE Classes (
    ClassID SERIAL PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL UNIQUE,
    RoomNumber VARCHAR(50)
);

-- Sections table
CREATE TABLE Sections (
    SectionID SERIAL PRIMARY KEY,
    ClassID INTEGER NOT NULL REFERENCES Classes(ClassID),
    SectionName VARCHAR(50) NOT NULL
);

-- Subjects table
CREATE TABLE Subjects (
    SubjectID SERIAL PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL,
    ClassID INTEGER NOT NULL REFERENCES Classes(ClassID)
);

-- Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID SERIAL PRIMARY KEY,
    StudentID INTEGER NOT NULL REFERENCES Students(StudentID),
    ClassID INTEGER NOT NULL REFERENCES Classes(ClassID),
    SectionID INTEGER NOT NULL REFERENCES Sections(SectionID),
    EnrollmentDate DATE DEFAULT CURRENT_DATE,
    AcademicYear VARCHAR(20),
    Status VARCHAR(20) DEFAULT 'Active'
);

-- Attendance table
CREATE TABLE Attendance (
    AttendanceID SERIAL PRIMARY KEY,
    StudentID INTEGER NOT NULL REFERENCES Students(StudentID),
    Date DATE NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Present'
);

-- Exams table
CREATE TABLE Exams (
    ExamID SERIAL PRIMARY KEY,
    SubjectID INTEGER NOT NULL REFERENCES Subjects(SubjectID),
    ExamDate DATE,
    TotalMarks INTEGER NOT NULL
);

-- ExamResults table
CREATE TABLE ExamResults (
    ResultID SERIAL PRIMARY KEY,
    StudentID INTEGER NOT NULL REFERENCES Students(StudentID),
    ExamID INTEGER NOT NULL REFERENCES Exams(ExamID),
    MarksObtained INTEGER
);

-- Fees table
CREATE TABLE Fees (
    FeeID SERIAL PRIMARY KEY,
    StudentID INTEGER NOT NULL REFERENCES Students(StudentID),
    Amount DECIMAL(10,2) NOT NULL,
    DueDate DATE NOT NULL,
    PaidDate DATE,
    Status VARCHAR(20) DEFAULT 'Unpaid'
);

-- TeacherAssignments table
CREATE TABLE TeacherAssignments (
    AssignmentID SERIAL PRIMARY KEY,
    TeacherID INTEGER NOT NULL REFERENCES Teachers(TeacherID),
    ClassID INTEGER NOT NULL REFERENCES Classes(ClassID),
    SectionID INTEGER NOT NULL REFERENCES Sections(SectionID),
    SubjectID INTEGER NOT NULL REFERENCES Subjects(SubjectID)
);

-- TeacherSubjects table
CREATE TABLE TeacherSubjects (
    ID SERIAL PRIMARY KEY,
    TeacherID INTEGER NOT NULL REFERENCES Teachers(TeacherID),
    SubjectID INTEGER NOT NULL REFERENCES Subjects(SubjectID)
);

-- TeacherActivities table
CREATE TABLE TeacherActivities (
    ActivityID SERIAL PRIMARY KEY,
    TeacherID INTEGER NOT NULL REFERENCES Teachers(TeacherID),
    ClassID INTEGER NOT NULL REFERENCES Classes(ClassID),
    SectionID INTEGER NOT NULL REFERENCES Sections(SectionID),
    ActivityDate TIMESTAMP DEFAULT NOW(),
    ActivityType VARCHAR(100) NOT NULL
);

-- Insert default admin account
INSERT INTO Admins (Username, PasswordHash, Role) VALUES ('admin@school.com', 'admin123', 'admin');
