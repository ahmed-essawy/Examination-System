<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Assign_Exam.aspx.cs" Inherits="CPanel_Questions_Exams_Assign_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="modal-sm" style="width: 150px">&nbsp;</td>
                <td style="width: 333px">
                    <asp:Label ID="Label1" runat="server" Text="Assign Exam"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 150px">Student name</td>
                <td style="width: 333px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Student_Object" DataTextField="St_Name" DataValueField="ST_ID" Height="16px" Width="122px">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Student_Object" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 150px">Exam ID</td>
                <td style="width: 333px">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="EX_ID" DataValueField="EX_ID" Height="16px" Width="117px">
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
                <td class="modal-sm" style="width: 150px">&nbsp;</td>
                <td style="width: 333px">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Assign Exam" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 150px">&nbsp;</td>
                <td style="width: 333px">&nbsp;</td>
                <td>
                    <asp:Label ID="msg" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>

