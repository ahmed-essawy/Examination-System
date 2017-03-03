using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.Cookies["UserInfo"]["Role"] != "anonymous")
        {
            DataRow LoginData = LoginLayer.SelectUser(Request.Cookies["UserInfo"]["Username"]);
            DataRow UserInfo = LoginLayer.SelectMembers(Request.Cookies["UserInfo"]["Role"], Request.Cookies["UserInfo"]["ID"]);
            fname.Text = Request.Cookies["UserInfo"]["F_Name"];
            lname.Text = Request.Cookies["UserInfo"]["L_Name"];
            user.Text = LoginData["Username"].ToString();
            mail.Text = LoginData["Email"].ToString();
            pass.Text = LoginData["Password"].ToString();
            birth.Text = Convert.ToDateTime(UserInfo[4].ToString()).ToString("yyyy-MM-dd");
            phone.Text = UserInfo[6].ToString();
            street.Text = UserInfo[8].ToString();
            city.Text = UserInfo[9].ToString();
            country.Text = UserInfo[10].ToString();
        }
        else if (!IsPostBack && Request.Cookies["UserInfo"]["Role"] == "anonymous")
        {
            DataRow LoginData = LoginLayer.SelectUser(Request.Cookies["UserInfo"]["Username"]);
            fname.Text = Request.Cookies["UserInfo"]["F_Name"];
            lname.Text = Request.Cookies["UserInfo"]["L_Name"];
            user.Text = LoginData["Username"].ToString();
            mail.Text = LoginData["Email"].ToString();
            pass.Text = LoginData["Password"].ToString();
            birth.Visible = false;
            phone.Visible = false;
            street.Visible = false;
            city.Visible = false;
            country.Visible = false;
            LabelBirth.Visible = false;
            LabelPhone.Visible = false;
            LabelStreet.Visible = false;
            LabelCity.Visible = false;
            LabelCountry.Visible = false;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (((Button)sender).Text == "Edit")
        {
            fname.Enabled = true;
            lname.Enabled = true;
            mail.Enabled = true;
            pass.Enabled = true;
            birth.Enabled = true;
            phone.Enabled = true;
            street.Enabled = true;
            city.Enabled = true;
            country.Enabled = true;
            ((Button)sender).Text = "Save";
            ((Button)sender).CausesValidation = true;
        }
        else if (((Button)sender).Text == "Save")
        {
            LoginLayer.UpdateUser(user.Text, pass.Text, mail.Text, Request.Cookies["UserInfo"]["Role"], int.Parse(Request.Cookies["UserInfo"]["ID"]));
            HttpCookie UserInfo = Request.Cookies["UserInfo"];
            UserInfo.Values["Name"] = fname.Text + " " + lname.Text;
            UserInfo.Values["F_Name"] = fname.Text;
            UserInfo.Values["L_Name"] = lname.Text;
            if (Request.Cookies["UserInfo"]["Role"] != "anonymous")
                LoginLayer.UpdateMember(Request.Cookies["UserInfo"]["Role"], int.Parse(Request.Cookies["UserInfo"]["ID"]), fname.Text, lname.Text, birth.Text, phone.Text, street.Text, city.Text, country.Text);
            fname.Enabled = false;
            lname.Enabled = false;
            mail.Enabled = false;
            pass.Enabled = false;
            birth.Enabled = false;
            phone.Enabled = false;
            street.Enabled = false;
            city.Enabled = false;
            country.Enabled = false;
            ((Button)sender).Text = "Edit";
            ((Button)sender).CausesValidation = false;
            Response.Cookies.Add(UserInfo);
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