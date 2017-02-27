using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void login_button_Click(object sender, EventArgs e)
    {
        HttpCookie userinfo = Request.Cookies["UserInfo"];
        if (userinfo != null && user.Text == userinfo.Values["user"] && pass.Text == userinfo.Values["pass"])
        {
            Response.Redirect("/CPanel/index.aspx");
        }
        else
        {
            user.Text = pass.Text = "";
        }
    }
}