<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Update_Delete_Topics.aspx.cs" Inherits="CPanel_Insert_Update_Delete_Topics_per_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">

        <asp:DropDownList ID="cr_name" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="CR_Name" DataValueField="CR_ID" Height="25px" Width="1261px" AppendDataBoundItems="True">
            <asp:ListItem>Coose Course Name</asp:ListItem>
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectCourses" TypeName="CoursesLayer"></asp:ObjectDataSource>
        <br />
        <asp:GridView ID="tp_names" runat="server" AutoGenerateColumns="False" Width="1265px" DataKeyNames="TP_ID,CR_ID" DataSourceID="TopicsTable">
            <Columns>
                <asp:TemplateField HeaderText="Topic Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TP_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="TopicsTable" runat="server" DeleteMethod="DeleteTopic" SelectMethod="SelectTopics_Course" TypeName="TopicsLayer" UpdateMethod="UpdateTopic">
            <DeleteParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="cr_name" DefaultValue="0" Name="CR_ID" PropertyName="SelectedValue" Type="Int32" />
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