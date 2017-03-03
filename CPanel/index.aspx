<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="CPanel_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
        Welcome <%= Request.Cookies["UserInfo"]["Name"] %>
    </form>
</asp:Content>