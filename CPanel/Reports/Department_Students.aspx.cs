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

public partial class CPanel_Reports_Department_Students : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Dp_st_reportviewer.RefreshReport();
        }

    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var cmd = new SqlCommand("Get_students_by_Department", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@DP_ID", Department_DPList.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Department_Students.rpt"));
            rpt.SetParameterValue("@DP_ID", Department_DPList.SelectedValue);
            rpt.SetDataSource(dt);
            Dp_st_reportviewer.ReportSource = rpt;
            Dp_st_reportviewer.DataBind();
        }
        else
        {
            Dp_st_reportviewer.ReportSource = null;
            Dp_st_reportviewer.DataBind();
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