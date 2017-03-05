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


public partial class CPanel_Reports_Instructor_Courses : System.Web.UI.Page
{
    ReportDocument rpt;
   // ObjectDataSource ObjDS;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            IN_CR_reportViewer.RefreshReport();
        }
    }

    protected void Instructors_DPList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int IN_ID = int.Parse(Instructors_DPList.SelectedValue.ToString());
        //ObjDS = new ObjectDataSource();
        //ObjDS.TypeName = "ReportsLayer";
        //ObjDS.SelectMethod = "GetInstructorCourses";
        //ObjDS.SelectParameters.Add("IN_ID", IN_ID.ToString());
        //ObjDS.Select();
        //rpt = new ReportDocument();
        //rpt.Load(Server.MapPath("Instructor_courses.rpt"));
        //rpt.SetParameterValue("@IN_ID", IN_ID);
        //rpt.SetDataSource(ObjDS);
        //IN_CR_reportViewer.ReportSource = rpt;
        //IN_CR_reportViewer.DataBind();
        ///////////////////////////////////////////////////////////////////////
        var cmd = new SqlCommand("Get_Instructor_Courses", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@IN_ID", Instructors_DPList.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt != null && dt.Rows.Count > 0)
        {
            rpt = new ReportDocument();
            rpt.Load(Server.MapPath("Instructor_courses.rpt"));
            rpt.SetParameterValue("@IN_ID", Instructors_DPList.SelectedValue);
            rpt.SetDataSource(dt);
            IN_CR_reportViewer.ReportSource = rpt;
            IN_CR_reportViewer.DataBind();
        }
        else
        {
            IN_CR_reportViewer.ReportSource = null;
            IN_CR_reportViewer.DataBind();
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