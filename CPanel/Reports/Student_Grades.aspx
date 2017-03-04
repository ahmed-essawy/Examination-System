<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Student_Grades.aspx.cs" Inherits="CPanel_Reports_Student_Grades" %>

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
                <td style="width: 165px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Student Grades"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 165px">Student Name</td>
                <td>
                    <asp:DropDownList ID="Student_DDL" runat="server" AutoPostBack="True" DataSourceID="Student_Object" DataTextField="ST_Name" DataValueField="ST_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Student_Object" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 165px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <CR:CrystalReportViewer ID="ST_Grades_viewer" runat="server" AutoDataBind="true" ToolPanelView="None" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

