<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Exams.aspx.cs" Inherits="CPanel_Student_Exams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Student Exams
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList Style="width: 50%; height: 30px" ID=DropDownList1 runat="server" AutoPostBack="True" DataSourceID="StudentsTable" DataTextField="ST_Name" DataValueField="ST_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="StudentsTable" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Exams">
            <Columns>
                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam ID">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EX_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam Date">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EX_Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="Exams" runat="server" SelectMethod="DisplayStudentExams" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="ST_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>