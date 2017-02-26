using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentsLayer
/// </summary>
public class QuestionsLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectAllQuestions()
    {
        string str = "SELECT [QS_ID], [QS_Value], [QS_Type], [QS_Correct], [QS_Grade] FROM Questions";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet SelectAllCourses()
    {
        string str = "SELECT CR_Name FROM Courses";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public int InsertQuestion(string QS_ID, string QS_Value)
    {
        string str = "[Insert_Question_MCQ]";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        SqlParameter param2 = new SqlParameter("@QS_Value", QS_Value);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2 });
        return affected;
    }

    public int UpdateQuestion(int QS_ID, string QS_Value, int QS_Grade, string QS_Type, string QS_Correct)
    {
        string str = "[Update_Question]";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        SqlParameter param2 = new SqlParameter("@QS_Value", QS_Value);
        SqlParameter param3 = new SqlParameter("@QS_Grade", QS_Grade);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }

    public int DeleteQuestion(int QS_ID)
    {
        string str = "Delete_Question";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1 });
        return affected;
    }
}