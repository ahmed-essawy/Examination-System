using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ExamsLayer
/// </summary>
public class ExamsLayer
{
    public static int InsertExam(string CR_Name, int MCQ_Num, int TF_Num)
    {
        int row_affected;
        string nonQuery = "[Insert_Exam]";
        SqlParameter[] parameters = new SqlParameter[] {
          new SqlParameter("@CR_Name",CR_Name ),
          new SqlParameter("@MCQ_Num",MCQ_Num ),
          new SqlParameter("@TF_Num",TF_Num ),
        };
        row_affected = DAL.RunDML(nonQuery, parameters);
        return row_affected;
    }
}