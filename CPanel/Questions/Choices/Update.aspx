<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="CPanel_Choices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Update Choices
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:Label ID=Label1 runat="server" Text="" Style="height: 50px; width: 50%; background-color: #2A3F54; display: inline-block; padding: 15px;"></asp:Label>
        <table style="width: 50%;">
            <tr></tr>
            <tr>
                <td>
                    <asp:Label ID=Label2 runat="server" Text="Choice 1" Style="width: 100%"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID=Choice1 runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label3 runat="server" Text="Choice 2" Style="width: 100%"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID=Choice2 runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label4 runat="server" Text="Choice 3" Style="width: 100%"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID=Choice3 runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label5 runat="server" Text="Choice 4" Style="width: 100%"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID=Choice4 runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID=Button1 runat="server" Text="Submit" OnClick="Button1_Click" UseSubmitBehavior="False" /></td>
            </tr>
        </table>
    </form>
</asp:Content>