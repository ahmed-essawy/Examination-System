<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Generate_Exam.aspx.cs" Inherits="CPanel_Generate_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="Server">
        <table>
            <tr>
                <td>Course</td>
                <td>
                    <asp:DropDownList ID=CR_ID runat="server" Style="width: 250px" DataSourceID="CoursesTable" DataTextField="CR_Name" DataValueField="CR_Name"></asp:DropDownList>
                    <asp:ObjectDataSource ID="CoursesTable" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>MCQ Number</td>
                <td>
                    <asp:DropDownList ID=MCQ_Num runat="server" Style="width: 250px">
                        <asp:ListItem Value="0">0 MCQ &amp; 10 T/F</asp:ListItem>
                        <asp:ListItem Value="1">1 MCQ &amp; 9 T/F</asp:ListItem>
                        <asp:ListItem Value="2">2 MCQ &amp; 8 T/F</asp:ListItem>
                        <asp:ListItem Value="3">3 MCQ &amp; 7 T/F</asp:ListItem>
                        <asp:ListItem Value="4">4 MCQ &amp; 6 T/F</asp:ListItem>
                        <asp:ListItem Value="5">5 MCQ &amp; 5 T/F</asp:ListItem>
                        <asp:ListItem Value="6">6 MCQ &amp; 4 T/F</asp:ListItem>
                        <asp:ListItem Value="7">7 MCQ &amp; 3 T/F</asp:ListItem>
                        <asp:ListItem Value="8">8 MCQ &amp; 2 T/F</asp:ListItem>
                        <asp:ListItem Value="9">9 MCQ &amp; 1 T/F</asp:ListItem>
                        <asp:ListItem Value="10">10 MCQ &amp; 0 T/F</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID=Affected_Rows runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Button ID=Generate runat="server" Text="Generate" OnClick="Generate_Click" /></td>
            </tr>
        </table>
    </form>
</asp:Content>