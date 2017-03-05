<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="CorrectiveByDepartment.aspx.cs" Inherits="CPanel_CorrectiveByDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Corrective by Department
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" Style="width: 25%; height: 30px;" runat="server" AutoPostBack="True" DataSourceID="depts" DataTextField="DP_Name" DataValueField="DP_ID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="depts" runat="server" SelectMethod="SelectDP" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Corrective">
            <Columns>
                <asp:TemplateField HeaderText="Student ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ST_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam ID">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EX_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Student Grade">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Grade">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("CR_Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="Corrective" runat="server" SelectMethod="DisplaycorrectiveByDept" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="DP_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>