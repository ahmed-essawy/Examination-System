<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="DisplayAllInstructors.aspx.cs" Inherits="CPanel_DisplayAllInstructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                    <asp:Label ID="ins_Data" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#003366" style="z-index: 1; top: 122px; left: 622px; width: 329px; right: 92px; height: 48px; position: absolute; margin-top: 0px;" Text="Instructors Data"></asp:Label>
                    </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="Instructors_DataSource1">
                </asp:GridView>
                <asp:ObjectDataSource ID="Instructors_DataSource1" runat="server" SelectMethod="SelectInstructors_DepName" TypeName="InstructorsLayer"></asp:ObjectDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>
</asp:Content>

