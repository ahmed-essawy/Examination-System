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
    public int InsertInstructor(int IN_ID, string IN_Fname, string IN_Lname, string IN_Bdate, string IN_Phone, double IN_Salary, string IN_Street, string IN_City, string IN_Country, int DP_ID)
    {

        int row_affected;
        string nonQuery = "Insert_Instructor";
        SqlParameter[] p1 = new SqlParameter[] {
          new SqlParameter("@IN_ID",IN_ID ),
         new SqlParameter("@IN_Fname", IN_Fname),
         new SqlParameter("@IN_Lname", IN_Lname),
         new SqlParameter("@IN_Bdate ", IN_Bdate),
         new SqlParameter("@IN_Phone",IN_Phone),
         new SqlParameter("@IN_Salary", IN_Salary),
         new SqlParameter("@IN_Street", IN_Street),
         new SqlParameter("@IN_City", IN_City),
         new SqlParameter("@IN_Country", IN_Country),
         new SqlParameter("@DP_ID", DP_ID)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }

    public int UpdateInstructor(int IN_ID ,string IN_Fname , string IN_Lname , string IN_Bdate , string IN_Phone , double IN_Salary , string IN_Street , string IN_City , string IN_Country, int DP_ID)
    {
        int row_affected = 0;
        string nonQuery = "Update_instructor";
        SqlParameter[] p1 = new SqlParameter[] {
         new SqlParameter("@IN_ID",IN_ID ),
         new SqlParameter("@IN_Fname", IN_Fname),
         new SqlParameter("@IN_Lname", IN_Lname),
         new SqlParameter("@IN_Bdate ", IN_Bdate),
         new SqlParameter("@IN_Phone",IN_Phone),
         new SqlParameter("@IN_Salary", IN_Salary),
         new SqlParameter("@IN_Street", IN_Street),
         new SqlParameter("@IN_City", IN_City),
         new SqlParameter("@IN_Country", IN_Country),
         new SqlParameter("@DP_ID", DP_ID)};
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }
    public int DeleteInstructor(int IN_ID)
    {
        int row_affected;
        string nonQuery = "Delete_Instructor";
        SqlParameter[] p1 = new SqlParameter[] { new SqlParameter("@IN_ID", IN_ID) };
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }
}