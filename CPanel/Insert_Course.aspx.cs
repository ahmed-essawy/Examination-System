using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Insert_Course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string N = cr_name.Text;
        int G = int.Parse(cr_grade.Text);
        CoursesLayer.InsertCourse(N,G);

    }
}