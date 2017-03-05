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

    public static DataSet SelectEXAMID_ByStudentID(int ST_ID)
    {
        string str = "SELECT DISTINCT EX_ID, Date FROM IN_ST_CR isc, CR_EX_QS ces WHERE isc.CR_ID = ces.CR_ID AND ST_ID = " + ST_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static bool? Student_Finish_Exam(int ST_ID, int EX_ID)
    {
        bool? finished = null;
        string str = "SELECT COUNT(QS_ID) Total,SUM(Finished) Finished FROM ST_EX_Answers WHERE ST_ID = " + ST_ID + " AND EX_ID = " + EX_ID;
        DataRow DR = DAL.RunSelect(str).Tables[0].Rows[0];
        int total = int.Parse(DR["Total"].ToString());
        if (total > 0)
        {
            int Finished = int.Parse(DR["Finished"].ToString());
            if (total == Finished / 2)
                finished = true;
            else if (total > Finished / 2)
                finished = false;
        }
        return finished;
    }

    public static DataSet SelectQuestions(int EX_ID)
    {
        string str = "SELECT QS_ID FROM CR_EX_QS where EX_ID = " + EX_ID + "-- ORDER BY NEWID()";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static int UpdateChoice(int ST_ID, int EX_ID, int QS_ID, string Answer)
    {
        int row_affected;
        string nonQuery = "[Update_ST_EX_Answers]";
        SqlParameter[] parameters = new SqlParameter[] {
          new SqlParameter("@ST_ID",ST_ID ),
          new SqlParameter("@EX_ID",EX_ID ),
          new SqlParameter("@QS_ID",QS_ID ),
          new SqlParameter("@Answer",Answer ),
        };
        row_affected = DAL.RunDML(nonQuery, parameters);
        return row_affected;
    }

    public static int CorrectExam(int ST_ID, int EX_ID)
    {
        int row_affected;
        string nonQuery = "[Correct_Student_Exam]";
        SqlParameter[] parameters = new SqlParameter[] {
          new SqlParameter("@ST_ID",ST_ID ),
          new SqlParameter("@EX_ID",EX_ID )
        };
        row_affected = DAL.RunDML(nonQuery, parameters);
        return row_affected;
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

    public static int Assign_Exam(int ST_ID, int EX_ID)
    {
        int row_affected;
        string nonQuery = "Insert_Student_Exam";
        SqlParameter[] p1 = new SqlParameter[] {
          new SqlParameter("@ST_ID",ST_ID),
         new SqlParameter("@EX_ID", EX_ID)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }
}