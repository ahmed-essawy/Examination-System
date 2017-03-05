<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="PerCourse.aspx.cs" Inherits="CPanel_Questions_PerCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Questions Per Course
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Course_Object" DataTextField="Cr_Name" DataValueField="Cr_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="Course_Object" runat="server" SelectMethod="SelectCourse_ID" TypeName="QuestionsLayer"></asp:ObjectDataSource>
        <asp:GridView ID=GridView1 runat="server" AutoGenerateColumns="False" DataSourceID="QuestionsTable" BorderWidth="2px" Caption="Questions" CaptionAlign="Top" CellPadding="10" CellSpacing="10" DataKeyNames=QS_ID>
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Bind('QS_ID') %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text="<%# Bind('CR_Name') %>"></asp:Label>
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
                <asp:HyperLinkField DataNavigateUrlFields="QS_ID" DataNavigateUrlFormatString="Choices/Select.aspx?id={0}" HeaderText="Choices" Text="View" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="QuestionsTable" runat="server" DeleteMethod="DeleteQuestion" SelectMethod="SelectCourseQuestions" TypeName="QuestionsLayer" UpdateMethod="UpdateQuestion">
            <DeleteParameters>
                <asp:Parameter Name="QS_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="CR_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="QS_ID" Type="Int32" />
                <asp:Parameter Name="QS_Value" Type="String" />
                <asp:Parameter Name="QS_Grade" Type="Int32" />
                <asp:Parameter Name="QS_Type" Type="String" />
                <asp:Parameter Name="QS_Correct" Type="String" />
                <asp:Parameter Name="CR_Name" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>