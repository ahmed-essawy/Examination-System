<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Avg_Grade.aspx.cs" Inherits="CPanel_Courses_Display_Course_With_AVG_Grade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" Width="1008px">
            <Columns>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AVG Grade">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AVG_Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Courses_with_AVG_Grade" TypeName="CoursesLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>