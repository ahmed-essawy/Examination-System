<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="Instructors_Salary.aspx.cs" Inherits="CPanel_Instructor_Salaries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Instructors salary
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BorderWidth="2px" Caption="Instructors salary" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Both">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="IN_Name_lbl" runat="server" Text='<%# Bind("IN_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <ItemTemplate>
                        <asp:Label ID="IN_Salary" runat="server" Text='<%# Bind("IN_Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectInstructorSalaries" TypeName="InstructorsLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>