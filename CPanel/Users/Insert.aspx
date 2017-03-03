<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_Users_Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    New User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <form runat="server">
        <center>
        <table>
            <tr>&nbsp;</tr>
            <tr>
                <td>Username</td>
                <td>
                    <asp:TextBox ID=user runat="server" placeholder="Username" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=Requireduser runat="server" ErrorMessage="Username is required" ControlToValidate=user></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID=pass runat="server" type="password" placeholder="Password" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=Requiredpass runat="server" ErrorMessage="Password is required" ControlToValidate="pass"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID=mail runat="server" placeholder="E-mail" style="width: 100%;"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID=Requiredmail runat="server" ErrorMessage="E-mail is required" ControlToValidate="mail"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Role</td>
                <td><asp:DropDownList ID=role_ runat="server">
                            <asp:ListItem Value="administrator" Text="Administrator">Administrators</asp:ListItem>
                            <asp:ListItem Value="instructor" Text="Instructor">Instructors</asp:ListItem>
                            <asp:ListItem Value="student" Text="Student">Students</asp:ListItem>
                            <asp:ListItem Value="anonymous" Text="Anonymous">Anonymous</asp:ListItem>
                        </asp:DropDownList>
                <td></td>
            </tr>
            <tr>
                <td>ID</td>
                <td>
                        <asp:DropDownList ID="role_id_" runat="server" DataSourceID="MembersTable" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="MembersTable" runat="server" SelectMethod="SelectAllMembers" TypeName="LoginLayer"></asp:ObjectDataSource>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><asp:Label ID=affected runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Button ID=Submit runat="server" Text="Submit" style="width: 100%;" OnClick="Submit_Click" /></td>
                <td></td>
            </tr>
        </table>
    </center>
    </form>
</asp:Content>