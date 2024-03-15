<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Crimereporting.Master" CodeBehind="Firform.aspx.vb" Inherits="FORMS.Firform" %>
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
         
            <asp:Label ID="Label1" runat="server" Text="DISTRICT" ></asp:Label>
            <asp:DropDownList ID="DDL1F" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label2" runat="server" Text="STATION NAME" ></asp:Label>
            <asp:DropDownList ID="DDL2F" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

            <asp:Label ID="Label3" runat="server" Text="FIR REPORT"></asp:Label>
            <asp:TextBox ID="txtFRF" runat="server" CssClass="styledTextbox" placeholder="Description"  required Rows="4" TextMode="MultiLine"></asp:TextBox>

             <asp:Label ID="Label4" runat="server" Text="FIR DATE"></asp:Label>
            <asp:TextBox ID="txtFDF" runat="server" CssClass="styledTextbox" placeholder="Enter Fir Date"  required></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="PLACE OF OCCURENCE"></asp:Label>
            <asp:TextBox ID="txtPOF" runat="server" CssClass="styledTextbox" placeholder="Enter Place Of Occurence"  required></asp:TextBox>

           <asp:Label ID="Label6" runat="server" Text="IPC CODE(SECTION)"></asp:Label>
            <asp:TextBox ID="txtIPCF" runat="server" CssClass="styledTextbox" placeholder="Enter IPC Code"  required></asp:TextBox>

             <asp:Label ID="Label7" runat="server" Text="CRIME SUBJECT"></asp:Label>
            <asp:TextBox ID="txtCSF" runat="server" CssClass="styledTextbox" placeholder="Enter Crime Subject"  required></asp:TextBox>

            <asp:Label ID="Label8" runat="server" Text="MODE OF OPERATION"></asp:Label>
            <asp:TextBox ID="txtMOF" runat="server" CssClass="styledTextbox" placeholder="Enter Mode Of Operation"  required></asp:TextBox>

             <asp:Label ID="Label9" runat="server" Text="EVIDENCE"></asp:Label>
            <asp:TextBox ID="txtEVIDENCEF" runat="server" CssClass="styledTextbox" placeholder="Description"  required Rows="4" TextMode="MultiLine"></asp:TextBox>

              <asp:Label ID="Label10" runat="server" Text="COMPLAINANT NAME" ></asp:Label>
            <asp:DropDownList ID="DDL3F" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             <asp:Label ID="Label11" runat="server" Text="OFFICER NAME" ></asp:Label>
            <asp:DropDownList ID="DDL4F" runat="server" CssClass="styledDropdown" required AutoPostBack="True">
              <asp:ListItem Text="-- Select --" Value="" />
            </asp:DropDownList>

             
            <hr />

            <asp:Button ID="BT1F" runat="server" Text="SUBMIT"  CssClass="registerbtn" />

            <br />
              <asp:GridView ID="GVF" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageIndex="2" PageSize="2" Width="534px">
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
