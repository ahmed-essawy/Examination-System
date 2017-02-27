using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChoicesLayer
/// </summary>
public class ChoicesLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectChoices(int QS_ID)
    {
        string str = "SELECT [QS_ID], [Choice] FROM QS_Choices WHERE QS_ID = " + QS_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static string SelectQuestion(int QS_ID)
    {
        string str = "SELECT [QS_Value] FROM [dbo].[Questions], [dbo].[Courses] WHERE [dbo].[Questions].CR_ID = [dbo].[Courses].[CR_ID] AND [QS_ID] = " + QS_ID;
        ds = DAL.RunSelect(str);
        return ds.Tables[0].Rows[0]["QS_Value"].ToString();
    }

    public static string QuestionType(int QS_ID)
    {
        string str = "SELECT [QS_Type] FROM [dbo].[Questions], [dbo].[Courses] WHERE [dbo].[Questions].CR_ID = [dbo].[Courses].[CR_ID] AND [QS_ID] = " + QS_ID;
        ds = DAL.RunSelect(str);
        return ds.Tables[0].Rows[0]["QS_Type"].ToString();
    }

    public static int UpdateChoice(int QS_ID, string Choice)
    {
        string str = "[Update_Choice]";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        SqlParameter param2 = new SqlParameter("@Choice", Choice);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2 });
        return affected;
    }

    public static int UpdateChoices(int QS_ID, string Choice1, string Choice2, string Choice3, string Choice4)
    {
        string str = "[Update_Question_Choices]";
        int affected = 0;
        if (QuestionType(QS_ID) == "MCQ")
        {
            SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
            SqlParameter param2 = new SqlParameter("@Choice1", Choice1);
            SqlParameter param3 = new SqlParameter("@Choice2", Choice2);
            SqlParameter param4 = new SqlParameter("@Choice3", Choice3);
            SqlParameter param5 = new SqlParameter("@Choice4", Choice4);
            affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3, param4, param5 });
        }
        return affected;
    }

    public static int DeleteChoice(int QS_ID, string Choice)
    {
        string str = "[Delete_Choice]";
        SqlParameter param1 = new SqlParameter("@QS_ID", QS_ID);
        SqlParameter param2 = new SqlParameter("@Choice", Choice);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2 });
        return affected;
    }
}