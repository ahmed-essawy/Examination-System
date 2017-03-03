using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Users_Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string username = user.Text;
        string password = pass.Text;
        string email = mail.Text;
        string role = role_.SelectedValue;
        int role_id = int.Parse(role_id_.SelectedValue);
        int affect = LoginLayer.AddUser(username, password, email);
        LoginLayer.UpdateUser(username, password, email, role, role_id);
        if (affect > 0)
        {
            affected.Text = "User added successfully";
            user.Text = String.Empty;
            pass.Text = String.Empty;
            mail.Text = String.Empty;
            role_.SelectedIndex = 0;
            role_id_.SelectedIndex = 0;
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
        {
            switch (Request.Cookies["UserInfo"]["Role"])
            {
                case "administrator":
                    this.MasterPageFile = "~/CPanel/administrator.master";
                    break;

                case "instructor":
                    this.MasterPageFile = "~/CPanel/instructor.master";
                    break;

                case "student":
                    this.MasterPageFile = "~/CPanel/student.master";
                    break;

                default:
                    this.MasterPageFile = "~/CPanel/anonymous.master";
                    break;
            }
        }
        else
        {
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
        }
    }
}