using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Insert_Update_Delete_Topics_per_Course : System.Web.UI.Page
{
    ObjectDataSource ObjDS;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            tp_names.Visible = false;
        }

    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        tp_names.Visible = true;/*
        int cr_id = int.Parse(cr_name.SelectedValue.ToString());
        ObjDS = new ObjectDataSource();
        ObjDS.TypeName = "TopicsLayer";
        ObjDS.SelectMethod = "SelectTopics_Course";
        ObjDS.SelectParameters.Add("cr_id", cr_id.ToString());
        ObjDS.Select();
        tp_names.DataSource = ObjDS;
        tp_names.DataBind();
        Session.Add("obj", ObjDS);*/
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}