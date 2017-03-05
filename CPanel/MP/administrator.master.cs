using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] section = {
            "ASP.cpanel_students_answers_aspx",
            "ASP.cpanel_students_anwersvscorrect_aspx",
            "ASP.cpanel_students_correctivebycourse_aspx",
            "ASP.cpanel_students_correctivebydepartment_aspx",
            "ASP.cpanel_students_courses_aspx",
            "ASP.cpanel_students_exams_aspx",
            "ASP.cpanel_students_results_aspx",
            "ASP.cpanel_students_specific_student_aspx",
            "ASP.cpanel_courses_questions_aspx",
            "ASP.cpanel_questions_exams_assign_exam_aspx",
            "ASP.cpanel_questions_exams_by_date_aspx",
            "ASP.cpanel_questions_exams_solve_aspx",
            "ASP.cpanel_questions_exams_student_aspx"
        };
        if (section.Contains(BindingContainer.ToString()))
            Response.Redirect("/CPanel/permission.aspx");
    }
}