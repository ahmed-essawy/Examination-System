<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Exam_Questions.aspx.cs" Inherits="CPanel_Reports_Exam_Questions" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Instructor_per_courses
</asp:Content>   
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js">
</script>
     <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td style="width: 153px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Exam Questions"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 153px">Exam ID#</td>
                <td>
                    <asp:DropDownList ID="Exams_DDList" runat="server" AutoPostBack="True" DataSourceID="Exams_Object" DataTextField="Ex_ID" DataValueField="Ex_ID" OnSelectedIndexChanged="Exams_DDList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Exams_Object" runat="server" SelectMethod="SelectAllInstructors" TypeName="ExamsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 153px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <CR:CrystalReportViewer ID="Exam_Ques_viewer" runat="server" AutoDataBind="true" ToolPanelView="None" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

