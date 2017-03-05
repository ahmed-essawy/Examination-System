<%@ Page Title="" Language="C#" MasterPageFile="~/CPanel/MP/anonymous.master" AutoEventWireup="true" CodeFile="Solve.aspx.cs" Inherits="CPanel_Questions_Exams_Solve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Test
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <style>
        .Label-Style {
            width: 100%;
            display: block;
        }

        label {
            max-width: calc(100% - 25px);
        }

        input[type=radio] {
            margin: 0;
            width: 25px;
            vertical-align: middle;
        }

        .right_col tr:first-of-type {
            background-color: transparent;
        }

        .Radio-Style {
        }

        #form1 span::before {
            content: "";
            display: block;
            margin: 20px 0;
            border-bottom: 2px solid black;
        }

        .auto-style1 {
            position: absolute;
            top: 157px;
            left: 250px;
        }
    </style>
    <form id="form1" runat="server">
        <asp:Label ID=MSG runat="server" Text="" Font-Bold="True" Font-Overline="False" Font-Size="18px" ForeColor="Black"></asp:Label>
    </form>
</asp:Content>