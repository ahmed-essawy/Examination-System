<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Assign_Exam.aspx.cs" Inherits="CPanel_Questions_Exams_Assign_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Assign Exam
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <table style="width: 20%;">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Assign Exam"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Student name</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" Style="width: 100%; height: 30px;" runat="server" AutoPostBack="True" DataSourceID="Student_Object" DataTextField="St_Name" DataValueField="ST_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Student_Object" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Exam ID</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" Style="width: 100%; height: 30px;" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="EX_ID" DataValueField="EX_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectEXAMID_ByStudentID" TypeName="ExamsLayer">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="ST_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="msg" runat="server"></asp:Label></td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Assign Exam" Style="width: 100%; height: 30px;" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>