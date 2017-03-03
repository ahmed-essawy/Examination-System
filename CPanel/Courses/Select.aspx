<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="CPanel_Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="CoursesTable" BorderWidth="2px" Caption="Courses" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Both" DataKeyNames=CR_ID>
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CR_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1" Text='<%# Bind("CR_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grade">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CR_Grade") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CR_Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="CoursesTable" runat="server" DeleteMethod="DeleteCourse" InsertMethod="InsertCourse" SelectMethod="SelectCourses" TypeName="CoursesLayer" UpdateMethod="UpdateCourse">
            <DeleteParameters>
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CR_Name" Type="String" />
                <asp:Parameter Name="CR_Grade" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CR_ID" Type="Int32" />
                <asp:Parameter Name="CR_Name" Type="String" />
                <asp:Parameter Name="CR_Grade" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>