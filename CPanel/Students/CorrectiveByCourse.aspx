<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="CorrectiveByCourse.aspx.cs" Inherits="CPanel_CorrectiveByEX_ID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Corrective by course
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" Style="width: 25%; height: 30px;" runat="server" AutoPostBack="True" DataSourceID="Courses" DataTextField="CR_Name" DataValueField="CR_ID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="Courses" runat="server" SelectMethod="DisplayCR_IDs" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataSourceID="Corrective">
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
                <asp:TemplateField HeaderText="Student Grade">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Grade">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CR_Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="Corrective" runat="server" SelectMethod="DisplayCorrectiveByCR_ID" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CR_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>