using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    public static DataSet RunSelect(string SelectQuery)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand com = new SqlCommand();
        DataSet ds = new DataSet();
        com.CommandText = SelectQuery;
        com.Connection = con;
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        return ds;
    }

    public static int RunDML(string DMLQuery, SqlParameter[] param)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
        SqlCommand com = new SqlCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = DMLQuery;
        com.Parameters.AddRange(param);
        com.Connection = con;
        con.Open();
        int affected = com.ExecuteNonQuery();
        con.Close();
        return affected;
    }
}