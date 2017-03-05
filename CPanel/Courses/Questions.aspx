<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="CPanel_Courses_SelectQuestionsWithCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Course Questions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="QuesWithCourse">
            <Columns>
                <asp:TemplateField HeaderText="Course ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CR_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Question ID">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("QS_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Questions">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("QS_Value") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="QuesWithCourse" runat="server" SelectMethod="SelectQuestionWithCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>