using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Send_Click(object sender, EventArgs e)
    {
        String password = LoginLayer.Forget_Login(user.Text, mail.Text);
        if (password != String.Empty)
        {
            pass.Text = password;
            passV.Text = "Your new password";
            pass.Visible = true;
            userV.Visible = false;
            mailV.Visible = false;
            user.Visible = false;
            mail.Visible = false;
            Send.Visible = false;
        }
        else
        {
            user.Text = string.Empty;
            mail.Text = string.Empty;
            passV.Text = "Wrong info";
        }
    }
}