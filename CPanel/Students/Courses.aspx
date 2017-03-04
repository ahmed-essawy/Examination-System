<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="CPanel_DisplayStudentCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Students
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList Style="width: 50%; height: 30px" ID=DropDownList1 runat="server" AutoPostBack="True" DataSourceID="StudentsTable" DataTextField="ST_Name" DataValueField="ST_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="StudentsTable" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DisplayCourses" Width="73px">
            <Columns>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DisplayCourses" runat="server" SelectMethod="DisplayStudentCourses" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="ST_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>