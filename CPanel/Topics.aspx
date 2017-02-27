<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Topics.aspx.cs" Inherits="CPanel_Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="TopicsTable" AutoGenerateColumns="False" BorderWidth="2px" Caption="Topics" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Both" DataKeyNames="TP_ID,CR_ID">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TP_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TP_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteTopic" InsertMethod="InsertTopic" SelectMethod="SelectTopics" TypeName="TopicsLayer" UpdateMethod="UpdateTopic">
            <DeleteParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TP_Name" Type="String" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="TP_Name" Type="String" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="TopicsTable" runat="server" DeleteMethod="DeleteTopic" InsertMethod="InsertTopic" SelectMethod="SelectTopics" TypeName="TopicsLayer" UpdateMethod="UpdateTopic">
            <DeleteParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TP_Name" Type="String" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TP_ID" Type="Int32" />
                <asp:Parameter Name="TP_Name" Type="String" />
                <asp:Parameter Name="CR_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>