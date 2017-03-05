using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    private static string user = "Essawy";

    public static DataSet RunSelect(string SelectQuery)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[user].ToString());
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandType = CommandType.Text;
        com.CommandText = SelectQuery;
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        return ds;
    }

    public static DataSet RunSelect(string SelectQuery, SqlParameter[] para)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[user].ToString());
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = SelectQuery;
        com.Parameters.AddRange(para);
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        return ds;
    }

    public static int RunDML(string DMLQuery, SqlParameter[] param)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[user].ToString());
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = DMLQuery;
        com.Parameters.AddRange(param);
        con.Open();
        int affected = com.ExecuteNonQuery();
        con.Close();
        return affected;
    }

    public static int Count(string Table)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[user].ToString());
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandType = CommandType.Text;
        com.CommandText = "SELECT COUNT(*) FROM " + Table;
        con.Open();
        int affected = int.Parse(com.ExecuteScalar().ToString());
        con.Close();
        return affected;
    }
}