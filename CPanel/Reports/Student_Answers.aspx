<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Student_Answers.aspx.cs" Inherits="CPanel_Reports_Student_Answers" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Student Exam Answers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <script lang="javaScript" type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js"></script>
    
    <form runat="server">
        <table style="width: 100%;">
            <tr>
                <td style="width: 91px">&nbsp;</td>
                <td style="width: 220px">
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Student Exam Answers"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 91px; height: 60px;">Student Name:</td>
                <td style="height: 60px; width: 220px;">
                    <asp:DropDownList ID="Students_DPList" runat="server" AutoPostBack="True" DataSourceID="Student_Object" DataTextField="ST_Name" DataValueField="ST_ID" Height="24px" Width="149px" >
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Student_Object" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td style="height: 60px"></td>
            </tr>
            <tr>
                <td style="width: 91px">Exam_ID:</td>
                <td style="width: 220px">
                    <asp:DropDownList ID="Exam_DPList" runat="server" AutoPostBack="True" DataSourceID="Exam_object" DataTextField="EX_ID" DataValueField="EX_ID" Height="16px" Width="147px">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Exam_object" runat="server" SelectMethod="GetExID_BY_STID" TypeName="StudentsLayer">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Students_DPList" DefaultValue="0" Name="ST_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 91px">&nbsp;</td>
                <td style="width: 220px">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Student Answers" Width="136px" />
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                    <CR:CrystalReportViewer ID="Student_Exam_Ans_viewer" runat="server" AutoDataBind="true" ToolPanelView="None" />
                </td>
                <td style="width: 220px">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

