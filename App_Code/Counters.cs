using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Counters
/// </summary>
public class Counters
{
    public static int Instructors()
    {
        return DAL.Count("Instructors");
    }

    public static int Students()
    {
        return DAL.Count("Students");
    }

    public static int Departments()
    {
        return DAL.Count("Departments");
    }

    public static int Courses()
    {
        return DAL.Count("Courses");
    }

    public static int Exams()
    {
        return DAL.Count("Exams");
    }

    public static int Questions()
    {
        return DAL.Count("Questions");
    }

    public static int Topics()
    {
        return DAL.Count("Exams");
    }
}