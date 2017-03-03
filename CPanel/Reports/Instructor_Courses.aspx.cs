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
        var cmd = new SqlCommand("Get_Instructor_Courses", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@IN_ID", Instructors_DPList.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var ds = new DataTable();
        da.Fill(ds);
        con.Close();
        rpt = new ReportDocument();
        rpt.Load(Server.MapPath("Instructor_courses.rpt"));
        rpt.SetParameterValue("@IN_ID", Instructors_DPList.SelectedValue);
        rpt.SetDataSource(ds);
        IN_CR_reportViewer.ReportSource = rpt;
        IN_CR_reportViewer.DataBind();

    }
}