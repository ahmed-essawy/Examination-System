USE SQLProject

GO

-- START Departments table

CREATE PROC [dbo].[Insert_Department] @DP_Name varchar(50), @DP_Manager int
AS
BEGIN
  IF NOT EXISTS (SELECT DP_ID FROM Departments WHERE DP_Name = @DP_Name)
    INSERT INTO Departments (DP_Name, DP_Manager) VALUES (@DP_Name, @DP_Manager)
  ELSE
    PRINT ('Department ' + @DP_Name + ' already exists')
END

GO
  
CREATE PROC [dbo].[Update_Department] @DP_ID int, @DP_Name varchar(50), @DP_Manager int
AS
BEGIN
  IF EXISTS (SELECT DP_ID FROM Departments WHERE DP_ID = @DP_ID)
    UPDATE Departments SET DP_Name = @DP_Name, DP_Manager = @DP_Manager WHERE DP_ID = @DP_ID
  ELSE
    PRINT ('Department #' + CAST(@DP_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Department] @DP_ID int
AS
BEGIN
  IF EXISTS (SELECT DP_ID FROM Departments WHERE DP_ID = @DP_ID)
  BEGIN
    IF NOT EXISTS (SELECT @DP_ID FROM Instructors, Students WHERE Instructors.DP_ID = @DP_ID OR Students.DP_ID = @DP_ID)
      DELETE Departments WHERE DP_ID = @DP_ID
    ELSE
      PRINT ('Department #' + CAST(@DP_ID AS varchar(20)) + ' can''t be deleted')
  END
  ELSE
    PRINT ('Department #' + CAST(@DP_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Departments table

-- START Instructors table

CREATE PROC [dbo].[Insert_Instructor] @IN_ID int, @IN_Fname varchar(50), @IN_Lname varchar(50), @IN_Bdate date, @IN_Phone varchar(50), @IN_Salary money, @IN_Street varchar(50), @IN_City varchar(50), @IN_Country varchar(50), @DP_ID int
AS
BEGIN
  IF NOT EXISTS (SELECT IN_ID FROM Instructors WHERE IN_ID = @IN_ID)
    INSERT INTO Instructors (IN_ID, IN_Fname, IN_Lname, IN_Bdate, IN_Phone, IN_Salary, IN_Street, IN_City, IN_Country, DP_ID)
      VALUES (@IN_ID, @IN_Fname, @IN_Lname, @IN_Bdate, @IN_Phone, @IN_Salary, @IN_Street, @IN_City, @IN_Country, @DP_ID)
  ELSE
    PRINT ('Instructor "' + @IN_Fname + ' ' + @IN_Lname + '" already exists')
END

GO

CREATE PROC [dbo].[Update_Instructor] @IN_ID int, @IN_Fname varchar(50), @IN_Lname varchar(50), @IN_Bdate date, @IN_Phone varchar(50), @IN_Salary money, @IN_Street varchar(50), @IN_City varchar(50), @IN_Country varchar(50), @DP_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID FROM Instructors WHERE IN_ID = @IN_ID)
  BEGIN
    DECLARE @RET_VAL int
    EXEC @RET_VAL = Convert_Date @IN_Bdate, @RET_VAL
    UPDATE Instructors SET IN_Fname = @IN_Fname, IN_Lname = @IN_Lname, IN_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), IN_Phone = @IN_Phone, IN_Salary = @IN_Salary, IN_Street = @IN_Street, IN_City = @IN_City, IN_Country = @IN_Country, DP_ID = @DP_ID WHERE IN_ID = @IN_ID
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Instructor] @IN_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID FROM Instructors WHERE IN_ID = @IN_ID)
	IF NOT EXISTS (SELECT * FROM Departments WHERE DP_Manager=@IN_ID)
      DELETE Instructors WHERE IN_ID = @IN_ID
	ELSE
	  PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' is a manager')
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Instructors table

-- START Instructors with Courses table

CREATE PROC [dbo].[Insert_Instructor_Course] @CR_ID int, @IN_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID, CR_ID FROM Instructors, Courses WHERE IN_ID = @IN_ID AND CR_ID = @CR_ID)
  BEGIN
    IF NOT EXISTS (SELECT * FROM IN_Courses WHERE IN_ID = @IN_ID AND CR_ID = @CR_ID)
      INSERT INTO IN_Courses (CR_ID, IN_ID) VALUES (@CR_ID, @IN_ID)
    ELSE
      PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' already exists')
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' OR Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Instructor_Course] @CR_ID int, @IN_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID, CR_ID FROM Instructors, Courses WHERE IN_ID = @IN_ID AND CR_ID = @CR_ID)
    DELETE IN_Courses WHERE CR_ID = @CR_ID AND IN_ID = @IN_ID
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Instructors with Courses table

