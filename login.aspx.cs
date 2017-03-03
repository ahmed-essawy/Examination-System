using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void login_button_Click(object sender, EventArgs e)
    {
        DataSet login_ds = LoginLayer.Check_Login(user.Text, pass.Text);
        if (login_ds.Tables[0].Rows.Count > 0)
        {
            string role = login_ds.Tables[0].Rows[0]["Role"].ToString();
            int role_id = int.Parse(login_ds.Tables[0].Rows[0]["Role_ID"].ToString());
            Session.Add("Username", user.Text);
            Session.Add("Password", pass.Text);
            string username = user.Text;
            HttpCookie UserInfo = new HttpCookie("UserInfo");
            DataRow UserInfo_DR;
            switch (role)
            {
                case "administrator":
                    UserInfo_DR = LoginLayer.Get_Admin(role_id);
                    UserInfo.Values["ID"] = role_id.ToString();
                    UserInfo.Values["Username"] = username;
                    UserInfo.Values["Name"] = UserInfo_DR[1].ToString() + " " + UserInfo_DR[2].ToString();
                    UserInfo.Values["F_Name"] = UserInfo_DR[1].ToString();
                    UserInfo.Values["L_Name"] = UserInfo_DR[2].ToString();
                    UserInfo.Values["Role"] = "administrator";
                    break;

                case "instructor":
                    UserInfo_DR = LoginLayer.Get_Instructor(role_id);
                    UserInfo.Values["ID"] = role_id.ToString();
                    UserInfo.Values["Username"] = username;
                    UserInfo.Values["Name"] = UserInfo_DR[1].ToString() + " " + UserInfo_DR[2].ToString();
                    UserInfo.Values["F_Name"] = UserInfo_DR[1].ToString();
                    UserInfo.Values["L_Name"] = UserInfo_DR[2].ToString();
                    UserInfo.Values["Role"] = "instructor";
                    break;

                case "student":
                    UserInfo_DR = LoginLayer.Get_Student(role_id);
                    UserInfo.Values["ID"] = role_id.ToString();
                    UserInfo.Values["Username"] = username;
                    UserInfo.Values["Name"] = UserInfo_DR[1].ToString() + " " + UserInfo_DR[2].ToString();
                    UserInfo.Values["F_Name"] = UserInfo_DR[1].ToString();
                    UserInfo.Values["L_Name"] = UserInfo_DR[2].ToString();
                    UserInfo.Values["Role"] = "student";
                    break;

                default:
                    UserInfo.Values["ID"] = role_id.ToString();
                    UserInfo.Values["Username"] = username;
                    UserInfo.Values["Name"] = "Anonymous User";
                    UserInfo.Values["F_Name"] = "Anonymous";
                    UserInfo.Values["L_Name"] = "User";
                    UserInfo.Values["Role"] = "anonymous";
                    break;
            }
            Response.Cookies.Add(UserInfo);
            if (Request.QueryString["BackUrl"] == null)
                Response.Redirect("/CPanel/index.aspx");
            else
                Response.Redirect(Request.QueryString["BackUrl"]);
        }
        else
        {
            user.Text = pass.Text = "";
        }
    }
}