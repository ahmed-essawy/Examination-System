<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="CPanel_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <asp:GridView ID=GridView1 runat="server" DataSourceID="StudentsTable">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        </asp:GridView>
    <asp:ObjectDataSource ID="StudentsTable" runat="server" SelectMethod="SelectAllCourses" TypeName="StudentsLayer"></asp:ObjectDataSource>
</form>
</asp:Content>