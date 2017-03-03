using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Reports_Student_Answers : System.Web.UI.Page
{
    private static ObjectDataSource ObjDS;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            ObjDS = new ObjectDataSource("StudentsLayer", "GetExID_BY_STID");
            ObjDS.SelectParameters.Clear();
            ObjDS.SelectParameters.Add("ST_ID", Students_DPList.SelectedValue.ToString());
            ObjDS.Select();
            Exam_DPList.DataSource = ObjDS;
            Exam_DPList.DataTextField = "EX_ID";
            Exam_DPList.DataValueField = "EX_ID";
            Exam_DPList.DataBind();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        ObjDS = new ObjectDataSource("StudentsLayer", "GetExID_BY_STID");
        ObjDS.SelectParameters.Clear();
        ObjDS.SelectParameters.Add("ST_ID", Students_DPList.SelectedValue.ToString());
        ObjDS.Select();
        Exam_DPList.DataSource = ObjDS;
        Exam_DPList.DataTextField = "EX_ID";
        Exam_DPList.DataValueField= "EX_ID";
        Exam_DPList.DataBind();

    }
}