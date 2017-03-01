using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class CPanel_Reports_Department_Students : System.Web.UI.Page
{
    ReportDocument rpt;
    //Department_Students rpt = new Department_Students();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        rpt = new ReportDocument();
        rpt.Load(Server.MapPath("~/Department_Students.rpt"));
        CrystalReportViewer1.ReportSource= rpt;
        
    }
}