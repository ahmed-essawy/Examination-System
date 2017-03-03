using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Generate_Exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Generate_Click(object sender, EventArgs e)
    {
        string CR_Name = CR_ID.Text;
        int MCQ_Number = int.Parse(MCQ_Num.SelectedValue);
        int TF_Number = 10 - MCQ_Number;
        int affected = ExamsLayer.InsertExam(CR_Name, MCQ_Number, TF_Number);
        if (affected > 0)
            Affected_Rows.Text = "Exam generated";
        else
            Affected_Rows.Text = "Failed to generate exam";
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}