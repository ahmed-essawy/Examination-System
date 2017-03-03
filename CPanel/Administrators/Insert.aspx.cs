using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_InsertAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        if (txt_AD_ID.Text != string.Empty && txt_AD_Fname.Text != string.Empty && txt_AD_Lname.Text != string.Empty && txt_AD_Salary.Text != string.Empty
            && txt_AD_Phone.Text != string.Empty && txt_AD_Street.Text != string.Empty && txt_AD_City.Text != string.Empty && txt_AD_Country.Text != string.Empty
            && txt_AD_Bdate.Text != string.Empty)
        {
            int AD_ID = int.Parse(txt_AD_ID.Text);
            string AD_Fname = txt_AD_Fname.Text;
            string AD_Lname = txt_AD_Lname.Text;
            decimal AD_Salary = decimal.Parse(txt_AD_Salary.Text);

            string AD_Phone = txt_AD_Phone.Text;
            string AD_Street = txt_AD_Street.Text;
            string AD_City = txt_AD_City.Text;
            string AD_Country = txt_AD_Country.Text;
            string AD_Bdate = txt_AD_Bdate.Text;

            int s = AdministratorsLayer.InsertAdministrator(AD_ID, AD_Fname, AD_Lname, AD_Bdate, AD_Phone, AD_Salary, AD_Street, AD_City, AD_Country);
            if (s <= 0) { msg.Text = "Inserting Failed"; }
            else
            {
                msg.Text = "Insert Has Been Done Successfully";
                txt_AD_ID.Text = string.Empty; txt_AD_Fname.Text = string.Empty; txt_AD_Lname.Text = string.Empty; txt_AD_Salary.Text = string.Empty;
                txt_AD_Phone.Text = string.Empty; txt_AD_Street.Text = string.Empty; txt_AD_City.Text = string.Empty; txt_AD_Country.Text = string.Empty;
                txt_AD_Bdate.Text = string.Empty;
            }
        }
        else
        {
            msg.Text = "All Fields Are Required";
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