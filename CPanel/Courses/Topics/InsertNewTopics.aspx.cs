using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Courses_Topics_InsertNewTopics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int CR_ID = int.Parse(DropDownList1.SelectedValue);
        string Topic_Name = TextBox1.Text;
        TopicsLayer.InsertTopic(Topic_Name, CR_ID);
    }
}