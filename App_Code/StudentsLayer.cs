using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentsLayer
/// </summary>
public class StudentsLayer
{
    private static DataSet ds = new DataSet();

    public static DataSet SelectAllStudents()
    {
        string str = "SELECT * FROM Students";
        ds = DAL.RunSelect(str);
        return ds;
    }
}