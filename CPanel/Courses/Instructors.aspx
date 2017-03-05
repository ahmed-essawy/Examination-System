<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Instructors.aspx.cs" Inherits="CPanel_Instructors_Instructor_per_courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Course Instructors
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form2" runat="server">
        <asp:DropDownList ID="CR_Names" runat="server" DataSourceID="ObjectDataSource2" DataTextField="CR_Name" Height="24px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="1059px" AutoPostBack="True" DataValueField="CR_ID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="InstructorsTable">
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
        <asp:ObjectDataSource ID="InstructorsTable" runat="server" SelectMethod="SelectInstructor_Courses" TypeName="InstructorsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="CR_Names" DefaultValue="0" Name="cr_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>