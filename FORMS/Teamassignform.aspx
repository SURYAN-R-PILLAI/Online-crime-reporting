<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Crimereporting.Master" CodeBehind="Teamassignform.aspx.vb" Inherits="FORMS.Teamassignform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .styledTextbox,
    .styledDropdown {
        display: block;
        padding-left: 10px;
        border: 1px solid #ccc;
        font-size: 14px;
        height: 45px;
        width: 100%;
    }
        * {
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            display: flex;
            background: linear-gradient(to right, SlateBlue, MediumPurple, Turquoise);
            justify-content: center;
        }

        .container {
            max-width: 700px;
            margin: auto;
            padding: 20px;
            background-color: #e6e6ff;
            font-family: Helvetica;
        }

        input[type=text], input[type=email], input[type=password], input[type=tel] {
            display: block;
            padding-left: 10px;
            border: 1px solid #ccc;
            font-size: 14px;
            height: 45px;
            width: 100%;
            margin-bottom: 10px;
        }

        .inputfields {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 10px;
        }

        .registerbtn {
            background: linear-gradient(195deg, SlateBlue, MediumPurple, Turquoise);
            padding: 10px;
            width: 100%;
            color: white;
            border: none;
            cursor: pointer;
        }

        .registerbtn:hover {
            opacity: 50;
        }

        a {
            color: #1a1aff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <h3><b>OFFICERS DETAILS</b></h3>
        <hr />
        <div class="inputfields">
         
             <asp:Label ID="Label1" runat="server" Text="CIRCLE AREA"></asp:Label>
             <asp:TextBox ID="txtCAT" runat="server" CssClass="styledTextbox" placeholder="Enter Circle Area"  required></asp:TextBox>
            
             <asp:Label ID="Label2" runat="server" Text="COMPLAINANT NAME" ></asp:Label>
            <asp:DropDownList ID="DDL1T" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label3" runat="server" Text="TEAM HEAD"></asp:Label>
             <asp:TextBox ID="txtTHT" runat="server" CssClass="styledTextbox" placeholder="Enter Team Head"  required></asp:TextBox>

            <asp:Label ID="Label4" runat="server" Text="CITY" ></asp:Label>
            <asp:DropDownList ID="DDL2T" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label5" runat="server" Text="EMAIL"></asp:Label>
            <asp:TextBox ID="txtEMAILT" runat="server" CssClass="styledTextbox" placeholder="Enter Email"  required></asp:TextBox>

           
             <asp:Label ID="Label6" runat="server" Text="CONTACT NUMBER"></asp:Label>
            <asp:TextBox ID="txtCNT" runat="server" CssClass="styledTextbox" placeholder="Enter Contact Number"  required></asp:TextBox>

             
             
            <hr />

            <asp:Button ID="BT1T" runat="server" Text="SUBMIT"  CssClass="registerbtn" />

            <br />
        </div>
    </div>
</asp:Content>
