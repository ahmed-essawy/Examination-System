<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="CPanel_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <table>
            <tr>&nbsp;</tr>
            <tr>
                <td>Name</td>
                <td>
                    <asp:TextBox ID=fname runat="server" Enabled=false Style="width: 49%;"></asp:TextBox>
                    <asp:TextBox ID=lname runat="server" Enabled=false Style="width: 49%;"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredfname runat="server" ErrorMessage="First name is required" ControlToValidate=fname></asp:RequiredFieldValidator></td>
                <asp:RequiredFieldValidator ID=Requiredlname runat="server" ErrorMessage="Last name is required" ControlToValidate=lname></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Username</td>
                <td>
                    <asp:TextBox ID=user runat="server" Enabled=false></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requireduser runat="server" ErrorMessage="Username is required" ControlToValidate=user></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID=mail runat="server" Enabled=false></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredmail runat="server" ErrorMessage="Email is required" ControlToValidate=mail></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID=pass runat="server" type="password" Enabled=false></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredpass runat="server" ErrorMessage="Password is required" ControlToValidate=pass></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=LabelBirth Text="Birthdate" runat="server" /></td>
                <td>
                    <asp:TextBox ID=birth runat="server" Enabled=false type="date"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID=Requiredbirth runat="server" ErrorMessage="Birthdate is required" ControlToValidate=birth></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=LabelPhone Text="Phone" runat="server" /></td>
                <td>
                    <asp:TextBox ID=phone runat="server" Enabled=false></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=LabelStreet Text="Street" runat="server" /></td>
                <td>
                    <asp:TextBox ID=street runat="server" Enabled=false></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=LabelCity Text="City" runat="server" /></td>
                <td>
                    <asp:TextBox ID=city runat="server" Enabled=false></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=LabelCountry Text="Country" runat="server" /></td>
                <td>
                    <asp:TextBox ID=country runat="server" Enabled=false></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID=submit runat="server" Text="Edit" CausesValidation="False" OnClick="submit_Click" /></td>
                <td></td>
            </tr>
        </table>
    </form>
</asp:Content>