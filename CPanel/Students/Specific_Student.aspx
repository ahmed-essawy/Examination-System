<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Specific_Student.aspx.cs" Inherits="CPanel_Wafaa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Students
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList Style="width: 50%; height: 30px" ID=DropDownList1 runat="server" AutoPostBack="True" DataSourceID="StudentsTable" DataTextField="ST_Name" DataValueField="ST_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="StudentsTable" runat="server" SelectMethod="SelectAllStudents" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DisplayStudent">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="ST_ID_des" runat="server" Text='<%# Bind("ST_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="ST_Name_des" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age">
                    <ItemTemplate>
                        <asp:Label ID="ST_Age_des" runat="server" Text='<%# Bind("ST_Age") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate>
                        <asp:Label ID="ST_phone_des" runat="server" Text='<%# Bind("ST_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <ItemTemplate>
                        <asp:Label ID="ST_Salary_des" runat="server" Text='<%# Bind("ST_Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street">
                    <ItemTemplate>
                        <asp:Label ID="ST_Street_des" runat="server" Text='<%# Bind("ST_Street") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="ST_City_des" runat="server" Text='<%# Bind("ST_City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label ID="ST_Country_des" runat="server" Text='<%# Bind("ST_Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JoinDate">
                    <ItemTemplate>
                        <asp:Label ID="ST_JoinDate_des" runat="server" Text='<%# Bind("ST_JoinDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department">
                    <ItemTemplate>
                        <asp:Label ID="DP_Name_des" runat="server" Text='<%# Bind("DP_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DisplayStudent" runat="server" SelectMethod="SelectStudentById" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="ST_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>