<%@ Page Title="" Language="VB" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="false" CodeFile="Instructors.aspx.vb" Inherits="CPanel_Instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="StudentObject" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="In_ID">
                <EditItemTemplate>
                    <asp:Label ID="in_id_lbl_edit" runat="server" Text='<%# Bind("In_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="IN_ID_lbl" runat="server" Text='<%# Bind("IN_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IN_FName">
                <EditItemTemplate>
                    <asp:TextBox ID="IN_fname_txtbx" runat="server" Text='<%# Bind("In_fname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="IN_FName" runat="server" Text='<%# Bind("In_fname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IN_LName">
                <EditItemTemplate>
                    <asp:TextBox ID="IN_Lname_txtbx" runat="server" Text='<%# Bind("In_lname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="IN_Lname_lbl" runat="server" Text='<%# Bind("In_Lname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IN_BDate">
                <EditItemTemplate>
                    <asp:TextBox ID="IN_BDate_txtbx" runat="server" Text='<%# Bind("IN_Bdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="IN_Bdate_lbl" runat="server" Text='<%# Bind("IN_Bdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IN_Phone"></asp:TemplateField>
            <asp:TemplateField HeaderText="IN_Salary"></asp:TemplateField>
            <asp:TemplateField HeaderText="IN_Street"></asp:TemplateField>
            <asp:TemplateField HeaderText="IN_City"></asp:TemplateField>
            <asp:TemplateField HeaderText="IN_Country"></asp:TemplateField>
            <asp:TemplateField HeaderText="DP_ID"></asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="StudentObject" runat="server" SelectMethod="SelectAllInstructors" TypeName="InstructorsLayer" DeleteMethod="DeleteInstructor" InsertMethod="InsertInstructor" UpdateMethod="UpdateInstructor">
        <DeleteParameters>
            <asp:Parameter Name="IN_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IN_ID" Type="Int32" />
            <asp:Parameter Name="IN_Fname" Type="String" />
            <asp:Parameter Name="IN_Lname" Type="String" />
            <asp:Parameter Name="IN_Bdate" Type="String" />
            <asp:Parameter Name="IN_Phone" Type="String" />
            <asp:Parameter Name="IN_Salary" Type="Double" />
            <asp:Parameter Name="IN_Street" Type="String" />
            <asp:Parameter Name="IN_City" Type="String" />
            <asp:Parameter Name="IN_Country" Type="String" />
            <asp:Parameter Name="DP_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IN_ID" Type="Int32" />
            <asp:Parameter Name="IN_Fname" Type="String" />
            <asp:Parameter Name="IN_Lname" Type="String" />
            <asp:Parameter Name="IN_Bdate" Type="String" />
            <asp:Parameter Name="IN_Phone" Type="String" />
            <asp:Parameter Name="IN_Salary" Type="Double" />
            <asp:Parameter Name="IN_Street" Type="String" />
            <asp:Parameter Name="IN_City" Type="String" />
            <asp:Parameter Name="IN_Country" Type="String" />
            <asp:Parameter Name="DP_ID" Type="Int32" />
        </UpdateParameters>
        </asp:ObjectDataSource>
</form>
</asp:Content>

