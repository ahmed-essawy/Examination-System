<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="CPanel_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <asp:GridView ID=GridView1 runat="server" DataSourceID="StudentsTable">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="StudentsTable" Height="50px" style="z-index: 1; width: 125px; height: 61px; position: absolute; top: 223px; left: 250px" Width="125px">
        </asp:DetailsView>
    <asp:ObjectDataSource ID="StudentsTable" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
</form>
</asp:Content>