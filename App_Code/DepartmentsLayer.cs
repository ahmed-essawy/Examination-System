using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class DepartmentsLayer
{
    private static DataSet ds = new DataSet();
    public static DataSet SelectAllDepartments()
    {
        string str = "Select * From Departments";
        ds = DAL.RunSelect(str);
        return ds;
    }
    public static DataSet SelectAllDepartments_MAngers()
    {
        string str = "select d.DP_ID,d.DP_Name,ins.IN_Name,ins.IN_ID from Departments d, Instructors ins where d.DP_Manager=ins.IN_ID";
        ds = DAL.RunSelect(str);
        return ds;
    }
    public static DataSet SelectAllManagers()
    {
        string str = "select IN_Name,IN_ID  from Instructors ";
        ds = DAL.RunSelect(str);
        return ds;
    }
    public static int InsertDepartment(string DP_Name , int DP_Manager)
    {
        int row_affected;
        string nonQuery = "Insert_Department";
        SqlParameter[] p1 = new SqlParameter[] {
          new SqlParameter("@DP_Name", DP_Name),
         new SqlParameter("@DP_Manager", DP_Manager)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }
    public int UpdateDepartment(int DP_ID,string DP_Name, int DP_Manager)
    {
        int row_affected;
        string nonQuery = "Update_Department";
        SqlParameter[] p1 = new SqlParameter[] {
            new SqlParameter("@DP_ID", DP_ID),
            new SqlParameter("@DP_Name", DP_Name),
            new SqlParameter("@DP_Manager", DP_Manager)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }

    public int DeleteDepartment(int DP_ID)
    {
        int row_affected;
        string nonQuery = "Delete_Department";
        SqlParameter[] p1 = new SqlParameter[] {
            new SqlParameter("@DP_ID", DP_ID)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }


}