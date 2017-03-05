using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class instructor : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] section = {
            "ASP.cpanel_index_aspx",
            "ASP.cpanel_profile_aspx",
            "ASP.cpanel_permission_aspx",
            "ASP.cpanel_students_specific_student_aspx",
            "ASP.cpanel_students_courses_aspx",
            "ASP.cpanel_students_anwersvscorrect_aspx",
            "ASP.cpanel_students_results_aspx",
            "ASP.cpanel_students_correctivebydepartment_aspx",
            "ASP.cpanel_students_correctivebycourse_aspx",
            "ASP.cpanel_students_exams_aspx",
            "ASP.cpanel_courses_questions_aspx",
            "ASP.cpanel_questions_exams_by_date_aspx",
            "ASP.cpanel_questions_exams_assign_exam_aspx",
            "ASP.cpanel_reports_department_students_aspx",
            "ASP.cpanel_reports_exam_questions_aspx",
            "ASP.cpanel_reports_instructor_courses_aspx",
            "ASP.cpanel_reports_student_answers_aspx",
            "ASP.cpanel_reports_student_grades_aspx",
            "ASP.cpanel_reports_topics_per_course_aspx"
        };
        if (!section.Contains(BindingContainer.ToString()))
            Response.Redirect("/CPanel/permission.aspx");
    }
}