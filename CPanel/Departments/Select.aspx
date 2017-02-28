<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/Admin.master" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="CPanel_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Departments
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="DepartmentObject" BorderWidth="2px" Caption="Departments" CaptionAlign="Top" CellPadding="10" CellSpacing="10">
        </asp:GridView>
        <asp:ObjectDataSource ID="DepartmentObject" runat="server" DeleteMethod="DeleteDepartment" InsertMethod="InsertDepartment" SelectMethod="SelectAllDepartments_MAngers" TypeName="DepartmentsLayer" UpdateMethod="UpdateDepartment">
            <DeleteParameters>
                <asp:Parameter Name="DP_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DP_Name" Type="String" />
                <asp:Parameter Name="DP_Manager" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DP_ID" Type="Int32" />
                <asp:Parameter Name="DP_Name" Type="String" />
                <asp:Parameter Name="DP_Manager" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>