-- START Exams table procedures

CREATE PROC [dbo].[Insert_Exam] @CR_Name varchar(50), @MCQ_Num int, @TF_Num int
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_Name = @CR_Name)
  BEGIN
    DECLARE @CR_ID int
    SELECT @CR_ID = CR_ID FROM Courses WHERE CR_Name = @CR_Name
    IF (SELECT COUNT(*) FROM Questions WHERE CR_ID = @CR_ID AND QS_Type = 'MCQ') >= @MCQ_Num
      AND (SELECT COUNT(*) FROM Questions WHERE CR_ID = @CR_ID AND QS_Type = 'T/F') >= @TF_Num
    BEGIN
      INSERT INTO Exams DEFAULT VALUES
      DECLARE @EX_ID int = @@Identity
      INSERT INTO CR_EX_QS (CR_ID, EX_ID, QS_ID)
        SELECT TOP (@MCQ_Num) CR_ID, @EX_ID, QS_ID FROM Questions WHERE CR_ID = @CR_ID AND QS_Type = 'MCQ' ORDER BY NEWID()
      INSERT INTO CR_EX_QS (CR_ID, EX_ID, QS_ID)
        SELECT TOP (@TF_Num) CR_ID, @EX_ID, QS_ID FROM Questions WHERE CR_ID = @CR_ID AND QS_Type = 'T/F' ORDER BY NEWID()
    END
    ELSE
      PRINT ('Insufficient number of questions for ' + @CR_Name)
  END
  ELSE
    PRINT ('Course "' + @CR_Name + '" doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Exam] @EX_ID int
AS
BEGIN
  IF EXISTS (SELECT EX_Date FROM Exams WHERE EX_ID = @EX_ID)
    DELETE FROM Exams WHERE EX_ID = @EX_ID
  ELSE
    PRINT ('Exam #' + CAST(@EX_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Exams table procedures

-- START Choices table procedures

CREATE PROC [dbo].[Update_Question_Choices] @QS_ID int, @Choice1 varchar(max), @Choice2 varchar(max), @Choice3 varchar(max), @Choice4 varchar(max)
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM Questions WHERE QS_ID = @QS_ID)
  BEGIN
	DELETE FROM QS_Choices WHERE QS_ID = @QS_ID
	INSERT INTO QS_Choices VALUES (@QS_ID, @Choice1), (@QS_ID, @Choice2), (@QS_ID, @Choice3), (@QS_ID, @Choice4)
  END
  ELSE
    PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Choice] @QS_ID int, @Choice varchar(max)
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM QS_Choices WHERE QS_ID = @QS_ID AND Choice = @Choice)
    UPDATE QS_Choices SET Choice = @Choice WHERE QS_ID = @QS_ID AND Choice = @Choice
  ELSE
    PRINT ('Choice "' + @Choice + '" doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Choice] @QS_ID int, @Choice varchar(max)
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM QS_Choices WHERE QS_ID = @QS_ID AND Choice = @Choice)
    DELETE FROM QS_Choices WHERE QS_ID = @QS_ID AND Choice = @Choice
  ELSE
    PRINT ('Choice "' + @Choice + '" doesn''t exists')
END

GO -- END Choices table procedures

-- START Questions table procedures

