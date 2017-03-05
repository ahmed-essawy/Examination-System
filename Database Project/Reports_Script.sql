USE SQLProject

GO
-- START REPORT 1

CREATE PROC [dbo].[Get_Students_By_Department] @DP_ID int
AS
BEGIN
  IF EXISTS (SELECT DP_ID FROM Departments WHERE DP_ID = @DP_ID)
    SELECT s.*,d.DP_Name FROM Students s,Departments d WHERE s.DP_ID=d.DP_ID and s.DP_ID = @DP_ID
  ELSE
    PRINT ('Department #' + CAST(@DP_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 1

-- START REPORT 2

CREATE PROC [dbo].[Get_Student_Grades] @ST_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID FROM Students WHERE ST_ID = @ST_ID)
    SELECT ST_Name, CR_Name, Grade FROM Students s, IN_ST_CR instcr, Courses c
    WHERE s.ST_ID = instcr.ST_ID AND c.CR_ID = instcr.CR_ID AND s.ST_ID = @ST_ID
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 2

-- START REPORT 3

CREATE PROC [dbo].[Get_Instructor_Courses] @IN_ID int
AS
BEGIN
  IF EXISTS (SELECT IN_ID FROM Instructors WHERE IN_ID = @IN_ID)
    SELECT INS.IN_Name, CO.CR_Name, COUNT(INSTCO.ST_ID) STUDENTS_NUMBER
    FROM Instructors INS, Courses CO, IN_ST_CR INSTCO
    WHERE INSTCO.CR_ID = CO.CR_ID AND INSTCO.IN_ID = INS.IN_ID AND INS.IN_ID = @IN_ID
    GROUP BY INS.IN_Name, CO.CR_Name
  ELSE
    PRINT ('Instructor #' + CAST(@IN_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 3

-- START REPORT 4

CREATE PROC [dbo].[Get_Course_Topics] @CR_ID int
AS
BEGIN
  IF EXISTS (SELECT CR_ID FROM Courses WHERE CR_ID = @CR_ID)
    SELECT CR.CR_Name, TP.TP_Name FROM Courses CR, Topics TP
	WHERE CR.CR_ID = TP.CR_ID AND CR.CR_ID = @CR_ID
  ELSE
    PRINT ('Course #' + CAST(@CR_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 4

-- START REPORT 5

CREATE PROC [dbo].[Get_Exam_Questions] @EX_ID int
AS
BEGIN
  IF EXISTS (SELECT EX_ID FROM Exams WHERE EX_ID = @EX_ID)
    SELECT CREXQS.EX_ID, QUES.QS_Value FROM CR_EX_QS CREXQS, Questions QUES
    WHERE QUES.QS_ID = CREXQS.QS_ID AND CREXQS.EX_ID = @EX_ID
  ELSE
    PRINT ('Exam #' + CAST(@EX_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 5

-- START REPORT 6

CREATE PROC [dbo].[Get_Student_Answers] @ST_ID int, @EX_ID int
AS
BEGIN
  IF EXISTS (SELECT ST_ID, EX_ID FROM Students, Exams WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID)
  BEGIN
    IF EXISTS (SELECT ST_ID FROM ST_EX_Answers WHERE ST_ID = @ST_ID AND EX_ID = @EX_ID)
      SELECT ST.ST_Name, QUES.QS_Value, STEXAN.Answer
      FROM Students ST, ST_EX_Answers STEXAN, Questions QUES
      WHERE STEXAN.ST_ID = ST.ST_ID AND STEXAN.QS_ID = QUES.QS_ID
      AND STEXAN.EX_ID = @EX_ID AND STEXAN.ST_ID = @ST_ID
    ELSE
      PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' with Exam #' + CAST(@EX_ID AS varchar(20)) + ' already exists')
  END
  ELSE
    PRINT ('Student #' + CAST(@ST_ID AS varchar(20)) + ' OR Exam #' + CAST(@EX_ID AS varchar(20)) + ' doesn''t exists')
END

GO -- END REPORT 6