<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="Generate_Exam.aspx.cs" Inherits="CPanel_Generate_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="Server">
        <table>
            <tr>
                <td>Course</td>
                <td>
                    <asp:DropDownList ID=CR_ID runat="server" Style="width: 250px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>MCQ Number</td>
                <td>
                    <asp:DropDownList ID=MCQ_Num runat="server" Style="width: 250px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>T/F Number</td>
                <td>
                    <asp:DropDownList ID=TF_Num runat="server" Style="width: 250px" Enabled="False"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID=Generate runat="server" Text="Generate" /></td>
            </tr>
        </table>
    </form>
</asp:Content>