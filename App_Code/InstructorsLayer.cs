using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class InstructorsLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectAllInstructors()
    {
        string str = "select * from instructors ins";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public int UpdateInstructor()
    {
        int row_affected = 0;
        //string nonQuery = "Update_instructor";
        //SqlParameter[] p1 = new SqlParameter[] {
        // new SqlParameter("@", crs_id),
        // new SqlParameter("@crs_name", crs_name),
        // new SqlParameter("@crs_dur", crs_duration),
        // new SqlParameter("@top_id", Top_id)};
        //if (Top_id == 0)
        //{
        //    p1[3].Value = DBNull.Value;
        //}

        //row_affected = DataAccessLayer.RunINUPDELSP(nonQuery, p1);
        return row_affected;
    }
}