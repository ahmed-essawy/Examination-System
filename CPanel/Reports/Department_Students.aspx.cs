using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class CPanel_Reports_Department_Students : System.Web.UI.Page
{
    ReportDocument rpt;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Linah"].ToString());
   // Department_Students rpt = new Department_Students();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Page.IsPostBack==false)
        //{
        //    rpt.Refresh();
        //}
      
    }
    protected void Page_Init(object sender, EventArgs e)
    {
      /* if (Session["report"] != null)
        {
            Dp_st_reportviewer.ReportSource = (Department_Students)Session["report"];
        }
        */
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // int DP_ID = int.Parse(DropDownList1.SelectedValue);
        var cmd = new SqlCommand("Get_students_by_Department", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@DP_ID", DropDownList1.SelectedValue);
        con.Open();
        var da = new SqlDataAdapter(cmd);
        var ds = new DataSet();
        da.Fill(ds);
        con.Close();
        rpt = new ReportDocument();
        rpt.Load(Server.MapPath("~/Department_Students.rpt"));
        rpt.SetParameterValue("@DP_ID", DropDownList1.SelectedValue);
        rpt.SetDataSource(ds);
        Dp_st_reportviewer.ReportSource = rpt;
        Dp_st_reportviewer.DataBind();
        //Department_Student_DS.Get_students_by_DepartmentDataTable GetStud = new Department_Student_DS.Get_students_by_DepartmentDataTable();
        //Department_Student_DSTableAdapters.Get_students_by_DepartmentTableAdapter GetStudAdapter = new Department_Student_DSTableAdapters.Get_students_by_DepartmentTableAdapter();
        //GetStud = GetStudAdapter.GetData(DP_ID);
        //rpt = new ReportDocument();
        //rpt.Load(Server.MapPath("~/Department_Students.rpt"));
        //rpt.SetParameterValue("@DP_ID", DP_ID);
        //Dp_st_reportviewer.ReportSource = rpt;


    }
}