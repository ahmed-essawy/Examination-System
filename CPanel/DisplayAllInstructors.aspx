﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/CPanel.master" AutoEventWireup="true" CodeFile="DisplayAllInstructors.aspx.cs" Inherits="CPanel_DisplayAllInstructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView2" runat="server" DataSourceID="Instructors_DataSource1" BorderWidth="2px" Caption="Instructors" CaptionAlign="Top" CellPadding="10" CellSpacing="10" GridLines="Both">
        </asp:GridView>
        <asp:ObjectDataSource ID="Instructors_DataSource1" runat="server" SelectMethod="SelectInstructors_DepName" TypeName="InstructorsLayer"></asp:ObjectDataSource>
    </form>
</asp:Content>