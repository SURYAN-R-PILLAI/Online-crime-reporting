<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Loginform.aspx.vb" Inherits="FORMS.Loginform1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // $('.message a').click(function () {
            //     $('form').animate({ height: "toggle", opacity: "toggle" }, "slow");
            // });
        });
    </script>
    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;

        }

        .form label {
            display: inline-block;
            margin-bottom: 15px;
            vertical-align: middle;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #43A047;
        }

        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }


        body {
            background: #76b852;
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

       
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
   <div class="login-page">
            <div class="form">
                <div class="login-form">
                     <div>
        <label>
            <asp:RadioButton ID="RBLUSER" runat="server" GroupName="RBLOGIN"  />
            USER
        </label>
        <label>
            <asp:RadioButton ID="RBLPOLICE" runat="server" GroupName="RBLOGIN"  />
            POLICE
        </label>
    </div>
                    <asp:TextBox ID="txtEMAILO" runat="server" placeholder="Email" />
                    <asp:TextBox ID="txtPASSLO" runat="server" TextMode="Password" placeholder="Password" />
                    <asp:Button ID="bt1LO" runat="server" Text="LOGIN" OnClick="bt1LO_Click" BackColor="#33CC33" ForeColor="Black" />
                    <p class="message">
                        <asp:LinkButton ID="LB1" runat="server" ForeColor="#33CC33">Forgot Password</asp:LinkButton>
                    </p>
                    <p class="message">New User? <asp:LinkButton ID="LB2" runat="server" ForeColor="#33CC33">Create new account</asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
