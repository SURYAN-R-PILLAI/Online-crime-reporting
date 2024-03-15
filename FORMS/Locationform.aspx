<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Complainants.Master" CodeBehind="Locationform.aspx.vb" Inherits="FORMS.Locationform" %>
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
        <h3><b>LOCATION FORM</b></h3>
        <hr />
        <div class="inputfields">
         
             <asp:Label ID="Label1" runat="server" Text="LOCATION NAME"></asp:Label>
             <asp:TextBox ID="txtLNL" runat="server" CssClass="styledTextbox" placeholder="Enter Location"  required></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="STATE" ></asp:Label>
            <asp:DropDownList ID="DDL1L" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

            <asp:Label ID="Label3" runat="server" Text="DISTRICT" ></asp:Label>
            <asp:DropDownList ID="DDL2L" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label4" runat="server" Text="PINCODE"></asp:Label>
            <asp:TextBox ID="txtPINCODEL" runat="server" CssClass="styledTextbox" placeholder="Enter Pincode"  required></asp:TextBox>

             <asp:Label ID="Label5" runat="server" Text="CITY" ></asp:Label>
            <asp:DropDownList ID="DDL3L" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>
            <hr />

            <asp:Button ID="BT1L" runat="server" Text="SUBMIT"  CssClass="registerbtn" />

            <br />
            <br />
            <br />
             <asp:GridView ID="GVL" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageIndex="2" PageSize="2" Width="400px">
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
