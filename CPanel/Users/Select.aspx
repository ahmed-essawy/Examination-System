<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="CPanel_Users" %>

<asp:content id="Content1" contentplaceholderid="Title" runat="Server">
    Users
</asp:content>
<asp:content id="Content2" contentplaceholderid="Content" runat="Server">
    <form runat="server">
        <asp:GridView ID=GridView1 runat="server" AutoGenerateColumns="False" DataSourceID="UsersTable" AllowSorting="True" DataKeyNames="Username">
            <Columns>
                <asp:TemplateField HeaderText="Username">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Bind('Username') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" type="password" Text="<%# Bind('Password') %>"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="**************"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="E-mail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text="<%# Bind('Email') %>"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text="<%# Bind('Email') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue="<%# Bind('Role') %>">
                            <asp:ListItem Value="administrator" Text="Administrator">Administrators</asp:ListItem>
                            <asp:ListItem Value="instructor" Text="Instructor">Instructors</asp:ListItem>
                            <asp:ListItem Value="student" Text="Student">Students</asp:ListItem>
                            <asp:ListItem Value="anonymous" Text="Anonymous">Anonymous</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text="<%# Bind('Role') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="MembersTable" DataTextField="Name" DataValueField="ID" SelectedValue="<%# Bind('Role_ID') %>">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="MembersTable" runat="server" SelectMethod="SelectAllMembers" TypeName="LoginLayer"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text="<%# Bind('Role_ID') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="UsersTable" runat="server" DeleteMethod="DeleteUser" SelectMethod="SelectAllUsers" TypeName="LoginLayer" UpdateMethod="UpdateUser" InsertMethod="AddUser">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Role" Type="String" />
                <asp:Parameter Name="Role_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:content>