CREATE PROC [dbo].[Insert_Question_MCQ] @CR_Name varchar(50), @Question varchar(max), @Choice1 varchar(max), @Choice2 varchar(max), @Choice3 varchar(max), @Choice4 varchar(max), @Correct_Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_Name = @CR_Name)
  BEGIN
    DECLARE @CR_ID int
    SELECT @CR_ID = CR_ID FROM Courses WHERE CR_Name = @CR_Name
    INSERT INTO Questions VALUES (@Question, 'MCQ', @Correct_Answer, 2, @CR_ID)
    DECLARE @QS_ID int = @@IDENTITY
    INSERT INTO QS_Choices VALUES (@QS_ID, @Choice1), (@QS_ID, @Choice2), (@QS_ID, @Choice3), (@QS_ID, @Choice4)
  END
  ELSE
    PRINT ('Course "' + @CR_Name + '" doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Question_MCQ] @QS_ID int, @Choice1 varchar(max), @Choice2 varchar(max), @Choice3 varchar(max), @Choice4 varchar(max), @Correct_Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM Questions WHERE QS_ID = @QS_ID)
	IF NOT EXISTS (SELECT QS_ID FROM CR_EX_QS WHERE QS_ID = @QS_ID)
	BEGIN
      UPDATE Questions SET QS_Correct = @Correct_Answer WHERE QS_ID = @QS_ID
      EXEC [Update_Question_Choices] @QS_ID, @Choice1, @Choice2, @Choice3, @Choice4
	END
	ELSE
      PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' already exists in Exam')
  ELSE
    PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Insert_Question_TF] @CR_Name varchar(50), @Question varchar(max), @Correct_Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_Name = @CR_Name)
  BEGIN
    DECLARE @CR_ID int
    SELECT @CR_ID = CR_ID FROM Courses WHERE CR_Name = @CR_Name
    INSERT INTO Questions VALUES (@Question, 'T/F', @Correct_Answer, 1, @CR_ID)
  END
  ELSE
    PRINT ('Course "' + @CR_Name + '" doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Question_TF] @QS_ID int, @Correct_Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM Questions WHERE QS_ID = @QS_ID)
	IF NOT EXISTS (SELECT QS_ID FROM CR_EX_QS WHERE QS_ID = @QS_ID)
	  UPDATE Questions SET QS_Correct = @Correct_Answer WHERE QS_ID = @QS_ID
	ELSE
      PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' already exists in Exam')
  ELSE
    PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Question] @QS_ID int, @QS_Value varchar(max), @QS_Grade int
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM Questions WHERE QS_ID = @QS_ID)
	IF NOT EXISTS (SELECT QS_ID FROM CR_EX_QS WHERE QS_ID = @QS_ID)
	  UPDATE Questions SET QS_Grade = @QS_Grade, QS_Value = @QS_Value WHERE QS_ID = @QS_ID
	ELSE
      PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' already exists in Exam')
  ELSE
    PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Question] @QS_ID int
AS
BEGIN
  IF EXISTS (SELECT QS_ID FROM Questions WHERE QS_ID = @QS_ID)
	IF NOT EXISTS (SELECT QS_ID FROM CR_EX_QS WHERE QS_ID = @QS_ID)
	  DELETE FROM Questions WHERE QS_ID = @QS_ID
	ELSE
      PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' already exists in Exam')
  ELSE
    PRINT ('Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Questions table procedures

-- START Courses table

CREATE PROC [dbo].[Insert_Course] @CR_Name varchar(50), @CR_Grade int
AS
BEGIN
  IF not EXISTS (SELECT CR_ID FROM Courses WHERE CR_Name = @CR_Name)
    INSERT INTO Courses
      VALUES (@CR_Name, @CR_Grade)
  ELSE
    PRINT ('Course "' + @CR_Name + '" already exists')
END

GO

CREATE PROC [dbo].[Update_Course] @CR_ID int, @CR_Name varchar(50), @CR_Grade int
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_ID = @CR_ID)
    UPDATE Courses SET CR_Name = @CR_Name, CR_Grade = @CR_Grade WHERE CR_ID = @CR_ID
  ELSE
    PRINT ('Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Delete_Course] @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_ID = @CR_ID)
  BEGIN
    IF NOT EXISTS (SELECT CR_ID FROM CR_EX_QS WHERE CR_ID = @CR_ID)
	AND NOT EXISTS (SELECT CR_ID FROM IN_ST_CR WHERE CR_ID = @CR_ID)
	  DELETE FROM Courses WHERE CR_ID = @CR_ID
    ELSE
	  PRINT ('Course #' + CAST(@CR_ID AS varchar(20)) + ' can''t be deleted')
  END
  ELSE
    PRINT ('Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Courses table

-- START Topics table

CREATE PROC [dbo].[Insert_Topic] @TP_Name varchar(50), @CR_ID int
AS
BEGIN
  IF NOT EXISTS (SELECT TP_ID FROM Topics WHERE TP_Name = @TP_Name and CR_ID = @CR_ID)
  BEGIN
    IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_ID = @CR_ID)
      INSERT INTO Topics VALUES (@TP_Name, @CR_ID)
    ELSE
      PRINT ('Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
  END
  ELSE
    PRINT ('Topic "' + @TP_Name + '" already exists')
END

GO

CREATE PROC [dbo].[Update_Topic] @TP_ID int, @TP_Name varchar(50), @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT TP_ID FROM Topics WHERE TP_ID = @TP_ID AND CR_ID = @CR_ID)
      UPDATE Topics SET TP_Name = @TP_Name WHERE TP_ID = @TP_ID AND CR_ID = @CR_ID
  ELSE
    PRINT ('Topic #' + CAST(@TP_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE proc [dbo].[Delete_Topic] @TP_ID int, @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT TP_ID FROM Topics WHERE TP_ID =@TP_ID AND CR_ID = @CR_ID)
    DELETE FROM Topics WHERE TP_ID = @TP_ID
  ELSE
    PRINT ('Topic #' + CAST(@TP_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Topics table

-- START Students table

CREATE PROC Insert_Student @ST_ID int, @ST_Fname varchar(50), @ST_Lname varchar(50), @ST_Bdate date, @ST_Phone varchar(50), @ST_Salary money, @ST_Street varchar(50), @ST_City varchar(50), @ST_Country varchar(50), @DP_ID int
AS
BEGIN
  IF NOT EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @ST_ID)
    INSERT INTO Students (ST_ID, ST_Fname, ST_Lname, ST_Bdate, ST_Phone, ST_Salary, ST_Street, ST_City, ST_Country, DP_ID)
      VALUES (@ST_ID, @ST_Fname, @ST_Lname, @ST_Bdate, @ST_Phone, @ST_Salary, @ST_Street, @ST_City, @ST_Country, @DP_ID)
  ELSE
    PRINT ('Student "' + @ST_Fname + ' ' + @ST_Lname + '" already exists')
END

GO

CREATE PROC Update_Student @ST_ID int, @ST_Fname varchar(50), @ST_Lname varchar(50), @ST_Bdate date, @ST_Phone varchar(50), @ST_Salary money, @ST_Street varchar(50), @ST_City varchar(50), @ST_Country varchar(50), @DP_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @ST_ID)
  BEGIN
    DECLARE @RET_VAL int
    EXEC @RET_VAL = Convert_Date @ST_Bdate, @RET_VAL
    UPDATE Students SET ST_Fname = @ST_Fname, ST_Lname = @ST_Lname, ST_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), ST_Phone = @ST_Phone, ST_Salary = @ST_Salary, ST_Street = @ST_Street, ST_City = @ST_City, ST_Country = @ST_Country, DP_ID = @DP_ID  WHERE ST_ID = @ST_ID
  END
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Delete_Student @ST_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @ST_ID)
    DELETE FROM Students WHERE ST_ID = @ST_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Students table

