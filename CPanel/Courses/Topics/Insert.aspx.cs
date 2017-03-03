using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Courses_Topics_InsertNewTopics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != string.Empty && DropDownList1.SelectedItem != null)
        {
            int CR_ID = int.Parse(DropDownList1.SelectedValue);
            string Topic_Name = TextBox1.Text;
           int affected= TopicsLayer.InsertTopic(Topic_Name, CR_ID);
            if (affected <= 0) { msg.Text = "Insert Failed"; }
            else
            {
                msg.Text = "Topic Has Been Successfully Inserted";
                TextBox1.Text = string.Empty;
                DropDownList1.SelectedIndex = 0;
            }
        }
        else { msg.Text = "All Fields Are Required"; }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}