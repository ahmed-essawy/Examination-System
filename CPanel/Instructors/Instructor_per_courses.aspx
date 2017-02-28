<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="Instructor_per_courses.aspx.cs" Inherits="CPanel_Instructors_Instructor_per_courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Instructor_per_courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
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
                    <asp:DropDownList ID="Course_DropList" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="CR_Name" DataValueField="CR_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
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
                    <asp:GridView ID="Instructors_GV" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Instructor ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("IN_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Instructor Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IN_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

