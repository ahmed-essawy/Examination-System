<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_Departments_Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Departments
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">New Department Info</td>
                <td>
                    <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">Department Name:</td>
                <td>
                    <asp:TextBox ID="txt_DP_Name" Style="width: 25%; height: 20px" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">Department Manager:</td>
                <td style="direction: ltr">
                    <asp:DropDownList ID="Drp_DP_manager" Style="width: 25%" runat="server" AutoPostBack="True" DataSourceID="Managers" DataTextField="IN_Name" DataValueField="IN_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Managers" runat="server" SelectMethod="SelectAllManagers" TypeName="DepartmentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td>
                    <asp:Button ID="Insert" runat="server" Style="position: relative; left: 37px; top: 0px; width: 15%" Text="Insert" OnClick="Insert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>