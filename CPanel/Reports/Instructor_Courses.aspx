<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Instructor_Courses.aspx.cs" Inherits="CPanel_Reports_Instructor_Courses" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
     <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js">
</script>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 125px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="&nbsp;Instructor Courses"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 125px">Instructor Name</td>
                <td>
                    <asp:DropDownList ID="Instructors_DPList" runat="server" AutoPostBack="True" DataSourceID="Instructors_Object" DataTextField="IN_Name" DataValueField="IN_ID" OnSelectedIndexChanged="Instructors_DPList_SelectedIndexChanged" Width="119px">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Instructors_Object" runat="server" SelectMethod="SelectAllInstructors" TypeName="InstructorsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 125px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <CR:CrystalReportViewer ID="IN_CR_reportViewer" runat="server" AutoDataBind="true" ToolPanelView="None" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

