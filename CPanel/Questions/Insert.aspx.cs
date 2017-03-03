using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Insert_Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (QS_Type.SelectedValue == "MCQ")
        {
            QS_Answer1.Visible = true;
            QS_Answer2.Visible = true;
            QS_Answer3.Visible = true;
            QS_Answer4.Visible = true;
            QS_Correct.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label1.Text = "Answer 1";
            QS_Answer.Visible = false;
            RequiredQS_Answer1.Enabled = true;
            RequiredQS_Answer2.Enabled = true;
            RequiredQS_Answer3.Enabled = true;
            RequiredQS_Answer4.Enabled = true;
            RequiredQS_Correct.Enabled = true;
        }
        else
        {
            QS_Answer1.Visible = false;
            QS_Answer2.Visible = false;
            QS_Answer3.Visible = false;
            QS_Answer4.Visible = false;
            QS_Correct.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label1.Text = "Answer";
            QS_Answer.Visible = true;
            RequiredQS_Answer1.Enabled = false;
            RequiredQS_Answer2.Enabled = false;
            RequiredQS_Answer3.Enabled = false;
            RequiredQS_Answer4.Enabled = false;
            RequiredQS_Correct.Enabled = false;
        }
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        string CR_Nam = CR_Name.SelectedItem.ToString();
        string QS_Valu = QS_Value.Text;
        if (QS_Type.SelectedItem.ToString() == "MCQ")
        {
            string QS_A1 = QS_Answer1.Text;
            string QS_A2 = QS_Answer2.Text;
            string QS_A3 = QS_Answer3.Text;
            string QS_A4 = QS_Answer4.Text;
            string QS_Co = QS_Correct.Text;
            QuestionsLayer.InsertQuestionMCQ(CR_Nam, QS_Valu, QS_A1, QS_A2, QS_A3, QS_A4, QS_Co);
        }
        else if (QS_Type.SelectedItem.ToString() == "T/F")
        {
            string QS_Co = QS_Answer.SelectedItem.ToString();
            QuestionsLayer.InsertQuestionTF(CR_Nam, QS_Valu, QS_Co);
        }
        CR_Name.SelectedIndex = 0;
        QS_Value.Text = String.Empty;
        QS_Answer1.Text = String.Empty;
        QS_Answer2.Text = String.Empty;
        QS_Answer3.Text = String.Empty;
        QS_Answer4.Text = String.Empty;
        QS_Correct.Text = String.Empty;
        QS_Answer.SelectedIndex = 0;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}