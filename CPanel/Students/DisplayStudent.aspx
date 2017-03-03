<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="DisplayStudent.aspx.cs" Inherits="CPanel_Wafaa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="width: 66px">&nbsp;</td>
                <td style="width: 59px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 66px">Student ID:</td>
                <td style="width: 59px">
                    <asp:TextBox ID="text_ST_ID" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="search_btn" runat="server" CssClass="col-xs-offset-0" OnClick="search_btn_Click" Text="Search" Width="183px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
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
                            <asp:TemplateField HeaderText="DP_Name">
                                <ItemTemplate>
                                    <asp:Label ID="DP_Name_des" runat="server" Text='<%# Bind("DP_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="DisplayStudent" runat="server" SelectMethod="SelectStudentById" TypeName="StudentsLayer">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="text_ST_ID" DefaultValue="0" Name="ST_ID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
</form>
</asp:Content>

