using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class ExamsLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectAllInstructors()
    {
        string str = "select * from Exams";
        ds = DAL.RunSelect(str);
        return ds;
    }
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