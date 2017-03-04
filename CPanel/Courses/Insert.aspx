<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_Insert_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">

        <table style="width: 100%;">
            <tr>&Snbsp;</tr>
            <tr>
                <td style="width: 293px">Name:</td>
                <td>
                    <asp:TextBox ID="cr_name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredcr_name runat="server" ErrorMessage="Course name is required" ControlToValidate=cr_name></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 293px">Grade:</td>
                <td>
                    <asp:TextBox ID="cr_grade" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredcr_grade runat="server" ErrorMessage="Course grade is required" ControlToValidate=cr_grade></asp:RequiredFieldValidator></td>
            </tr>
        </table>

        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Insert" Width="70px" OnClick="Button1_Click" />
    </form>
</asp:Content>