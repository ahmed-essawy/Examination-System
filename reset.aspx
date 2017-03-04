<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="reset.aspx.cs" Inherits="reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form runat="server">
        <center>
            <table cellspacing="10" cellpadding="10">
            <tr>
                <td><asp:Label ID=userV runat="server" Text="Username"></asp:Label></td>
                <td>
                    <asp:TextBox ID=user runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requireduser runat="server" ErrorMessage="Username is required" ControlToValidate="user"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><asp:Label ID=mailV runat="server" Text="Email"></asp:Label></td>
                <td>
                    <asp:TextBox ID=mail runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredmail runat="server" ErrorMessage="Email is required" ControlToValidate="mail"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><asp:Label ID=passV runat="server"></asp:Label></td>
                <td><asp:Label ID=pass runat="server" Text=""></asp:Label><asp:Button ID=Send runat="server" Text="Send" OnClick="Send_Click" /></td>
                <td></td>
            </tr>
            </table>
        </center>
    </form>
</asp:Content>