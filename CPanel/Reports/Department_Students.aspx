<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="Department_Students.aspx.cs" Inherits="CPanel_Reports_Department_Students" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Instructor_per_courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js">
</script>
    <form id="form1" runat="server">
        <table class="nav-justified">
            <tr>
                <td style="width: 230px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Department Students"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 230px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 230px">
                    <asp:Label ID="Label2" runat="server" Text="Choose Department"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="Department_DPList" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="DP_Name" DataValueField="DP_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAllDepartments" TypeName="DepartmentsLayer" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 230px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <CR:CrystalReportViewer ID="Dp_st_reportviewer" runat="server" AutoDataBind="true" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

