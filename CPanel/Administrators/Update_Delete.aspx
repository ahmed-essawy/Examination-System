<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Update_Delete.aspx.cs" Inherits="CPanel_Administrators_Select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Update & Delete Administrators
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="AdministratorTable" AutoGenerateColumns="False" BorderWidth="2px" Caption="Administrators" CaptionAlign="Top" CellPadding="10" CellSpacing="10" DataKeyNames=AD_ID>
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:Label ID="AD_ID_lbl_edit" runat="server" Text='<%# Bind("AD_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="AD_ID_lbl" runat="server" Text='<%# Bind("AD_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <div style="width: 100%;">
                            <asp:TextBox ID="AD_fname_txtbx" runat="server" Style="width: 49%; margin: 0; float: left;" Text='<%# Bind("AD_Fname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AD_FNAME_Vld" runat="server" ControlToValidate="AD_fname_txtbx" Display="Dynamic" ErrorMessage="Mudt Enter First Name"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="AD_Lname_txtbx" runat="server" Style="width: 49%; margin: 0;" Text='<%# Bind("AD_lname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="LName_vld" runat="server" ControlToValidate="AD_Lname_txtbx" Display="Dynamic" ErrorMessage="Lname Must be Entered"></asp:RequiredFieldValidator>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="AD_FName" runat="server" Text='<%# Bind("AD_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birthdate">
                    <EditItemTemplate>
                        <asp:TextBox ID="AD_BDate_txtbx" runat="server" Text='<%# Bind("AD_Bdate") %>' type="date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Bdate_vld" runat="server" ControlToValidate="AD_BDate_txtbx" Display="Dynamic" ErrorMessage="BirthDate is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="AD_Bdate_lbl" runat="server" Text='<%# Bind("AD_Bdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AD_phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AD_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AD_Salary") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AD_Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AD_Street") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("AD_Street") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("AD_City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AD_City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AD_Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AD_Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="AdministratorTable" runat="server" DeleteMethod="DeleteAdministrator" InsertMethod="InsertAdministrator" SelectMethod="SelectAllAdministrators" TypeName="AdministratorsLayer" UpdateMethod="UpdateAdministrator">
            <DeleteParameters>
                <asp:Parameter Name="AD_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AD_ID" Type="Int32" />
                <asp:Parameter Name="AD_Fname" Type="String" />
                <asp:Parameter Name="AD_Lname" Type="String" />
                <asp:Parameter Name="AD_Bdate" Type="String" />
                <asp:Parameter Name="AD_Phone" Type="String" />
                <asp:Parameter Name="AD_Salary" Type="Double" />
                <asp:Parameter Name="AD_Street" Type="String" />
                <asp:Parameter Name="AD_City" Type="String" />
                <asp:Parameter Name="AD_Country" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AD_ID" Type="Int32" />
                <asp:Parameter Name="AD_Fname" Type="String" />
                <asp:Parameter Name="AD_Lname" Type="String" />
                <asp:Parameter Name="AD_Bdate" Type="String" />
                <asp:Parameter Name="AD_Phone" Type="String" />
                <asp:Parameter Name="AD_Salary" Type="Double" />
                <asp:Parameter Name="AD_Street" Type="String" />
                <asp:Parameter Name="AD_City" Type="String" />
                <asp:Parameter Name="AD_Country" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>