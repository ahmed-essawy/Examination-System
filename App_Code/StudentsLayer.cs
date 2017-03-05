using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Summary description for StudentsLayer
/// </summary>
public class StudentsLayer
{
    public static DataSet ds = new DataSet();

    public static DataSet SelectAllStudents()
    {
        string str = "SELECT a.ST_ID,a.ST_Fname,a.ST_Lname,a.ST_Name,a.ST_Age,a.ST_Bdate,a.ST_Phone,a.ST_Salary,a.ST_Street,a.ST_City,a.ST_Country,a.ST_JoinDate,a.DP_ID,b.DP_Name FROM Students a,Departments b where a.DP_ID=b.DP_ID";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet SelectStudentById(int ST_ID)
    {
        string str = "select a.*,b.DP_Name from Students a,Departments b where a.DP_ID=b.DP_ID and a.ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet SelectDP()
    {
        string str = "select DP_ID,DP_Name from Departments";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayStudentName(int ST_ID)
    {
        string str = "SELECT ST_Name from Students where ST_id=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayStudentCourses(int ST_ID)
    {
        string str = "select a.CR_Name from Courses a,IN_ST_CR c where  a.CR_ID=c.CR_ID and c.ST_ID= " + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataRow StudentCourseGrade(int ST_ID, int EX_ID)
    {
        string str = "SELECT DISTINCT Grade, CR_Grade FROM IN_ST_CR, CR_EX_QS, Courses C WHERE IN_ST_CR.CR_ID = C.CR_ID AND CR_EX_QS.CR_ID = C.CR_ID AND IN_ST_CR.ST_ID = " + ST_ID + " AND CR_EX_QS.EX_ID = " + EX_ID;
        return DAL.RunSelect(str).Tables[0].Rows[0];
    }

    public static DataSet Display_EX_ST_ANS_CorrAns(int ST_ID)
    {
        string str = "select a.EX_ID,a.Answer,b.QS_Correct,c.ST_Name   from ST_EX_Answers a,Questions b,Students c   where a.QS_ID=b.QS_ID and a.ST_ID=c.ST_ID and c.ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayResults(int ST_ID)
    {
        string str = "select a.ST_Name,b.CR_Name,b.CR_Grade,c.Grade   from Students a,Courses b,IN_ST_CR c where  a.ST_ID=C.ST_ID and b.CR_ID=C.CR_ID and c.ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayStudentExams(int ST_ID)
    {
        string str = "select distinct a.ST_Name,b.EX_ID,c.EX_Date from Students a,ST_EX_Answers b,Exams c where a.ST_ID=b.ST_ID and b.EX_ID=c.EX_ID and b.ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayExamByDate(string Date)
    {
        string str = "select a.ST_Name,convert(varchar(10),b.[Date]) [Date],b.ST_ID,b.EX_ID   from Students a,ST_EX_Answers b where a.ST_ID=b.ST_ID and b.[Date]='" + Date + "'";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayAllExamsDates()
    {
        string str = "select convert(varchar(10),Date) AS [Date] from ST_EX_Answers";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplayCorrectiveByCR_ID(int CR_ID)
    {
        SqlParameter par1 = new SqlParameter("@CR_ID", CR_ID);
        ds = DAL.RunSelect("Check_Corrective", new SqlParameter[] { par1 });
        return ds;
    }

    public static DataSet DisplayCR_IDs()
    {
        string str = "select CR_ID,CR_Name from Courses";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet DisplaycorrectiveByDept(int DP_ID)
    {
        SqlParameter par1 = new SqlParameter("@DP_ID", DP_ID);
        ds = DAL.RunSelect("Check_Corrective_By_Dep", new SqlParameter[] { par1 });
        return ds;
    }

    public static DataSet DisplayStudentAnswers(int ST_ID)
    {
        string str = "select a.Answer,b.ST_ID,b.ST_Name,a.QS_ID from ST_EX_Answers a,Students b  where  a.ST_ID=b.ST_ID and b.ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet GetExID_BY_STID(int ST_ID)
    {
        string str = "select distinct(EX_ID)  from ST_EX_Answers  where ST_ID=" + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static int InsertStudent(int ST_ID, string ST_Fname, string ST_Lname, string ST_Bdate, string ST_Phone, decimal ST_Salary, string ST_Street, string ST_City, string ST_Country, int DP_ID)
    {
        SqlParameter par1 = new SqlParameter("@ST_ID", ST_ID);
        SqlParameter par2 = new SqlParameter("@ST_Fname", ST_Fname);
        SqlParameter par3 = new SqlParameter("@ST_Lname", ST_Lname);
        SqlParameter par4 = new SqlParameter("@ST_Bdate", ST_Bdate);
        SqlParameter par5 = new SqlParameter("@ST_Phone", ST_Phone);
        SqlParameter par6 = new SqlParameter("@ST_Salary", ST_Salary);
        SqlParameter par7 = new SqlParameter("@ST_Street", ST_Street);
        SqlParameter par8 = new SqlParameter("@ST_City", ST_City);
        SqlParameter par9 = new SqlParameter("@ST_Country", ST_Country);
        SqlParameter par10 = new SqlParameter("@DP_ID", DP_ID);

        int affected = DAL.RunDML("Insert_Student", new SqlParameter[] { par1, par2, par3, par4, par5, par6, par7, par8, par9, par10 });
        return affected;
    }

    public static int DeleteStudent(int ST_ID)
    {
        SqlParameter par1 = new SqlParameter("@ST_ID", ST_ID);
        int affected = DAL.RunDML("Delete_Student", new SqlParameter[] { par1 });
        return affected;
    }

    public static int UpdateStudent(int ST_ID, string ST_Fname, string ST_Lname, string ST_Bdate, string ST_Phone, decimal ST_Salary, string ST_Street, string ST_City, string ST_Country, int DP_ID)
    {
        SqlParameter par1 = new SqlParameter("@ST_ID", ST_ID);
        SqlParameter par2 = new SqlParameter("@ST_Fname", ST_Fname);
        SqlParameter par3 = new SqlParameter("@ST_Lname", ST_Lname);
        SqlParameter par4 = new SqlParameter("@ST_Bdate", ST_Bdate);
        SqlParameter par5 = new SqlParameter("@ST_Phone", ST_Phone);
        SqlParameter par6 = new SqlParameter("@ST_Salary", ST_Salary);
        SqlParameter par7 = new SqlParameter("@ST_Street", ST_Street);
        SqlParameter par8 = new SqlParameter("@ST_City", ST_City);
        SqlParameter par9 = new SqlParameter("@ST_Country", ST_Country);
        SqlParameter par10 = new SqlParameter("@DP_ID", DP_ID);

        int affected = DAL.RunDML("Update_Student", new SqlParameter[] { par1, par2, par3, par4, par5, par6, par7, par8, par9, par10 });
        return affected;
    }
}