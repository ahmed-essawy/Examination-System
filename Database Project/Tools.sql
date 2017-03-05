-- START All members view

CREATE VIEW AllMembers
AS
SELECT 0 AS ID, '--- [Administrators] ---' AS Name
UNION ALL
SELECT AD_ID AS ID, AD_Name AS Name FROM [dbo].[Administrators]
UNION ALL
SELECT 0 AS ID, '--- [Instructors] ---' AS Name
UNION ALL
SELECT IN_ID AS ID, IN_Name AS Name FROM [dbo].[Instructors]
UNION ALL
SELECT 0 AS ID, '--- [Students] ---' AS Name
UNION ALL
SELECT ST_ID AS ID, ST_Name AS Name FROM [dbo].[Students]

GO -- END All members view

-- START Login data table

CREATE PROC Insert_Login_Data @Username varchar(50), @Password varchar(50), @Email varchar(50)
AS
BEGIN
  IF NOT EXISTS (SELECT * FROM Login_Data WHERE Username = @Username OR Email = @Email)
    INSERT INTO Login_Data ([Username],[Password],[Email])VALUES (@Username, @Password, @Email)
  ELSE
    PRINT ('User "' + @Username + '" already exists')
END

GO

CREATE PROC [dbo].[Update_Login_Data] @Username varchar(50), @Password varchar(50), @Email varchar(50), @Role varchar(20), @Role_ID int
AS
BEGIN
  IF EXISTS (SELECT * FROM Login_Data WHERE Username = @Username OR Email = @Email)
    UPDATE Login_Data SET Password = @Password, Email = @Email, Role = @Role, Role_ID = @Role_ID WHERE Username = @Username
  ELSE
    PRINT ('User "' + @Username + '" doesn''t exists')
END

GO

CREATE PROC Delete_Login_Data @Username varchar(50)
AS
BEGIN
  IF EXISTS (SELECT * FROM Login_Data WHERE Username = @Username)
    DELETE FROM Login_Data WHERE Username = @Username
  ELSE
    PRINT ('User "' + @Username + '" doesn''t exists')
END

GO

