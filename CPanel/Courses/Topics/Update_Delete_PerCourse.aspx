<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Update_Delete_PerCourse.aspx.cs" Inherits="CPanel_Insert_Update_Delete_Topics_per_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Update & Delete Per Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList Style="width: 50%; height: 30px" ID=DropDownList1 runat="server" AutoPostBack="True" DataSourceID="CoursesTable" DataTextField="CR_Name" DataValueField="CR_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="CoursesTable" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
        <asp:GridView ID=GridView1 runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="TopicsTable" DataKeyNames="TP_ID,CR_ID">
            <Columns>
                <asp:TemplateField HeaderText="Topic">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text="<%# Bind('TP_Name') %>"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="<%# Bind('TP_Name') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="TopicsTable" runat="server" DeleteMethod="DeleteTopic" SelectMethod="SelectTopics_Course" TypeName="TopicsLayer" UpdateMethod="UpdateTopic">
            <DeleteParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="CR_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="TP_Name" Type="String" />
                <asp:Parameter Name="CR_Name" Type="String" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>