-- Users table
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    RoleId INT
);

-- Roles table
CREATE TABLE Roles (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL
);

-- Students table
CREATE TABLE Students (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    EnrollmentDate DATE,
    UserId INT FOREIGN KEY REFERENCES Users(Id)
);

-- Teachers table
CREATE TABLE Teachers (
    TeacherId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE,
    UserId INT FOREIGN KEY REFERENCES Users(Id)
);

-- Populating Roles table with possible roles 

INSERT INTO Roles (Id, Name) VALUES
(1, 'Student'),
(2, 'Teacher');

-- Populating Users table with sample student
INSERT INTO Users (Username, Password, Email, RoleId) VALUES
('samplestudent', 'hashedpassword', 'student@example.com', 1);

-- Populating Student table with sample student

INSERT INTO Students (FirstName, LastName, EnrollmentDate, UserId) VALUES
('Mickey', 'Mouse', '2023-08-03', (SELECT Id FROM Users WHERE Username = 'samplestudent'));

-- Populating Users table with sample teacher
INSERT INTO Users (Username, Password, Email, RoleId) VALUES
('sampleteacher', 'hashedpassword1', 'teacher@example.com', 2);

-- Populating Teacher table with sample student

INSERT INTO Teachers(FirstName, LastName, HireDate, UserId) VALUES
('Donald', 'Duck', '2012-09-01', (SELECT Id FROM Users WHERE Username = 'sampleteacher'));

DELETE FROM Teachers
WHERE TeacherId = 1; 





