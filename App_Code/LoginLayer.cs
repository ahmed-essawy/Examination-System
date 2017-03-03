using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Summary description for LoginLayer
/// </summary>
public class LoginLayer
{
    private static DataSet ds;

    public static DataSet SelectAllUsers()
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[Login_Data]");
        return ds;
    }

    public static DataSet SelectAllMembers()
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[AllMembers]");
        return ds;
    }

    public static DataRow SelectUser(String Username)
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[Login_Data] WHERE Username = '" + Username + "'");
        return ds.Tables[0].Rows[0];
    }

    public static DataRow SelectMembers(String Role, String ID)
    {
        string str = "";
        switch (Role)
        {
            case "administrator":
                str = "SELECT * FROM [dbo].[Administrators] WHERE AD_ID = " + ID;
                break;

            case "instructor":
                str = "SELECT * FROM [dbo].[Instructors] WHERE IN_ID = " + ID;
                break;

            case "student":
                str = "SELECT * FROM [dbo].[Students] WHERE ST_ID = " + ID;
                break;
        }
        ds = DAL.RunSelect(str);
        return ds.Tables[0].Rows[0];
    }

    public static int UpdateUser(string Username, string Password, string Email, string Role, int Role_ID)
    {
        string str = "[Update_Login_Data]";
        SqlParameter param1 = new SqlParameter("@Username", Username);
        SqlParameter param2 = new SqlParameter("@Password", Password);
        SqlParameter param3 = new SqlParameter("@Email", Email);
        SqlParameter param4 = new SqlParameter("@Role", Role);
        SqlParameter param5 = new SqlParameter("@Role_ID", Role_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3, param4, param5 });
        return affected;
    }

    public static int UpdateMember(string Role, int Role_ID, string F_Name, string L_Name, string Birthdate, string Phone, string Street, string City, string Country)
    {
        string str = "[Update_Profile]";
        SqlParameter param1 = new SqlParameter("@Role", Role);
        SqlParameter param2 = new SqlParameter("@Role_ID", Role_ID);
        SqlParameter param3 = new SqlParameter("@F_Name", F_Name);
        SqlParameter param4 = new SqlParameter("@L_Name", L_Name);
        SqlParameter param5 = new SqlParameter("@Birthdate", Birthdate);
        SqlParameter param6 = new SqlParameter("@Phone", Phone);
        SqlParameter param7 = new SqlParameter("@Street", Street);
        SqlParameter param8 = new SqlParameter("@City", City);
        SqlParameter param9 = new SqlParameter("@Country", Country);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3, param4, param5, param6, param7, param8, param9 });
        return affected;
    }

    public static int DeleteUser(string Username)
    {
        string str = "[Delete_Login_Data]";
        SqlParameter param = new SqlParameter("@Username", Username);
        int affected = DAL.RunDML(str, new SqlParameter[] { param });
        return affected;
    }

    public static DataSet Check_Login(string Username, string Password)
    {
        ds = DAL.RunSelect("SELECT [Role], [Role_ID] FROM [dbo].[Login_Data] WHERE Username = '" + Username + "' AND Password = '" + Password + "'");
        return ds;
    }

    public static DataRow Get_Admin(int ID)
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[Administrators] WHERE AD_ID = " + ID);
        return ds.Tables[0].Rows[0];
    }

    public static DataRow Get_Instructor(int ID)
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[Instructors] WHERE IN_ID = " + ID);
        return ds.Tables[0].Rows[0];
    }

    public static DataRow Get_Student(int ID)
    {
        ds = DAL.RunSelect("SELECT * FROM [dbo].[Students] WHERE ST_ID = " + ID);
        return ds.Tables[0].Rows[0];
    }

    public static int AddUser(string Username, string Password, string Email)
    {
        string str = "[Insert_Login_Data]";
        SqlParameter param1 = new SqlParameter("@Username", Username);
        SqlParameter param2 = new SqlParameter("@Password", Password);
        SqlParameter param3 = new SqlParameter("@Email", Email);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }
}