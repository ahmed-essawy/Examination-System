<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="CPanel_ST_UPDATE_INSERT_DELETE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Student" Width="517px" AllowPaging="True" AllowSorting="True" Style="margin-right: 70px" Height="330px">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_ID_edit" runat="server" Text='<%# Bind("ST_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_ID_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_ID_des" runat="server" Text='<%# Bind("ST_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <div style="width: 140px">
                            <asp:TextBox ID="ST_FName_edit" placeHolder="First name" runat="server" Text='<%# Bind("ST_Fname") %>' style="width: 48%; margin: 0;"></asp:TextBox>
                            <asp:TextBox ID="ST_LName_edit" placeHolder="Last name" runat="server" Text='<%# Bind("ST_Lname") %>' style="width: 48%; margin: 0;"></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_FName_insert" runat="server" placeHolder="First name" style="width: 48%; margin: 0;" Text='<%# Bind("ST_Fname") %>'></asp:TextBox>
                        <asp:TextBox ID="ST_LName_insert" runat="server" placeHolder="Last name" style="width: 48%; margin: 0;" Text='<%# Bind("ST_Lname") %>'></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Name_des" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_Age_edit" runat="server" Text='<%# Bind("ST_Age") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_Bdate_insert" PlaceHolder="Enter Student Birth Date" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Age_des" runat="server" Text='<%# Bind("ST_Age") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_Phone_edit" runat="server" Text='<%# Bind("ST_Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_Phone_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Phone_des" runat="server" Text='<%# Bind("ST_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_Salary_edit" runat="server" Text='<%# Bind("ST_Salary") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_Salary_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Salary_des" runat="server" Text='<%# Bind("ST_Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_Street_edit" runat="server" Text='<%# Bind("ST_Street") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_Street_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Street_des" runat="server" Text='<%# Bind("ST_Street") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_City_edit" runat="server" Text='<%# Bind("ST_City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_City_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_City_des" runat="server" Text='<%# Bind("ST_City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_Country_edit" runat="server" Text='<%# Bind("ST_Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ST_Country_insert" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_Country_des" runat="server" Text='<%# Bind("ST_Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JoinDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_JoinDate_edit" runat="server" Text='<%# Bind("ST_JoinDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_JoinDate_des" runat="server" Text='<%# Bind("ST_JoinDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DP_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="ST_DP_Name_edit" runat="server" Text='<%# Bind("DP_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DP_Name_drop" runat="server">
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ST_DP_Name_edit" runat="server" Text='<%# Bind("DP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>

        <asp:ObjectDataSource ID="Student" runat="server" DeleteMethod="DeleteStudent" InsertMethod="InsertStudent" SelectMethod="SelectAllStudents" TypeName="StudentsLayer" UpdateMethod="UpdateStudent">
            <DeleteParameters>
                <asp:Parameter Name="ST_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ST_ID" Type="Int32" />
                <asp:Parameter Name="ST_Fname" Type="String" />
                <asp:Parameter Name="ST_Lname" Type="String" />
                <asp:Parameter Name="ST_Bdate" Type="String" />
                <asp:Parameter Name="ST_Phone" Type="String" />
                <asp:Parameter Name="ST_Salary" Type="Decimal" />
                <asp:Parameter Name="ST_Street" Type="String" />
                <asp:Parameter Name="ST_City" Type="String" />
                <asp:Parameter Name="ST_Country" Type="String" />
                <asp:Parameter Name="DP_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ST_ID" Type="Int32" />
                <asp:Parameter Name="ST_Fname" Type="String" />
                <asp:Parameter Name="ST_Lname" Type="String" />
                <asp:Parameter Name="ST_Bdate" Type="String" />
                <asp:Parameter Name="ST_Phone" Type="String" />
                <asp:Parameter Name="ST_Salary" Type="Decimal" />
                <asp:Parameter Name="ST_Street" Type="String" />
                <asp:Parameter Name="ST_City" Type="String" />
                <asp:Parameter Name="ST_Country" Type="String" />
                <asp:Parameter Name="DP_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>

