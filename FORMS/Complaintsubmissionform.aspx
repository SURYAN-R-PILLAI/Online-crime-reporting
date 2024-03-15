<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Complainants.Master" CodeBehind="Complaintsubmissionform.aspx.vb" Inherits="FORMS.Complaintsubmissionform" %>
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
        <h3><b>COMPLAINT SUBMISSION FORM</b></h3>
        <hr />
        <div class="inputfields">
         
             <asp:Label ID="Label3" runat="server" Text="COMPLAINANT NAME"></asp:Label>
            <asp:DropDownList ID="DDL1C" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label4" runat="server" Text="EMAIL"></asp:Label>
            <asp:TextBox ID="txtEMAILC" runat="server" CssClass="styledTextbox" placeholder="Enter Email Name" TextMode="Email" required></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="PHONE NUMBER"></asp:Label>
            <asp:TextBox ID="txtPHNOC" runat="server" CssClass="styledTextbox" placeholder="Enter Contact Number" required></asp:TextBox>

            <asp:Label ID="Label6" runat="server" Text="FULL NAME"></asp:Label>
            <asp:TextBox ID="txtFNC" runat="server" CssClass="styledTextbox" placeholder="Enter Full Name"  required></asp:TextBox>

            <asp:Label ID="Label8" runat="server" Text="SUBJECT"></asp:Label>
            <asp:TextBox ID="txtSUBJECTC" runat="server" CssClass="styledTextbox" placeholder="Enter Subject" required></asp:TextBox>

            <asp:Label ID="Label9" runat="server" Text="PLACE OF OCCURRENCE"></asp:Label>
            <asp:TextBox ID="txtPOC" runat="server" CssClass="styledTextbox" placeholder="Place Of Occurrence"  required></asp:TextBox>

            <asp:Label ID="Label10" runat="server" Text="DATE OF OCCURRENCE"></asp:Label>
            <asp:TextBox ID="txtDOC" runat="server" CssClass="styledTextbox" placeholder="Date Of Occurrence"  required></asp:TextBox>
             
            <asp:Label ID="Label11" runat="server" Text="POLICE STATION"></asp:Label>
            <asp:TextBox ID="txtPSC" runat="server" CssClass="styledTextbox" placeholder="Enter Police Station"  required></asp:TextBox>

            <asp:Label ID="Label12" runat="server" Text="LOCATION" ></asp:Label>
            <asp:DropDownList ID="DDL2C" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>
            
            <asp:Label ID="Label13" runat="server" Text="DESCRIPTION"></asp:Label>
            <asp:TextBox ID="txtDESCRIPTIONC" runat="server" CssClass="styledTextbox" placeholder="Description"  required Rows="4" TextMode="MultiLine"></asp:TextBox>

            <hr />

            <asp:Button ID="BT1C" runat="server" Text="SUBMIT"  CssClass="registerbtn" />

            <br />
        </div>
    </div>
</asp:Content>