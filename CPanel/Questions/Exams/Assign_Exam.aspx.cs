using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Questions_Exams_Assign_Exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int ST_ID = int.Parse(DropDownList1.SelectedValue);
        int EX_ID = int.Parse(DropDownList2.SelectedValue);
        if(ST_ID != 0 && EX_ID != 0)
        {
            int affected = ExamsLayer.Assign_Exam(ST_ID, EX_ID);
            if (affected <= 0)
            {
                msg.Text = "Assign Failed";
            }
            else
            {
                msg.Text = "Exam was Assigned Successfully";
         
            }
        }
        else
        {
            msg.Text = "Student Doesn't have any Exam To be Generated";
        }
        

    }
}