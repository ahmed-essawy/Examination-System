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

public partial class CPanel_Reports_topics_per_course : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            CR_Topics_Viewer.RefreshReport();
        }
    }

    protected void Course_DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        var cmd = new SqlCommand("Get_Course_Topics", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CR_ID", Course_DDL.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Topics_per_course_id.rpt"));
            rpt.SetParameterValue("@CR_ID", Course_DDL.SelectedValue);
            rpt.SetDataSource(dt);
            CR_Topics_Viewer.ReportSource = rpt;
            CR_Topics_Viewer.DataBind();

        }
        else
        {
            CR_Topics_Viewer.ReportSource = null;
            CR_Topics_Viewer.DataBind();
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