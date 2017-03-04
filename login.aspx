<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form runat="server">
        <center>
            <table cellspacing="10" cellpadding="10">
                <tr>
                    <td style="width: 68px">Username</td>
                    <td style="width: 136px"><asp:TextBox ID=user runat="server" placeholder="Username" style="height: 35px;width: 250px;"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 68px">Password</td>
                    <td style="width: 136px"><asp:TextBox ID=pass runat="server" type="password" placeholder="Password" style="height: 35px;width: 250px;"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID=login_button runat="server" Text="Login" style="width: 100%;background:#4e5944;" OnClick="login_button_Click"></asp:Button></td>
                </tr>
                <tr style="text-align: right;">
                    <td colspan="2">Forget password? <a href="reset.aspx">Reset password</a></td>
                </tr>
                <tr style="text-align: right;">
                    <td colspan="2">Not registered? <a href="register.aspx">Create an account</a></td>
                </tr>
            </table>
        </center>
    </form>
</asp:Content>