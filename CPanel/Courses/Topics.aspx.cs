using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DisplayTopicsPerCourse : System.Web.UI.Page
{
    ObjectDataSource ObjDS;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            TP_Names.Visible = false;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      

    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TP_Names.Visible = true;
        int cr_id = int.Parse(CR_Names.SelectedValue.ToString());
        ObjDS = new ObjectDataSource();
        ObjDS.TypeName = "TopicsLayer";
        ObjDS.SelectMethod = "SelectTopics_Course";
        ObjDS.SelectParameters.Add("cr_id", cr_id.ToString());
        ObjDS.Select();
        TP_Names.DataSource = ObjDS;
        TP_Names.DataBind();
        Session.Add("obj", ObjDS);
    }
}