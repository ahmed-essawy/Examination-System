using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
                }
            }
            else
            {
                Choice1.Enabled = false;
                Choice2.Enabled = false;
                Choice3.Enabled = false;
                Choice4.Enabled = false;
            }
        }
    }
}