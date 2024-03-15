<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Crimereporting.Master" CodeBehind="Officerform.aspx.vb" Inherits="FORMS.Officerform" %>
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
         
             <asp:Label ID="Label1" runat="server" Text="RANK"></asp:Label>
             <asp:TextBox ID="txtRANKO" runat="server" CssClass="styledTextbox" placeholder="Enter Rank"  required></asp:TextBox>
            
             <asp:Label ID="Label2" runat="server" Text="NAME"></asp:Label>
             <asp:TextBox ID="txtNAMEO" runat="server" CssClass="styledTextbox" placeholder="Enter Name"  required></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="TEAM" ></asp:Label>
            <asp:DropDownList ID="DDL3O" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

              <asp:Label ID="Label4" runat="server" Text="CIRCLE AREA" ></asp:Label>
            <asp:DropDownList ID="DDL1O" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label5" runat="server" Text="MOBILE NUMBER"></asp:Label>
            <asp:TextBox ID="txtMNO" runat="server" CssClass="styledTextbox" placeholder="Enter Phone Number"  required></asp:TextBox>

             <asp:Label ID="Label6" runat="server" Text="STATION NAME" ></asp:Label>
            <asp:DropDownList ID="DDL2O" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

              <asp:Label ID="Label7" runat="server" Text="EMAIL ID"></asp:Label>
            <asp:TextBox ID="txtEMAILO" runat="server" CssClass="styledTextbox" placeholder="Enter Email"  required></asp:TextBox>

            <hr />

            <asp:Button ID="BT1O" runat="server" Text="SUBMIT"  CssClass="registerbtn" />

            <br />
             <asp:GridView ID="GVO" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageIndex="3" PageSize="2" Width="400px">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
        </div>
    </div>
</asp:Content>
