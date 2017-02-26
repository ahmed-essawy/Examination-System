using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChoicesLayer
/// </summary>
public class ChoicesLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectChoices(int QS_ID)
    {
        string str = "SELECT [Choice] FROM QS_Choices WHERE QS_ID = " + QS_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }

    public static DataSet UpdateChoices(int QS_ID)
    {
        string str = "SELECT [Choice] FROM QS_Choices WHERE QS_ID = " + QS_ID;
        ds = DAL.RunSelect(str);
        return ds;
    }
}