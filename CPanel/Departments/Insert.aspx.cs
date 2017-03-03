using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Departments_Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        if (txt_DP_Name.Text != string.Empty && Drp_DP_manager.SelectedItem != null)
        {
            string Dep_Name = txt_DP_Name.Text;
            int manager = int.Parse(Drp_DP_manager.SelectedValue);

            int affected = DepartmentsLayer.InsertDepartment(Dep_Name, manager);
            if (affected <= 0) { msg.Text = "Insert Failed"; } else { msg.Text = "Department was Inserted Successfully"; }
        }
        else
        {
            msg.Text = "ALL Fields Are Required";
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}