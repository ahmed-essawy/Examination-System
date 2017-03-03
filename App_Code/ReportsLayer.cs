using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


public class ReportsLayer
{
    private static DataSet ds = new DataSet();
    public static DataSet GetInstructorCourses(int IN_ID)
    {
        string nonQuery = "Get_Instructor_Courses";
        SqlParameter[] p1 = new SqlParameter[] { new SqlParameter("@IN_ID", IN_ID) };
        ds= DAL.RunSelect(nonQuery, p1);
        return ds;
    }
}