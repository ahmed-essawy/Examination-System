<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form runat="server">
        <center>
        <table style="width: 300px;">
            <tr>
                <td>
                    <asp:TextBox ID=user runat="server" placeholder="Username" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=Requireduser runat="server" ErrorMessage="Username is required" ControlToValidate=user></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID=pas1 runat="server" type="password" placeholder="Password" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=RequiredFieldValidator1 runat="server" ErrorMessage="Password is required" ControlToValidate="pas1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID=pas2 runat="server" type="password" placeholder="Confirm Password" style="width: 100%;"></asp:TextBox></td>
                <td><asp:CompareValidator ID=CompareValidator1 runat="server" ErrorMessage="Password not matched" ControlToCompare="pas1" ControlToValidate="pas2"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID=mail runat="server" placeholder="E-mail" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=RequiredFieldValidator2 runat="server" ErrorMessage="E-mail is required" ControlToValidate="mail"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><asp:Label ID=affected runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Button ID=Submit runat="server" Text="Submit" style="width: 100%;" OnClick="Submit_Click" /></td>
            </tr>
        </table>
    </center>
    </form>
</asp:Content>