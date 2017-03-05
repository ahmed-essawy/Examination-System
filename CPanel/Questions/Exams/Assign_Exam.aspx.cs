using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Questions_Exams_Assign_Exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.Items.Count > 0 && DropDownList2.Items.Count > 0)
        {
            int ST_ID = int.Parse(DropDownList1.SelectedValue);
            int EX_ID = int.Parse(DropDownList2.SelectedValue);
            int affected = ExamsLayer.Assign_Exam(ST_ID, EX_ID);
            if (affected <= 0)
                msg.Text = "Assign Failed";
            else
                msg.Text = "Exam was Assigned Successfully";
        }
        else
            msg.Text = "Student Doesn't have any Exam To be Generated";
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}