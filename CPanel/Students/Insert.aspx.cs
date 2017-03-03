using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_InsertStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StudentsLayer.SelectDP();
            DP_Name_drop.DataSource = StudentsLayer.ds;
            DP_Name_drop.DataTextField = "DP_Name";
            DP_Name_drop.DataValueField = "DP_ID";
            DP_Name_drop.DataBind();
        }
    }

    protected void DP_Name_drop_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_DP_ID.Text = DP_Name_drop.SelectedValue.ToString();
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        if (txt_ST_ID.Text != string.Empty && txt_ST_Fname.Text != string.Empty && txt_ST_Lname.Text != string.Empty && txt_ST_Salary.Text != string.Empty
            && txt_ST_Phone.Text != string.Empty && txt_ST_Street.Text != string.Empty && txt_ST_City.Text != string.Empty && txt_ST_Country.Text != string.Empty
            && txt_ST_Bdate.Text != string.Empty && txt_DP_ID.Text != string.Empty)
        {
            int ST_ID = int.Parse(txt_ST_ID.Text);
            string ST_Fname = txt_ST_Fname.Text;
            string ST_Lname = txt_ST_Lname.Text;
            decimal ST_Salary = decimal.Parse(txt_ST_Salary.Text);

            string ST_Phone = txt_ST_Phone.Text;
            string ST_Street = txt_ST_Street.Text;
            string ST_City = txt_ST_City.Text;
            string ST_Country = txt_ST_Country.Text;
            string ST_Bdate = txt_ST_Bdate.Text;
            int DP_ID = int.Parse(txt_DP_ID.Text);

            int s = StudentsLayer.InsertStudent(ST_ID, ST_Fname, ST_Lname, ST_Bdate, ST_Phone, ST_Salary, ST_Street, ST_City, ST_Country, DP_ID);
            if (s <= 0) { msg.Text = "Inserting Failed"; }
            else
            {
                msg.Text = "Insert Has Been Done Successfully";
                txt_ST_ID.Text = string.Empty; txt_ST_Fname.Text = string.Empty; txt_ST_Lname.Text = string.Empty; txt_ST_Salary.Text = string.Empty;
                txt_ST_Phone.Text = string.Empty; txt_ST_Street.Text = string.Empty; txt_ST_City.Text = string.Empty; txt_ST_Country.Text = string.Empty;
                txt_ST_Bdate.Text = string.Empty; txt_DP_ID.Text = string.Empty;DP_Name_drop.SelectedIndex = 0;
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