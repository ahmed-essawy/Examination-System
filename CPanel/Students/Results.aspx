<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="CPanel_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Resaults
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td style="width: 67px">&nbsp;</td>
                <td style="width: 105px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 67px">Student ID:</td>
                <td style="width: 105px">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="col-xs-offset-0"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Results">
                        <Columns>
                            <asp:TemplateField HeaderText="Student Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CR_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course Grade">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CR_Grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Grade">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="Results" runat="server" SelectMethod="DisplayResults" TypeName="StudentsLayer">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="ST_ID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 67px">&nbsp;</td>
                <td style="width: 105px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>