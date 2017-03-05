using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] section = {
            "ASP.cpanel_index_aspx",
            "ASP.cpanel_profile_aspx",
            "ASP.cpanel_permission_aspx",
            "ASP.cpanel_courses_instructors_aspx",
            "ASP.cpanel_courses_topics_aspx",
            "ASP.cpanel_questions_exams_student_aspx",
            "ASP.cpanel_questions_exams_solve_aspx",
        };
        if (!section.Contains(BindingContainer.ToString()))
            Response.Redirect("/CPanel/permission.aspx");
    }
}