<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="CPanel_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DepartmentObject">
            <Columns>
                <asp:TemplateField HeaderText="DP_ID">
                    <EditItemTemplate>
                        <asp:Label ID="DP_ID_LBL_Edit" runat="server" Text='<%# Bind("DP_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DP_ID_lbl" runat="server" Text='<%# Bind("DP_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DP_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="DP_Name_txtbx" runat="server" Text='<%# Bind("DP_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DP_Name_vld" runat="server" ControlToValidate="DP_Name_txtbx" Display="Dynamic" ErrorMessage="Department Name Redquired"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DP_Name" runat="server" Text='<%# Bind("DP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DP_Manager">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DP_Manager_Edit" runat="server" DataSourceID="SqlDataSource1" DataTextField="IN_Name" DataValueField="IN_ID" SelectedValue='<%# Bind("DP_Manager") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLProjectConnectionString2 %>" SelectCommand="SELECT [IN_ID], [IN_Name] FROM [Instructors]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="DP_MAnager_vld" runat="server" ControlToValidate="DP_Manager_Edit" Display="Dynamic" ErrorMessage="Department manger is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Dp_Manager_lbl" runat="server" Text='<%# Bind("DP_Manager") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DepartmentObject" runat="server" DeleteMethod="DeleteDepartment" InsertMethod="InsertDepartment" SelectMethod="SelectAllDepartments" TypeName="DepartmentsLayer" UpdateMethod="UpdateDepartment">
            <DeleteParameters>
                <asp:Parameter Name="DP_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DP_Name" Type="String" />
                <asp:Parameter Name="DP_Manager" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DP_ID" Type="Int32" />
                <asp:Parameter Name="DP_Name" Type="String" />
                <asp:Parameter Name="DP_Manager" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>

