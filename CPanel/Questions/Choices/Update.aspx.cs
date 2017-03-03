using System;
using System.Collections.Generic;
using System.Data;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Choices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["id"] != null)
            {
                int QS_ID = int.Parse(Request["id"]);
                if (ChoicesLayer.QuestionType(QS_ID) == "MCQ")
                {
                    Label1.Text = ChoicesLayer.SelectQuestion(QS_ID);
                    DataRowCollection row = ChoicesLayer.SelectChoices((int)QS_ID).Tables[0].Rows;
                    if (row.Count > 0)
                        Choice1.Text = row[0]["Choice"].ToString();
                    if (row.Count > 1)
                        Choice2.Text = row[1]["Choice"].ToString();
                    if (row.Count > 2)
                        Choice3.Text = row[2]["Choice"].ToString();
                    if (row.Count > 3)
                        Choice4.Text = row[3]["Choice"].ToString();
                }
                else
                {
                    Choice1.Enabled = false;
                    Choice2.Enabled = false;
                    Choice3.Enabled = false;
                    Choice4.Enabled = false;
                    Button1.Enabled = false;
                }
            }
            else
            {
                Choice1.Enabled = false;
                Choice2.Enabled = false;
                Choice3.Enabled = false;
                Choice4.Enabled = false;
                Button1.Enabled = false;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            int QS_ID = int.Parse(Request["id"]);
            if (ChoicesLayer.QuestionType(QS_ID) == "MCQ")
            {
                string QS_Choice1 = Choice1.Text;
                string QS_Choice2 = Choice2.Text;
                string QS_Choice3 = Choice3.Text;
                string QS_Choice4 = Choice4.Text;
                ChoicesLayer.UpdateChoices(QS_ID, QS_Choice1, QS_Choice2, QS_Choice3, QS_Choice4);
            }
            else
            {
                Choice1.Enabled = false;
                Choice2.Enabled = false;
                Choice3.Enabled = false;
                Choice4.Enabled = false;
                Button1.Enabled = false;
            }
        }
        else
        {
            Choice1.Enabled = false;
            Choice2.Enabled = false;
            Choice3.Enabled = false;
            Choice4.Enabled = false;
            Button1.Enabled = false;
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