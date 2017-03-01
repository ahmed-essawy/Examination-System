<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="InsertNewTopics.aspx.cs" Inherits="CPanel_Courses_Topics_InsertNewTopics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 103px; height: 26px;"></td>
                <td class="modal-sm" style="width: 308px; height: 26px"></td>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td style="width: 103px">Course Name:</td>
                <td class="modal-sm" style="width: 308px">
                    <asp:DropDownList ID="DropDownList1" style="width:50%" runat="server" AutoPostBack="True" DataSourceID="Courses" DataTextField="CR_Name" DataValueField="CR_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Courses" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 103px">Topic Name:</td>
                <td class="modal-sm" style="width: 308px">
                    <asp:TextBox ID="TextBox1" style="width:50%;height:25%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 103px">&nbsp;</td>
                <td class="modal-sm" style="width: 308px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="position: relative; left: 11px; top: 2px" Text="Insert" Width="135px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

