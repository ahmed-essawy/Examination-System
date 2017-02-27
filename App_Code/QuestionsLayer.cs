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
        string str = "SELECT [QS_ID], [CR_Name], [QS_Value], [QS_Type], [QS_Correct], [QS_Grade] FROM [dbo].[Questions], [dbo].[Courses] WHERE [dbo].[Questions].CR_ID = [dbo].[Courses].[CR_ID]";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static int InsertQuestionMCQ(string CR_Name, string Question, string Choice1, string Choice2, string Choice3, string Choice4, string Correct_Answer)
    {
        string str = "[Insert_Question_MCQ]";
        SqlParameter param1 = new SqlParameter("@CR_Name", CR_Name);
        SqlParameter param2 = new SqlParameter("@Question", Question);
        SqlParameter param3 = new SqlParameter("@Choice1", Choice1);
        SqlParameter param4 = new SqlParameter("@Choice2", Choice2);
        SqlParameter param5 = new SqlParameter("@Choice3", Choice3);
        SqlParameter param6 = new SqlParameter("@Choice4", Choice4);
        SqlParameter param7 = new SqlParameter("@Correct_Answer", Correct_Answer);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3, param4, param5, param6, param7 });
        return affected;
    }

    public static int InsertQuestionTF(string CR_Name, string Question, string Correct_Answer)
    {
        string str = "[Insert_Question_TF]";
        SqlParameter param1 = new SqlParameter("@CR_Name", CR_Name);
        SqlParameter param2 = new SqlParameter("@Question", Question);
        SqlParameter param3 = new SqlParameter("@Correct_Answer", Correct_Answer);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }

    public static int UpdateQuestion(int QS_ID, string QS_Value, int QS_Grade, string QS_Type, string QS_Correct, string CR_Name)
    {
        string str = "[Update_Question]";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        SqlParameter param2 = new SqlParameter("@QS_Value", QS_Value);
        SqlParameter param3 = new SqlParameter("@QS_Grade", QS_Grade);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }

    public static int DeleteQuestion(int QS_ID)
    {
        string str = "Delete_Question";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1 });
        return affected;
    }
}