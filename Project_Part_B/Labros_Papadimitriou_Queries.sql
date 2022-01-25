USE ProjectPartB
GO

--A list of all courses
SELECT * FROM Courses

--A list of all trainer
SELECT * FROM Trainers

--A list of all students
SELECT * FROM Students

--A list of all assignments
SELECT * FROM Assignments

--All the trainers per course
SELECT t.FirstName,t.LastName,c.Title FROM Trainers t
inner join TrainerCourses tc
ON t.Id = tc.Trainer_Id
inner join Courses c
ON c.Id = tc.Course_Id

--All the students per course
SELECT s.FirstName,s.LastName,c.Title,c.Type FROM Students s
inner join StudentCourses sc
ON s.Id = sc.Student_Id
inner join Courses c
ON c.Id = sc.Course_Id

--All the assignments per course
SELECT a.Title, c.Title,c.Type FROM Assignments a
inner join Courses c 
ON c.Id = a.Course_Id

--All the assignments per course per student
SELECT s.FirstName, s.LastName, c.Title AS [Course Title], a.Title AS [Assingmnet Title] FROM Students s
inner join StudentCourses sc
ON s.Id = sc.Student_Id
inner join Courses c
ON c.Id = sc.Course_Id
inner join Assignments a
ON a.Course_Id = c.Id

--A list of students that belong to more than one courses
SELECT s.FirstName AS [First Name], s.LastName AS [Last Name], Count(sc.Course_Id) AS [Number of Courses] FROM StudentCourses sc
inner join Students s 
ON sc.Student_Id = s.Id
inner join Courses c 
ON sc.Course_Id = c.Id
GROUP BY s.FirstName, s.LastName 
HAVING count(sc.Course_Id) > 1
