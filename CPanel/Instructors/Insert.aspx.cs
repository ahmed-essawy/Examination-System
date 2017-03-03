using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Instructors_Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DP_Name_drop_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_DP_ID.Text = DP_Name_drop.SelectedValue;
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        if (txt_IN_ID.Text != string.Empty && txt_IN_Fname.Text != string.Empty && txt_IN_Lname.Text != string.Empty && txt_IN_Salary.Text != string.Empty
           && txt_IN_Phone.Text != string.Empty && txt_IN_Street.Text != string.Empty && txt_IN_City.Text != string.Empty && txt_IN_Country.Text != string.Empty
           && txt_IN_Bdate.Text != string.Empty && txt_DP_ID.Text != string.Empty)
        {
            int IN_ID = int.Parse(txt_IN_ID.Text);
            string IN_Fname = txt_IN_Fname.Text;
            string IN_Lname = txt_IN_Lname.Text;
            decimal IN_Salary = decimal.Parse(txt_IN_Salary.Text);

            string IN_Phone = txt_IN_Phone.Text;
            string IN_Street = txt_IN_Street.Text;
            string IN_City = txt_IN_City.Text;
            string IN_Country = txt_IN_Country.Text;
            string IN_Bdate = txt_IN_Bdate.Text;
            int DP_ID = int.Parse(txt_DP_ID.Text);

            int s = InstructorsLayer.InsertInstructor(IN_ID, IN_Fname, IN_Lname, IN_Bdate, IN_Phone, IN_Salary, IN_Street, IN_City, IN_Country, DP_ID);
            if (s <= 0) { msg.Text = "Inserting Failed"; }
            else
            {
                msg.Text = "Insert Has Been Successfully Done ";
                txt_IN_ID.Text = string.Empty; txt_IN_Fname.Text = string.Empty; txt_IN_Lname.Text = string.Empty; txt_IN_Salary.Text = string.Empty;
                txt_IN_Phone.Text = string.Empty; txt_IN_Street.Text = string.Empty; txt_IN_City.Text = string.Empty; txt_IN_Country.Text = string.Empty;
                txt_IN_Bdate.Text = string.Empty; txt_DP_ID.Text = string.Empty;
            }
        }
        else
        {
            msg.Text = "All Fields Are Required";
        }


    }

    

    
}