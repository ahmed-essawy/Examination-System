using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for CoursesLayer
/// </summary>
public class CoursesLayer
{
    private static DataSet ds = new DataSet();
    public static DataSet SelectCourses()
    {
        string str = "SELECT CR_ID,CR_Name,CR_Grade FROM Courses";
        ds = DAL.RunSelect(str);
        return ds;
    }
    public int InsertCourse(string @CR_Name, int CR_Grade)
    {
        string str = "[Insert_Course]";
        SqlParameter param1 = new SqlParameter("@CR_Name", CR_Name);
        SqlParameter param2 = new SqlParameter("@CR_Grade", CR_Grade);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2 });
        return affected;
    }

    public int UpdateCourse(int CR_ID, string CR_Name, int CR_Grade)
    {
        string str = "[Update_Course]";
        SqlParameter param1 = new SqlParameter("@CR_ID", CR_ID);
        SqlParameter param2 = new SqlParameter("@CR_Name", CR_Name);
        SqlParameter param3 = new SqlParameter("@CR_Grade", CR_Grade);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }

    public int DeleteCourse(int CR_ID)
    {
        string str = "Delete_Course";
        SqlParameter param1 = new SqlParameter("@CR_ID ", CR_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1 });
        return affected;
    }
}
