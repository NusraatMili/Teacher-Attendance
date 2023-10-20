CREATE database TeachersAttendance;

USE TeachersAttendance;

CREATE TABLE Teachers (
  Teacher_id INT PRIMARY KEY,
  Teacher_name VARCHAR(50),
  Teacher_Designation VARCHAR(50),
  Teacher_PhoneNumber DECIMAL(11,0)
  );
  
INSERT INTO Teachers (Teacher_id, Teacher_name, Teacher_Designation, Teacher_PhoneNumber)
VALUES
  (1001, 'MD Nasir Uddin', 'Head Teacher', 01869563412),
  (1002, 'Lutfur Hossen', 'Assistant Head Master', 01782345997),
  (1003, 'Arif Seikh', 'Professor', 01952348601),
  (1004, 'Afroza Akter', 'Senior Teacher', 01688429523);
  
 Select * from Teachers;

 CREATE TABLE Attendance (
  Attendance_id INT PRIMARY KEY,
  Teacher_id INT,
  Date DATE,
  Attendance_Status VARCHAR(10),
  FOREIGN KEY (Teacher_id) REFERENCES Teachers(Teacher_id)
);

INSERT INTO Attendance (Attendance_id, Teacher_id, Date, Attendance_Status)
VALUES
  (1, 1001, '2023-06-20', 'Present'),
  (2, 1002, '2023-06-20', 'Present'),
  (3, 1003, '2023-06-20', 'Absent'),
  (4, 1004, '2023-06-20', 'Present');

SELECT * FROM Attendance;
  
UPDATE Attendance SET Attendance_Status = 'Late' WHERE Teacher_id = 1002;

SELECT * FROM Attendance;

SELECT t.Teacher_name, count(Attendance_Status) as 'Total Present' 
FROM Attendance as a
JOIN Teachers as t ON a.Teacher_id = t.Teacher_id
WHERE Attendance_Status = 'Present' 
GROUP BY a.Teacher_id;

 UPDATE Teachers SET Teacher_PhoneNumber = 01815671113
 WHERE Teacher_id = 1004;
 
 SELECT * FROM Teachers;
 

