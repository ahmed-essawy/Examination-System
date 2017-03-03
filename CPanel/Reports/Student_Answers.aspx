<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="Student_Answers.aspx.cs" Inherits="CPanel_Reports_Student_Answers" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 133px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Student Exam Answers"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 133px">Student Name:</td>
                <td>
                    <asp:DropDownList ID="Students_DPList" runat="server" AutoPostBack="True" DataSourceID="Student_Object" DataTextField="ST_Name" DataValueField="ST_ID" Height="16px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="149px">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Student_Object" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 133px">Exam_ID:</td>
                <td>
                    <asp:DropDownList ID="Exam_DPList" runat="server" AutoPostBack="True" Height="16px" Width="145px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 133px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

