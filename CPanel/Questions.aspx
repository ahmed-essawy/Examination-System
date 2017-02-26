<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="CPanel_Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <asp:GridView ID=GridView1 runat="server" AutoGenerateColumns="False" DataSourceID="QuestionsTable" BorderWidth="2px" Caption="Questions" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Bind('QS_ID') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Question">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text="<%# Bind('QS_Value') %>" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="<%# Bind('QS_Value') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text="<%# Bind('QS_Type') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Correct Answer">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text="<%# Bind('QS_Correct') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grade">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" Style="width: 30px; text-align: center;" runat="server" Text="<%# Bind('QS_Grade') %>"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text="<%# Bind('QS_Grade') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answers">
                    <ItemTemplate>
                        <asp:GridView ID=GridView2 runat="server" AutoGenerateColumns="False" DataSourceID="ChoicesTable" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Choices">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text="<%# Bind('Choice') %>"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ChoicesTable" runat="server" SelectMethod="SelectChoices" TypeName="ChoicesLayer">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" DefaultValue="0" Name="QS_ID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="QuestionsTable" runat="server" DeleteMethod="DeleteQuestion" SelectMethod="SelectAllQuestions" TypeName="QuestionsLayer" UpdateMethod="UpdateQuestion">
            <DeleteParameters>
                <asp:Parameter Name="QS_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="QS_ID" Type="Int32" />
                <asp:Parameter Name="QS_Value" Type="String" />
                <asp:Parameter Name="QS_Grade" Type="Int32" />
                <asp:Parameter Name="QS_Correct" Type="String" />
                <asp:Parameter Name="QS_Type" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>