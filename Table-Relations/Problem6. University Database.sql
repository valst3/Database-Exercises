CREATE DATABASE University;

CREATE TABLE Majors(
	MajorID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(30) NOT NULL
);

CREATE TABLE Payments(
	PaymentID INT PRIMARY KEY IDENTITY,
	PaymentDate DATE,
	PaymentAmount DECIMAL,
	StudentID INT
);

CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY,
	StudentNumber VARCHAR(30) NOT NULL,
	StudentName VARCHAR(30) NOT NULL,
	MajorID INT
);

CREATE TABLE Agenda(
	StudentID INT NOT NULL,
	SubjectID INT NOT NULL
);

CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY IDENTITY,
	SubjectName VARCHAR(30) NOT NULL
);

ALTER TABLE Students
ADD FOREIGN KEY (MajorID) REFERENCES Majors(MajorID);

ALTER TABLE Payments
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE Agenda
ADD PRIMARY KEY (StudentID, SubjectID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);