<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="CPanel_Questions_Exams_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Exams
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:DropDownList ID=DropDownList1 Style="width: 20%; height: 30px;" runat="server" DataSourceID="ExamsTable" DataTextField="EX_ID" DataValueField="EX_ID"></asp:DropDownList>
        <asp:ObjectDataSource ID="ExamsTable" runat="server" SelectMethod="SelectExamsForStudent" TypeName="ExamsLayer">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ST_ID" SessionField="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
        <asp:Button ID=Start runat="server" Style="width: 20%; height: 30px;" Text="Start Exam" OnClick="Start_Click" />
    </form>
</asp:Content>