-- START Instructors with Students with Courses table

CREATE PROC Insert_IN_ST_CR @IN_ID int, @ST_ID int, @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID, ST_ID, CR_ID FROM Instructors, Students, Courses WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID)
  BEGIN
    IF NOT EXISTS (SELECT IN_ID, ST_ID, CR_ID FROM IN_ST_CR WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID)
      INSERT INTO IN_ST_CR (IN_ID, ST_ID, CR_ID) VALUES (@IN_ID, @ST_ID, @CR_ID)
    ELSE
      PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' already exists')
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' OR Student #' + CAST(@ST_ID AS varchar(20)) + ' OR Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_IN_ST_CR] @IN_ID int, @ST_ID int, @CR_ID int, @Date varchar(50)
AS
BEGIN
  IF EXISTS (SELECT IN_ID, ST_ID, CR_ID FROM IN_ST_CR WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID)
  BEGIN
    DECLARE @RET_VAL int
    EXEC @RET_VAL = Convert_Date @Date, @RET_VAL
    UPDATE IN_ST_CR SET Date = CONVERT(date, CONVERT(varchar(8), @RET_VAL)) WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Grade] @IN_ID int, @ST_ID int, @CR_ID int, @Grade int
AS
BEGIN
  IF EXISTS (SELECT IN_ID, ST_ID, CR_ID FROM IN_ST_CR WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID)
  BEGIN
	IF @Grade <= [dbo].CR_Grade(@CR_ID)
	  UPDATE IN_ST_CR SET Grade = @Grade WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID
	ELSE
      PRINT ('Grade must be smaller than ' + CAST([dbo].CR_Grade(@CR_ID) AS varchar(20)))
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Delete_IN_ST_CR @IN_ID int, @ST_ID int, @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID, ST_ID, CR_ID FROM IN_ST_CR WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID)
  BEGIN
    DELETE FROM IN_ST_CR WHERE IN_ID = @IN_ID AND ST_ID = @ST_ID AND CR_ID = @CR_ID
  END
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' with Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Instructors with Students with Courses table

-- START Students with Courses table
CREATE PROC Insert_ST_Courses @ST_ID int, @CR_ID int, @Grade int
AS
BEGIN
  IF EXISTS (SELECT ST_ID, CR_ID FROM ST_Courses WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID)
  BEGIN
    IF NOT EXISTS (SELECT * FROM ST_Courses WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID)
      INSERT INTO ST_Courses (ST_ID, CR_ID, Grade) VALUES (@ST_ID, @CR_ID, @Grade)
    ELSE
      PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' already exists')
  END
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' OR Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Update_ST_Courses @ST_ID int, @CR_ID int, @Grade int
AS
BEGIN
  IF EXISTS (SELECT * FROM ST_Courses WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID)
    UPDATE ST_Courses SET Grade = @Grade WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Delete_ST_Courses @ST_ID int, @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT * FROM ST_Courses WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID)
    DELETE FROM ST_Courses WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- START Students with Courses table

