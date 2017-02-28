<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="DisplayTopicsPerCourse.aspx.cs" Inherits="DisplayTopicsPerCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="CR_Name" Height="24px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="1059px">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
        <br />
        <asp:GridView ID="TP_Names" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" style="margin-right: 0px" Width="1057px">
            <Columns>
                <asp:TemplateField HeaderText="Topic Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectTopics" TypeName="TopicsLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>

