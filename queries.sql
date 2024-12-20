-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(15)
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert sample data into Departments
INSERT INTO Departments (Name, Location)
VALUES
('Cardiology', 'Building A, Floor 2'),
('Neurology', 'Building B, Floor 3'),
('Pediatrics', 'Building C, Floor 1'),
('Oncology', 'Building D, Floor 4'),
('Orthopedics', 'Building E, Floor 2');

-- Insert sample data into Doctors
INSERT INTO Doctors (Name, Specialization, Phone, DepartmentID)
VALUES
('Dr. John Smith', 'Cardiologist', '123-456-7890', 1),
('Dr. Jane Doe', 'Neurologist', '987-654-3210', 2),
('Dr. Alan Grant', 'Pediatrician', '555-111-2222', 3),
('Dr. Sarah Connor', 'Oncologist', '444-333-5555', 4),
('Dr. Mark Green', 'Orthopedic Surgeon', '111-222-3333', 5);

-- Insert sample data into Patients
INSERT INTO Patients (Name, Age, Gender, Phone)
VALUES
('Alice Brown', 30, 'Female', '555-987-6543'),
('Bob Johnson', 45, 'Male', '555-123-4567'),
('Charlie Davis', 12, 'Male', '555-234-5678'),
('Diana Prince', 50, 'Female', '555-345-6789'),
('Edward King', 27, 'Male', '555-456-7890');

-- Insert sample data into Appointments
INSERT INTO Appointments (Date, Time, Status, DoctorID, PatientID)
VALUES
('2024-12-20', '10:00:00', 'Scheduled', 1, 1),
('2024-12-21', '11:30:00', 'Scheduled', 2, 2),
('2024-12-22', '09:15:00', 'Completed', 3, 3),
('2024-12-23', '14:00:00', 'Cancelled', 4, 4),
('2024-12-24', '16:45:00', 'Scheduled', 5, 5);
