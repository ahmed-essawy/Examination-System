<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Instructor_per_courses.aspx.cs" Inherits="CPanel_Instructors_Instructor_per_courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 200px; height: 96px"></td>
                <td style="height: 96px"></td>
                <td style="height: 96px"></td>
            </tr>
            <tr>
                <td style="width: 200px; height: 11px">Select Course</td>
                <td style="height: 11px">
                    <asp:DropDownList ID="Course_DropList" runat="server" AutoPostBack="True" DataSourceID="Courses_DataSource1" DataTextField="CR_Name" DataValueField="CR_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Courses_DataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLProjectConnectionString %>" SelectCommand="SELECT [CR_ID], [CR_Name] FROM [Courses]"></asp:SqlDataSource>
                </td>
                <td style="height: 11px"></td>
            </tr>
            <tr>
                <td style="width: 200px; height: 35px"></td>
                <td style="height: 35px"></td>
                <td style="height: 35px"></td>
            </tr>
            <tr>
                <td style="width: 200px">&nbsp;</td>
                <td>
                    <asp:GridView ID="Instructors_GV" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

