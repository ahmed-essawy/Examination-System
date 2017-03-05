using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Questions_Exams_Solve : System.Web.UI.Page
{
    private static int EX_ID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            EX_ID = int.Parse(Request.QueryString["id"]);
            int count = 1;
            if (Request.Cookies["UserInfo"]["Role"] == "student")
            {
                int ST_ID = int.Parse(Request.Cookies["UserInfo"]["ID"]);
                bool? finished = ExamsLayer.Student_Finish_Exam(ST_ID, EX_ID);
                if (finished == false)
                {
                    DataRowCollection DR_Questions = ExamsLayer.SelectQuestions(EX_ID).Tables[0].Rows;
                    foreach (DataRow Question in DR_Questions)
                    {
                        int QS_ID = int.Parse(Question["QS_ID"].ToString());
                        string QS_Value = ChoicesLayer.SelectQuestion(QS_ID);
                        Label QS = new Label
                        {
                            Text = count++ + ". " + QS_Value,
                            ID = "QS_" + QS_ID,
                            ForeColor = System.Drawing.Color.Black,
                            CssClass = "Label-Style"
                        };
                        QS.Font.Size = FontUnit.Large;
                        List<string> Choices = new List<string>();
                        if (ChoicesLayer.QuestionType(QS_ID) == "MCQ")
                        {
                            DataRowCollection DR_Choices = ChoicesLayer.SelectChoices(QS_ID).Tables[0].Rows;
                            foreach (DataRow Choice in DR_Choices)
                            {
                                Choices.Add(Choice["Choice"].ToString());
                            }
                        }
                        else if (ChoicesLayer.QuestionType(QS_ID) == "T/F")
                        {
                            Choices.AddRange(new[] { "True", "False" });
                        }
                        RadioButtonList CH = new RadioButtonList
                        {
                            DataSource = Choices,
                            ID = "CH_" + QS_ID,
                            RepeatDirection = RepeatDirection.Horizontal,
                            AutoPostBack = true,
                            CssClass = "Radio-Style"
                        };
                        CH.SelectedIndexChanged += Choice_Changed;
                        CH.DataBind();
                        RequiredFieldValidator F_Valid = new RequiredFieldValidator
                        {
                            ErrorMessage = "You have to answer this question",
                            ControlToValidate = "CH_" + QS_ID
                        };
                        form1.Controls.Add(QS);
                        form1.Controls.Add(CH);
                        form1.Controls.Add(F_Valid);
                    }
                    Button submit = new Button
                    {
                        Text = "Submit"
                    };
                    submit.Click += Submit_Click;
                    form1.Controls.Add(submit);
                }
                else if (finished == true)
                {
                    DataRow DR = StudentsLayer.StudentCourseGrade(ST_ID, EX_ID);
                    int Grade = int.Parse(DR["Grade"].ToString());
                    int CR_Grade = int.Parse(DR["CR_Grade"].ToString());
                    MSG.Text = "Exam finished with grade " + Grade + "/" + CR_Grade;
                }
                else
                {
                    MSG.Text = "Exam not found";
                }
            }
        }
    }

    protected void Choice_Changed(object sender, EventArgs e)
    {
        int ST_ID = int.Parse(Request.Cookies["UserInfo"]["ID"]);
        int QS_ID = int.Parse(((RadioButtonList)sender).ID.Split('_')[1]);
        string Choice = ((RadioButtonList)sender).Text;
        ExamsLayer.UpdateChoice(ST_ID, EX_ID, QS_ID, Choice);
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        int ST_ID = int.Parse(Request.Cookies["UserInfo"]["ID"]);
        ExamsLayer.CorrectExam(ST_ID, EX_ID);
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
            this.MasterPageFile = "~/CPanel/MP/" + Request.Cookies["UserInfo"]["Role"] + ".master";
        else
            Response.Redirect("/login.aspx?BackUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
    }
}