<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="ST_AnsVSmodelAns.aspx.cs" Inherits="CPanel_ST_AnsVSmodelAns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 67px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 67px">Student ID:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="col-xs-offset-0" Width="135px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DisplayAnswers">
                        <Columns>
                            <asp:TemplateField HeaderText="Student Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ST_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Exam ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EX_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Answer">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Correct Answer">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("QS_Correct") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="DisplayAnswers" runat="server" SelectMethod="Display_EX_ST_ANS_CorrAns" TypeName="StudentsLayer">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="ST_ID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 67px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