CREATE PROC [dbo].[Update_Profile] @Role varchar(50), @Role_ID int, @F_Name varchar(50), @L_Name varchar(50), @Birthdate varchar(50), @Phone varchar(50), @Street varchar(50), @City varchar(50), @Country varchar(50)
AS
BEGIN
  DECLARE @RET_VAL int
  EXEC @RET_VAL = Convert_Date @Birthdate, @RET_VAL
  IF @Role = 'administrator' AND EXISTS (SELECT AD_ID FROM Administrators WHERE AD_ID = @Role_ID)
    UPDATE Administrators SET AD_Fname = @F_Name, AD_Lname = @L_Name, AD_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), AD_Phone = @Phone, AD_Street = @Street, AD_City = @City, AD_Country = @Country WHERE AD_ID = @Role_ID
  IF @Role = 'instructor' AND EXISTS (SELECT IN_ID FROM Instructors WHERE IN_ID = @Role_ID)
    UPDATE Instructors SET IN_Fname = @F_Name, IN_Lname = @L_Name, IN_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), IN_Phone = @Phone, IN_Street = @Street, IN_City = @City, IN_Country = @Country WHERE IN_ID = @Role_ID
  IF @Role = 'student' AND EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @Role_ID)
    UPDATE Students SET ST_Fname = @F_Name, ST_Lname = @L_Name, ST_Bdate = CONVERT(date, CONVERT(varchar(8), @RET_VAL)), ST_Phone = @Phone, ST_Street = @Street, ST_City = @City, ST_Country = @Country WHERE ST_ID = @Role_ID
  ELSE
    PRINT ('ID #' + CAST(@Role_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Login data table

-- START Check course grade

CREATE FUNCTION CR_Grade (@CR_ID int)
RETURNS int
AS
BEGIN
  RETURN (SELECT CR_Grade FROM courses WHERE CR_ID = @CR_ID)
END

GO

ALTER TABLE [dbo].[IN_ST_CR]
ADD CONSTRAINT [Check_Gradee] CHECK (([Grade]<=[dbo].[CR_Grade]([CR_ID])))

GO -- END Check course grade

-- START Check Corrective

CREATE PROC Check_Corrective @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_ID = @CR_ID)
  BEGIN
    SELECT DISTINCT b.ST_ID, a.ST_Name, b.Grade, c.CR_Name, c.CR_Grade FROM Students a, IN_ST_CR b, Courses c
    WHERE a.ST_ID = b.ST_ID AND b.CR_ID = c.CR_ID AND b.CR_ID = @CR_ID AND b.Grade < (c.CR_Grade / 2)
  END
  ELSE
    PRINT ('Course #' + @CR_ID + ' doesn''t exist')
END

GO

CREATE PROC Check_Corrective_By_Dep @DP_ID int
AS
BEGIN
  IF EXISTS (SELECT DP_ID FROM Departments WHERE DP_ID = @DP_ID)
  BEGIN
    SELECT DISTINCT a.DP_Name, b.ST_Name, c.Grade, d.CR_Name, d.CR_Grade, e.EX_ID, c.ST_ID
    FROM Departments a, Students b, IN_ST_CR c, Courses d, CR_EX_QS e
    WHERE a.DP_ID = b.DP_ID AND b.ST_ID = c.ST_ID AND c.CR_ID = d.CR_ID
    AND d.CR_ID = e.CR_ID AND a.DP_ID = @DP_ID AND c.Grade < (d.CR_Grade / 2)
  END
  ELSE
    PRINT ('Department #' + @DP_ID + ' doesn''t exist')
END

GO -- END Check Corrective

-- START Correct Exam

CREATE PROC [Correct_Student_Exam] @ST_ID int, @EX_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID, EX_ID FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID)
  BEGIN
    UPDATE ST_EX_Answers SET Finished = 2 WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID
    DECLARE c CURSOR FOR
    SELECT QS_ID, Answer FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID FOR READ ONLY
    DECLARE @QS_ID int, @Answer varchar(max), @Total int = 0, @Grade int = 0
    OPEN c
    FETCH c INTO @QS_ID, @Answer
    WHILE @@FETCH_STATUS = 0
    BEGIN
	  SET @Total += (SELECT QS_Grade FROM Questions WHERE QS_ID = @QS_ID)
	  IF @Answer = (SELECT QS_Correct FROM Questions WHERE QS_ID = @QS_ID)
		SET @Grade += (SELECT QS_Grade FROM Questions WHERE QS_ID = @QS_ID)
      FETCH c INTO @QS_ID, @Answer
    END
    CLOSE c
    DEALLOCATE c
	DECLARE @CR_ID int, @MaxGrade int
	SELECT @CR_ID = C.CR_ID, @MaxGrade = C.CR_Grade FROM CR_EX_QS,Courses C WHERE EX_ID = @EX_ID AND QS_ID = @QS_ID AND CR_EX_QS.CR_ID = C.CR_ID
	UPDATE IN_ST_CR SET Grade = (@Grade * @MaxGrade / @Total)  WHERE ST_ID = @ST_ID AND CR_ID = @CR_ID
  END
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Exam #' + CAST(@EX_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END Correct Exam

-- START Convert any Datetime Format

CREATE PROC Convert_Date @str varchar(50),@RET_VAL int OUTPUT
AS
BEGIN
  BEGIN TRY
    DECLARE @date date
    BEGIN TRY
      SET @date = CONVERT(date, @str, 0)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 100)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 101)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 102)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 103)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 104)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 105)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 106)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 107)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 108)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 109)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 110)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 111)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 112)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 113)
    END TRY BEGIN CATCH END CATCH
    BEGIN TRY
      SET @date = CONVERT(date, @str, 114)
    END TRY BEGIN CATCH END CATCH
    SET @RET_VAL = CAST(format(@date, 'yyyyMMdd') AS int)
    RETURN @RET_VAL
  END TRY
  BEGIN CATCH
    PRINT ('Can''t convert time')
  END CATCH
END

GO -- END Convert any Datetime Format