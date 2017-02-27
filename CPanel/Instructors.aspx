<%@ Page Title="" Language="VB" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="false" CodeFile="Instructors.aspx.vb" Inherits="CPanel_Instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="InstructorTable" AutoGenerateColumns="False" BorderWidth="2px" Caption="Instructors" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Both" DataKeyNames=IN_ID>
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:Label ID="in_id_lbl_edit" runat="server" Text='<%# Bind("In_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="IN_ID_lbl" runat="server" Text='<%# Bind("IN_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <div style="width: 100%;">
                            <asp:TextBox ID="IN_fname_txtbx" runat="server" Style="width: 49%; margin: 0; float: left;" Text='<%# Bind("IN_Fname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="IN_FNAME_Vld" runat="server" ControlToValidate="IN_fname_txtbx" Display="Dynamic" ErrorMessage="Mudt Enter First Name"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="IN_Lname_txtbx" runat="server" Style="width: 49%; margin: 0;" Text='<%# Bind("In_lname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="LName_vld" runat="server" ControlToValidate="IN_Lname_txtbx" Display="Dynamic" ErrorMessage="Lname Must be Entered"></asp:RequiredFieldValidator>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="IN_FName" runat="server" Text='<%# Bind("IN_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birthdate">
                    <EditItemTemplate>
                        <asp:TextBox ID="IN_BDate_txtbx" runat="server" Text='<%# Bind("IN_Bdate") %>' type="date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Bdate_vld" runat="server" ControlToValidate="IN_BDate_txtbx" Display="Dynamic" ErrorMessage="BirthDate is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="IN_Bdate_lbl" runat="server" Text='<%# Bind("IN_Bdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IN_phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("IN_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IN_Salary") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("IN_Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IN_Street") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("IN_Street") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IN_City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("IN_City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("IN_Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("IN_Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="DepartementsTable" DataTextField="DP_Name" DataValueField="DP_ID" SelectedValue='<%# Bind("DP_ID") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="DepartementsTable" runat="server" SelectMethod="SelectAllDepartments" TypeName="DepartmentsLayer"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("DP_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="InstructorTable" runat="server" DeleteMethod="DeleteInstructor" InsertMethod="InsertInstructor" SelectMethod="SelectAllInstructors" TypeName="InstructorsLayer" UpdateMethod="UpdateInstructor">
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