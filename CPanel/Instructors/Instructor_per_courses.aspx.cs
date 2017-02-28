using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Instructors_Instructor_per_courses : System.Web.UI.Page
{
    ObjectDataSource ObjDS;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Instructors_GV.Visible = false;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Instructors_GV.Visible = true;
        int cr_id = int.Parse(Course_DropList.SelectedValue.ToString());
        ObjDS = new ObjectDataSource();
        ObjDS.TypeName = "InstructorsLayer";
        ObjDS.SelectMethod = "SelectInstructor_Courses";
        ObjDS.SelectParameters.Add("cr_id",cr_id.ToString());
        ObjDS.Select();
        Instructors_GV.DataSource = ObjDS;
        Instructors_GV.DataBind();
        Session.Add("obj", ObjDS);
    }
}