<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Insert_Question.aspx.cs" Inherits="CPanel_Insert_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <table style="width: 50%;">
            <tr>
                <td>Course</td>
                <td>
                    <asp:DropDownList ID=CR_Name runat="server" DataSourceID="CoursesTable" DataTextField="CR_Name" DataValueField="CR_Name" Style="width: 100%"></asp:DropDownList>
                    <asp:ObjectDataSource ID="CoursesTable" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>Question</td>
                <td>
                    <asp:TextBox ID=QS_Value runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Type</td>
                <td>
                    <asp:DropDownList ID=QS_Type runat="server" Style="width: 100%" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>MCQ</asp:ListItem>
                        <asp:ListItem>T/F</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label1 runat="server" Text="Answer 1"></asp:Label></td>
                <td>
                    <asp:TextBox ID=QS_Answer1 runat="server"></asp:TextBox>
                    <asp:DropDownList ID=QS_Answer runat="server" Style="width: 100%" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Visible="False">
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:DropDownList></td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label2 runat="server" Text="Answer 2"></asp:Label></td>
                <td style="direction: ltr">
                    <asp:TextBox ID=QS_Answer2 runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label3 runat="server" Text="Answer 3"></asp:Label></td>
                <td>
                    <asp:TextBox ID=QS_Answer3 runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Label4 runat="server" Text="Answer 4"></asp:Label></td>
                <td>
                    <asp:TextBox ID=QS_Answer4 runat="server"></asp:TextBox></td>
            </tr>
            <tr>
            <tr>
                <td>
                    <asp:Label ID=Label5 runat="server" Text="Correct Answer"></asp:Label></td>
                <td>
                    <asp:TextBox ID=QS_Correct runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID=Button1 runat="server" Text="Submit" OnClick="Insert_Click" /></td>
            </tr>
        </table>
    </form>
</asp:Content>