<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_InsertAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Administrators
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">

        <table style="width: 98%;">
            <tr>
                <td style="width: 139px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="New Administrator Info"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">ID:</td>
                <td>
                    <asp:TextBox ID="txt_AD_ID" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 35px; width: 139px">FirstName:</td>
                <td style="height: 35px">
                    <asp:TextBox ID="txt_AD_Fname" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td style="height: 35px"></td>
            </tr>
            <tr>
                <td style="width: 139px">LastName:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Lname" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">BirthDate:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Bdate" Style="width: 50%" Type="date" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Phone:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Phone" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Salary:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Salary" Style="width: 50%" Type="money" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Street:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Street" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">City:</td>
                <td>
                    <asp:TextBox ID="txt_AD_City" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Country:</td>
                <td>
                    <asp:TextBox ID="txt_AD_Country" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">&nbsp;</td>
                <td>
                    <asp:Button ID="Insert" runat="server" Text="Insert" Style="position: relative; left: 143px; top: 0px; width: 241px" OnClick="Insert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>