<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="By_Date.aspx.cs" Inherits="CPanel_ExamByDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Exams by date
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList Style="width: 50%; height: 30px" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="DisplayExamDates" DataTextField="Date" DataValueField="Date">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="DisplayExamDates" runat="server" SelectMethod="DisplayAllExamsDates" TypeName="StudentsLayer"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DisplayExamsByDate">
            <Columns>
                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Student ID">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ST_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam ID">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EX_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam Date">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DisplayExamsByDate" runat="server" SelectMethod="DisplayExamByDate" TypeName="StudentsLayer">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Date" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>