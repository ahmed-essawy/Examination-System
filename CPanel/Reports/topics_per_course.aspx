<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="topics_per_course.aspx.cs" Inherits="CPanel_Reports_topics_per_course" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Topics Per Course
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
   <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js">
</script>
     <form id="form1" runat="server">
    
     <table style="width:100%;">
        <tr>
            <td style="width: 161px">&nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Course Topics"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 161px">Course name:</td>
            <td>
                <asp:DropDownList ID="Course_DDL" runat="server" AutoPostBack="True" DataSourceID="Course_object" DataTextField="CR_Name" DataValueField="CR_ID" OnSelectedIndexChanged="Course_DDL_SelectedIndexChanged" Width="127px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="Course_object" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 161px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <CR:CrystalReportViewer ID="CR_Topics_Viewer" runat="server" AutoDataBind="true" ToolPanelView="None" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>


