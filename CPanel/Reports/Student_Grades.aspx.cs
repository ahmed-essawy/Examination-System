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

public partial class CPanel_Reports_Student_Grades : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            ST_Grades_viewer.RefreshReport();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var cmd = new SqlCommand("Get_Student_Grades", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ST_ID", Student_DDL.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Student_Grades.rpt"));
            rpt.SetParameterValue("@ST_ID", Student_DDL.SelectedValue);
            rpt.SetDataSource(dt);
            ST_Grades_viewer.ReportSource = rpt;
            ST_Grades_viewer.DataBind();
        }
        else
        {
            ST_Grades_viewer.ReportSource = null;
            ST_Grades_viewer.DataBind();
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