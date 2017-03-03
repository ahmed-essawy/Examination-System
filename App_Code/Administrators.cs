using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class AdministratorsLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectAllAdministrators()
    {
        string str = "select * from Administrators";
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static int InsertAdministrator(int AD_ID, string AD_Fname, string AD_Lname, string AD_Bdate, string AD_Phone, decimal AD_Salary, string AD_Street, string AD_City, string AD_Country)
    {
        int row_affected;
        string nonQuery = "Insert_Administrator";
        SqlParameter[] p1 = new SqlParameter[] {
          new SqlParameter("@AD_ID",AD_ID ),
         new SqlParameter("@AD_Fname", AD_Fname),
         new SqlParameter("@AD_Lname", AD_Lname),
         new SqlParameter("@AD_Bdate ", AD_Bdate),
         new SqlParameter("@AD_Phone",AD_Phone),
         new SqlParameter("@AD_Salary", AD_Salary),
         new SqlParameter("@AD_Street", AD_Street),
         new SqlParameter("@AD_City", AD_City),
         new SqlParameter("@AD_Country", AD_Country)
        };
        if (AD_Phone == null)
        {
            p1[4].Value = DBNull.Value;
        }
        if (AD_Salary == 0)
        {
            p1[5].Value = DBNull.Value;
        }
        if (AD_Street == null)
        {
            p1[6].Value = DBNull.Value;
        }
        if (AD_City == null)
        {
            p1[7].Value = DBNull.Value;
        }
        if (AD_Country == null)
        {
            p1[8].Value = DBNull.Value;
        }
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }

    public static int UpdateAdministrator(int AD_ID, string AD_Fname, string AD_Lname, string AD_Bdate, string AD_Phone, double AD_Salary, string AD_Street, string AD_City, string AD_Country)
    {
        int row_affected = 0;
        string nonQuery = "Update_Administrator";
        SqlParameter[] p1 = new SqlParameter[] {
         new SqlParameter("@AD_ID",AD_ID ),
         new SqlParameter("@AD_Fname", AD_Fname),
         new SqlParameter("@AD_Lname", AD_Lname),
         new SqlParameter("@AD_Bdate ", AD_Bdate),
         new SqlParameter("@AD_Phone",AD_Phone),
         new SqlParameter("@AD_Salary", AD_Salary),
         new SqlParameter("@AD_Street", AD_Street),
         new SqlParameter("@AD_City", AD_City),
         new SqlParameter("@AD_Country", AD_Country)
        };
        if (AD_Phone == null)
        {
            p1[4].Value = DBNull.Value;
        }
        if (AD_Salary == 0)
        {
            p1[5].Value = DBNull.Value;
        }
        if (AD_Street == null)
        {
            p1[6].Value = DBNull.Value;
        }
        if (AD_City == null)
        {
            p1[7].Value = DBNull.Value;
        }

        if (AD_Country == null)
        {
            p1[8].Value = DBNull.Value;
        }
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }

    public static int DeleteAdministrator(int AD_ID)
    {
        int row_affected;
        string nonQuery = "Delete_Administrator";
        SqlParameter[] p1 = new SqlParameter[] { new SqlParameter("@AD_ID", AD_ID) };
        row_affected = DAL.RunDML(nonQuery, p1);
        return row_affected;
    }
}