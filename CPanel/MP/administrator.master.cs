using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] section = {
            "/CPanel/aa"
        };
        if (section.All(BindingContainer.TemplateSourceDirectory.Contains))
            Response.Redirect("/CPanel/permission.aspx");
    }
}