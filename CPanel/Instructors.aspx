<%@ Page Title="" Language="VB" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="false" CodeFile="Instructors.aspx.vb" Inherits="CPanel_Instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="StudentObject">
    </asp:GridView>
    <asp:ObjectDataSource ID="StudentObject" runat="server" SelectMethod="SelectAllInstructors" TypeName="InstructorsLayer"></asp:ObjectDataSource>
</form>
</asp:Content>

