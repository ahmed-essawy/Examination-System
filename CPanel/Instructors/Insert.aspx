<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="CPanel_Instructors_Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">

        <table style="width: 98%;">
            <tr>
                <td style="width: 139px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="New Instructor Info"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">ID:</td>
                <td>
                    <asp:TextBox ID="txt_IN_ID" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 35px; width: 139px">FirstName:</td>
                <td style="height: 35px">
                    <asp:TextBox ID="txt_IN_Fname" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td style="height: 35px"></td>
            </tr>
            <tr>
                <td style="width: 139px">LastName:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Lname" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">BirthDate:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Bdate" Style="width: 50%" Type="date" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Phone:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Phone" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Salary:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Salary" Style="width: 50%" Type="money" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Street:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Street" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">City:</td>
                <td>
                    <asp:TextBox ID="txt_IN_City" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">Country:</td>
                <td>
                    <asp:TextBox ID="txt_IN_Country" Style="width: 50%" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">DP Name:</td>
                <td>
                    <asp:DropDownList ID="DP_Name_drop" runat="server" AutoPostBack="True" Style="width: 50%; height: 42px" OnSelectedIndexChanged="DP_Name_drop_SelectedIndexChanged" Width="236px" BackColor="White" DataSourceID="Departments" DataTextField="DP_Name" DataValueField="DP_ID">
                    </asp:DropDownList>

                    <asp:ObjectDataSource ID="Departments" runat="server" SelectMethod="SelectDP" TypeName="StudentsLayer"></asp:ObjectDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">DP ID:</td>
                <td>
                    <asp:TextBox ID="txt_DP_ID" Style="width: 50%" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 139px">&nbsp;</td>
                <td>
                    <asp:Button ID="Insert" runat="server" Text="Insert" Style="position: relative; left: 143px; top: 0px; width: 241px" OnClick="Insert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>