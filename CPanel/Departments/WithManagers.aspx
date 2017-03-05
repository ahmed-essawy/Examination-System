<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="WithManagers.aspx.cs" Inherits="CPanel_Departments_WithManagers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Department Managers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Departments_Mang_Object">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DP_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Manager">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("IN_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="Departments_Mang_Object" runat="server" SelectMethod="SelectAllDepartments_MAngers" TypeName="DepartmentsLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>