-- START Students with Question and Answers
CREATE PROC Insert_ST_EX_Answers (@ST_ID int, @EX_ID int, @QS_ID int, @Answer varchar(100))
AS
BEGIN
  IF EXISTS (SELECT ST_ID, EX_ID, QS_ID FROM Students, Exams, Questions WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID)
  BEGIN
    IF NOT EXISTS (SELECT ST_ID, EX_ID, QS_ID FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID)
      INSERT INTO ST_EX_Answers (ST_ID, EX_ID, QS_ID, Answer) VALUES (@ST_ID, @EX_ID, @QS_ID, @Answer)
    ELSE
      PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Question #' + CAST(@QS_ID AS varchar(20)) + ' already exists')
  END
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' OR Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_ST_EX_Answers] @ST_ID int, @EX_ID int, @QS_ID int, @Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT ST_ID, EX_ID, QS_ID FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID)
    UPDATE ST_EX_Answers SET Answer = @Answer, Finished = 1, Date = GETDATE() WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Delete_ST_EX_Answers @ST_ID int, @EX_ID int, @QS_ID int, @Answer varchar(max)
AS
BEGIN
  IF EXISTS (SELECT ST_ID, EX_ID, QS_ID FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID)
    DELETE FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID AND QS_ID = @QS_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Question #' + CAST(@QS_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Insert_Student_Exam @ST_ID int, @EX_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @ST_ID)
    AND EXISTS (SELECT * FROM Exams WHERE EX_ID = @EX_ID)
  BEGIN
    INSERT INTO ST_EX_Answers (ST_ID, EX_ID, QS_ID)
      SELECT @ST_ID ST_ID, EX_ID, QS_ID FROM CR_EX_QS WHERE EX_ID = @EX_ID
  END
  ELSE
    PRINT ('Student #' + @ST_ID + ' OR Exam #' + @EX_ID + ' doesn''t exist')
END

GO -- END Students with Question and Answers

-- START Administrators table

CREATE PROC Insert_Administrator @AD_ID int, @AD_Fname varchar(50), @AD_Lname varchar(50), @AD_Bdate date, @AD_Phone varchar(50), @AD_Salary money, @AD_Street varchar(50), @AD_City varchar(50), @AD_Country varchar(50)
AS
BEGIN
  IF NOT EXISTS (SELECT AD_ID FROM Administrators WHERE AD_ID = @AD_ID)
    INSERT INTO Administrators (AD_ID, AD_Fname, AD_Lname, AD_Bdate, AD_Phone, AD_Salary, AD_Street, AD_City, AD_Country)
      VALUES (@AD_ID, @AD_Fname, @AD_Lname, @AD_Bdate, @AD_Phone, @AD_Salary, @AD_Street, @AD_City, @AD_Country)
  ELSE
    PRINT ('Administrator "' + @AD_Fname + ' ' + @AD_Lname + '" already exists')
END

GO

CREATE PROC Update_Administrator @AD_ID int, @AD_Fname varchar(50), @AD_Lname varchar(50), @AD_Bdate date, @AD_Phone varchar(50), @AD_Salary money, @AD_Street varchar(50), @AD_City varchar(50), @AD_Country varchar(50)
AS
BEGIN
  IF EXISTS (SELECT AD_ID FROM Administrators WHERE AD_ID = @AD_ID)
  BEGIN
    DECLARE @RET_VAL int
    EXEC @RET_VAL = Convert_Date @AD_Bdate, @RET_VAL
    UPDATE Administrators SET AD_Fname = @AD_Fname, AD_Lname = @AD_Lname, AD_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), AD_Phone = @AD_Phone, AD_Salary = @AD_Salary, AD_Street = @AD_Street, AD_City = @AD_City, AD_Country = @AD_Country  WHERE AD_ID = @AD_ID
  END
  ELSE
    PRINT ('Administrator #' + CAST(@AD_ID AS varchar(20)) + ' doesn''t exists')
END

GO

CREATE PROC Delete_Administrator @AD_ID int
AS
BEGIN
  IF EXISTS (SELECT AD_ID FROM Administrators WHERE AD_ID = @AD_ID)
    DELETE FROM Administrators WHERE AD_ID = @AD_ID
  ELSE
    PRINT ('Administrator #' + CAST(@AD_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Administrators table