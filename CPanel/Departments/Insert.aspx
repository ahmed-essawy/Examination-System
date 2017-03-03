<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_Departments_Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
     <table style="width:100%;">
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">New Department Info</td>
                <td>
                    <asp:Label ID="msg" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">Department Name:</td>
                <td>
                    <asp:TextBox ID="txt_DP_Name" style="width:50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">Department Manager:</td>
                <td>
                    <asp:DropDownList ID="Drp_DP_manager" style="width:50%"  runat="server" AutoPostBack="True" DataSourceID="Managers" DataTextField="IN_Name" DataValueField="IN_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="Managers" runat="server" SelectMethod="SelectAllDepartments_MAngers" TypeName="DepartmentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td>
                    <asp:Button ID="Insert" runat="server" style="position: relative; left: 37px; top: 0px; width: 34%" Text="Insert" OnClick="Insert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
     </form>
</asp:Content>

