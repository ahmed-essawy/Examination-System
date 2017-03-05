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


public partial class CPanel_Reports_Student_Answers : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Student_Exam_Ans_viewer.RefreshReport();
        }

    }

    protected void Exam_DPList_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var cmd = new SqlCommand("Get_Student_Answers", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ST_ID", Students_DPList.SelectedValue);
        cmd.Parameters.AddWithValue("@EX_ID", Exam_DPList.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Student_Answers.rpt"));
            rpt.SetParameterValue("@ST_ID", Students_DPList.SelectedValue);
            rpt.SetParameterValue("@EX_ID", Exam_DPList.SelectedValue);
            rpt.SetDataSource(dt);
            Student_Exam_Ans_viewer.ReportSource = rpt;
            Student_Exam_Ans_viewer.DataBind();

        }
        else
        {
            Student_Exam_Ans_viewer.ReportSource = null;
            Student_Exam_Ans_viewer.DataBind();
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