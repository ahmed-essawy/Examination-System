<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Insert_Question.aspx.cs" Inherits="CPanel_Insert_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>Course</td>
                <td>
                    <asp:DropDownList ID=DropDownList1 runat="server" DataSourceID="CoursesTable" DataTextField="CR_Name" DataValueField="CR_Name" Style="width: 100%"></asp:DropDownList>
                    <asp:ObjectDataSource ID="CoursesTable" runat="server" SelectMethod="SelectAllCourses" TypeName="QuestionsLayer"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>Question</td>
                <td>
                    <asp:TextBox ID=TextBox1 runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Type</td>
                <td>
                    <asp:DropDownList ID=DropDownList2 runat="server" Style="width: 100%" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>MCQ</asp:ListItem>
                        <asp:ListItem>T/F</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr id=MCQ>
                <td>Answer 1</td>
                <td>
                    <asp:TextBox ID=TextBox2 runat="server"></asp:TextBox></td>
                <asp:DropDownList ID=DropDownList3 runat="server"></asp:DropDownList>
            </tr>
            <tr id=MCQ>
                <td>Answer 2</td>
                <td>
                    <asp:TextBox ID=TextBox3 runat="server"></asp:TextBox></td>
            </tr>
            <tr id=MCQ>
                <td>Answer 3</td>
                <td>
                    <asp:TextBox ID=TextBox4 runat="server"></asp:TextBox></td>
            </tr>
            <tr id=MCQ>
                <td>Answer 4</td>
                <td>
                    <asp:TextBox ID=TextBox5 runat="server"></asp:TextBox></td>
            </tr>
        </table>
    </form>
</asp:Content>