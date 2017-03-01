using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Topics
/// </summary>
public class TopicsLayer
{
    private static DataSet ds = new DataSet();
    public static DataSet SelectTopics()
    {
        string str = "SELECT TP_ID,TP_Name,t.CR_ID,CR_Name FROM Topics t,Courses c where c.CR_ID=t.CR_ID";
        ds = DAL.RunSelect(str);
        return ds;
    }
    public int InsertTopic(string TP_Name, int CR_ID)
    {
        string str = "[Insert_Topic]";
        SqlParameter param1 = new SqlParameter("@TP_Name", TP_Name);
        SqlParameter param2 = new SqlParameter("@CR_ID", CR_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2 });
        return affected;
    }

    public int UpdateTopic(int TP_ID, string TP_Name, string CR_Name, int CR_ID)
    {
        string str = "[Update_Topic]";
        SqlParameter param1 = new SqlParameter("@TP_ID", TP_ID);
        SqlParameter param2 = new SqlParameter("@TP_Name", TP_Name);
        SqlParameter param3 = new SqlParameter("@CR_ID", CR_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1, param2, param3 });
        return affected;
    }

    public int DeleteTopic(int TP_ID,int CR_ID)
    {
        string str = "Delete_Topic";
        SqlParameter param2 = new SqlParameter("@TP_ID ", TP_ID);
        SqlParameter param1 = new SqlParameter("@CR_ID ", CR_ID);
        int affected = DAL.RunDML(str, new SqlParameter[] { param1,param2 });
        return affected;
    }
    public static DataSet SelectTopics_Course(int CR_ID)
    {
        string str = "select TP_ID,TP_Name, c.CR_ID, CR_Name from Topics t, Courses c where t.CR_ID=c.CR_ID and c.CR_ID=" + CR_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }
}