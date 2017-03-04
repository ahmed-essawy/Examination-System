using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class CPanel_Reports_Exam_Questions : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Exam_Ques_viewer.RefreshReport();
        }
    }

    protected void Exams_DDList_SelectedIndexChanged(object sender, EventArgs e)
    {
        var cmd = new SqlCommand("Get_Exam_Questions", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EX_ID", Exams_DDList.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Exam's_Questions.rpt"));
            rpt.SetParameterValue("EX_ID", Exams_DDList.SelectedValue);
            rpt.SetDataSource(dt);
            Exam_Ques_viewer.ReportSource = rpt;
            Exam_Ques_viewer.DataBind();
        }
        else
        {
            Exam_Ques_viewer.ReportSource = null;
            Exam_Ques_viewer.DataBind();
        }
    }
}