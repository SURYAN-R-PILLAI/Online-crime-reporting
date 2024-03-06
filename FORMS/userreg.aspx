<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="userreg.aspx.vb" Inherits="FORMS.userreg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script>
        $(document).ready(function () {

            var Validation = (function () {
                var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var digitReg = /^\d+$/;

                var isEmail = function (email) {
                    return emailReg.test(email);
                };
                var isNumber = function (value) {
                    return digitReg.test(value);
                };
                var isRequire = function (value) {
                    return value == "";
                };
                var countChars = function (value, count) {
                    return value.length == count;
                };
                var isChecked = function (el) {
                    var hasCheck = false;
                    el.each(function () {
                        if ($(this).prop('checked')) {
                            hasCheck = true;
                        }
                    });
                    return hasCheck;
                };
                return {
                    isEmail: isEmail,
                    isNumber: isNumber,
                    isRequire: isRequire,
                    countChars: countChars,
                    isChecked: isChecked
                };
            })();

            var required = $('form').find('[data-required]');
            var numbers = $('form').find('[data-number]');
            var emails = $('form').find('[data-email]');
            var once = $('form').find('[data-once]');
            var radios = $('.form-item-triple');
            var groups = [];
            radios.each(function () {
                groups.push($(this).find('[data-once]'));
            });
            var counts = $('form').find('[data-count]');

            $('#submit').on('click', function () {
                required.each(function () {
                    if (Validation.isRequire($(this).val())) {
                        $(this).siblings('small.errorReq').show();
                    }
                });
                emails.each(function () {
                    if (!Validation.isEmail($(this).val())) {
                        $(this).siblings('small.errorEmail').show();
                    }
                });
                $.each(groups, function () {
                    if (!Validation.isChecked($(this))) {
                        $(this).parents('.form-item').find('small.errorOnce').show();
                    }
                });
                numbers.each(function () {
                    if (!Validation.isNumber($(this).val())) {
                        $(this).siblings('small.errorNum').show();
                    }
                });
                counts.each(function () {
                    if (!Validation.countChars($(this).val(), $(this).data('count'))) {
                        $(this).siblings('small.errorChar').show();
                    }
                });
            });

            required.on('keyup blur', function () {
                if (!Validation.isRequire($(this).val())) {
                    $(this).siblings('small.errorReq').hide();
                }
            });
            emails.on('keyup blur', function () {
                if (Validation.isEmail($(this).val())) {
                    $(this).siblings('small.errorEmail').hide();
                }
            });
            once.on('change', function () {
                $.each(groups, function (i) {
                    if (Validation.isChecked(groups[i])) {
                        groups[i].parents('.form-item').find('small.errorOnce').hide();
                    }
                });
            });
            numbers.on('keyup blur', function () {
                if (Validation.isNumber($(this).val())) {
                    $(this).siblings('small.errorNum').hide();
                }
            });
            counts.on('keyup blur', function () {
                if (Validation.countChars($(this).val(), $(this).data('count'))) {
                    $(this).siblings('small.errorChar').hide();
                }
            });

        });
    </script>    
    <style>
        @import url('https://fonts.googleapis.com/css?family=PT+Sans:400,700');
        html {
            font-size: 10px;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            box-sizing: border-box;
        }

        *, *:before, *:after {
            margin: 0;
            padding: 0;
            box-sizing: inherit;
        }

        body {
            font-family: 'PT Sans', sans-serif;
            font-size: 16px;
            line-height: 1.428571429;
            font-weight: 400;
            color: #fff;
        }

        .row {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .section {
            background-color: #3D4067;
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        header,
        main,
        footer {
            display: block;
            position: relative;
            z-index: 1;
        }

        header {
            padding: 48px;
            @media (max-width: 440px) {
                padding: 48px 24px;
            }

            >h3 {
                font-size: 44px;
                font-weight: 700;
                margin-bottom: 8px;
            }

            >h4 {
                font-size: 22px;
                font-weight: 400;
                letter-spacing: 1px;
            }
        }

        main {
            flex: 1;
            padding: 0 48px;
            @media (max-width: 440px) {
                padding: 0 24px;
            }
        }

        footer {
            width: 100%;
            background-color: #524F81;
            padding: 16px;
            align-self: center;
            text-align: center;
            margin-top: 32px;

            a {
                color: #fff;
                font-weight: 700;
                text-decoration: none;

                &:hover {
                    text-decoration: underline;
                }
            }
        }

        form {
            height: 100%;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        .label {
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
        }

        small {
            display: none;

            &.errorOnce {
                margin-top: 2px;
            }
        }

        .form-item {
            input[type="text"],
            input[type="number"],
            input[type="email"] {
                display: block;
                color: #E2E3E8;
                font-size: 16px;
                width: 100%;
                background-color: transparent;
                border: none;
                border-bottom: 1px solid #75759E;
                padding: 8px 0;
                appearance: none;
                outline: none;
            }

            input[type="password"] {
                display: block;
                color: #E2E3E8;
                font-size: 16px;
                width: 100%;
                background-color: transparent;
                border: none;
                border-bottom: 1px solid #75759E;
                padding: 8px 0;
                appearance: none;
                outline: none;
            }

            select {
                display: block;
                color: #E2E3E8;
                font-size: 16px;
                width: 100%;
                background-color: transparent;
                border: none;
                border-bottom: 1px solid #75759E;
                padding: 8px 0;
                appearance: none;
                outline: none;
            }

            small {
                /*letter-spacing: 1px;*/
            }

            i {
                font-size: 12px;
                color: red;
            }
        }

        .box-item {
            height: 60px;
            margin-bottom: 16px;
        }

        .form-item-double {
            display: flex;

            .form-item {
                flex: 1 1 auto;
            }

            .form-item:nth-child(1) {
                padding-right: 16px;
            }

            .form-item:nth-child(2) {
                padding-left: 16px;
            }
        }

        .form-item-triple {
            display: flex;
            align-items: center;
            padding-top: 6px;

            .radio-label {
                flex: 1 1 auto;
                text-align: left;

                label {
                    display: inline-block;
                    vertical-align: middle;
                }
            }

            .form-item {
                flex: 3 1 auto;
                text-align: center;
                margin: 0;

                label, input[type="radio"] {
                    display: inline-block;
                    vertical-align: middle;
                    margin: 0 4px;
                }
            }
        }

        ::-webkit-input-placeholder {
            /* WebKit, Blink, Edge */
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
        }

        :-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
            opacity: 1;
        }

        ::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
            opacity: 1;
        }

        :-ms-input-placeholder {
            /* Internet Explorer 10-11 */
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
        }

        ::-ms-input-placeholder {
            /* Microsoft Edge */
            color: rgba(226, 227, 232, .75);
            font-size: 16px;
        }

        .submit {
            display: inline-block;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: 1px;
            padding: 8px 48px;
            margin-top: 32px;
            border: 2px solid #75759E;
            border-radius: 20px;
            cursor: pointer;
            transition: all ease .2s;

            &:hover {
                background-color: #EDA261;
                border: 2px solid #EDA261;
            }
        }

        .wave {
            position: absolute;
            top: 0;
            left: 50%;
            width: 800px;
            height: 800px;
            margin-top: -600px;
            margin-left: -400px;
            background: #252E45;
            border-radius: 40%;
            animation: shift 20s infinite linear;
            z-index: 0;
        }

        @keyframes shift {
            from {
                transform: rotate(360deg);
            }
        }
    </style>


</head>
<body>
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="row">
                <section class="section">
                    <header>
                        <h3>Register</h3>
                        <h4>Please fill your information below</h4>
                    </header>
                    <main>
                        <asp:Panel ID="Panel1" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtFNU" placeholder="First Name" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel17" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtLNU" placeholder="Last Name" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtEMAILU" placeholder="Email" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                            <small class="errorEmail"><i class="fa fa-asterisk" aria-hidden="true"></i> email is not valid</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel15" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtPHNOU" placeholder="Phone Number" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                            <small class="errorNum"><i class="fa fa-asterisk" aria-hidden="true"></i> must be a number</small>
                            <small class="errorChar"><i class="fa fa-asterisk" aria-hidden="true"></i> must be 10 digits</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel19" runat="server" CssClass="form-item">
                                <asp:TextBox runat="server" ID="txtDOBU" placeholder="DOB" CssClass="form-item" />
                                <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                                <small class="errorNum"><i class="fa fa-asterisk" aria-hidden="true"></i> must be a number</small>
                            </asp:Panel>
                        <asp:Panel ID="Panel20" runat="server" CssClass="form-item">
                                <asp:TextBox runat="server" ID="txtAADHARU" placeholder="Aadhar Number" CssClass="form-item" />
                                <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                                <small class="errorNum"><i class="fa fa-asterisk" aria-hidden="true"></i> must be a number</small>
                            </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" CssClass="form-item box-item">
                            <asp:Panel ID="Panel4" runat="server" CssClass="form-item-triple">
                                <div class="radio-label">
                                    <label class="label">Gender</label>
                                </div>
                                <asp:Panel ID="Panel5" runat="server" CssClass="form-item">
                                    <asp:RadioButton runat="server" ID="RB1USER" Text="Male" GroupName="RB" CssClass="radio" />
                                    </asp:Panel>
                                <asp:Panel ID="Panel6" runat="server" CssClass="form-item">
                                    <asp:RadioButton runat="server" ID="RB2USER" Text="Female" GroupName="RB" CssClass="radio" />
                                </asp:Panel>
                            </asp:Panel>
                            <small class="errorOnce"><i class="fa fa-asterisk" aria-hidden="true"></i> choose at least one</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel7" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtHNU" placeholder="House Name" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel21" runat="server" CssClass="form-item">
                            <asp:DropDownList runat="server" ID="DDL3U" CssClass="form-item" AppendDataBoundItems="true" AutoPostBack="True">
                                <asp:ListItem Text="-- Select State --" Value="" />
                            </asp:DropDownList>
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel22" runat="server" CssClass="form-item">
                            <asp:DropDownList runat="server" ID="DDL1U" CssClass="form-item" AppendDataBoundItems="true" AutoPostBack="True">
                                <asp:ListItem Text="-- Select District --" Value="" />
                            </asp:DropDownList>
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel23" runat="server" CssClass="form-item">
                            <asp:DropDownList runat="server" ID="DDL2U" CssClass="form-item" AppendDataBoundItems="true" AutoPostBack="True">
                                <asp:ListItem Text="-- Select City --" Value="" />
                            </asp:DropDownList>
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel8" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtPINCODEU" placeholder="Pincode" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                            <small class="errorNum"><i class="fa fa-asterisk" aria-hidden="true"></i> must be a number</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel9" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtPASSU" TextMode="Password" placeholder="Password" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                        </asp:Panel>
                        <asp:Panel ID="Panel10" runat="server" CssClass="form-item box-item">
                            <asp:TextBox runat="server" ID="txtCPASSU" TextMode="Password" placeholder="Confirm Password" CssClass="form-item" />
                            <small class="errorReq"><i class="fa fa-asterisk" aria-hidden="true"></i> required field</small>
                            <small class="errorMatch"><i class="fa fa-asterisk" aria-hidden="true"></i> passwords do not match</small>
                        </asp:Panel>
                        
                        <asp:Panel ID="Panel16" runat="server" CssClass="form-item">
                            <asp:Button runat="server" ID="BTN1U" Text="Submit" CssClass="submit" />
                        </asp:Panel>
                    </main>
                    <footer>
                        <p>Already have an account? <a href="Loginform.aspx">Login here</a></p>
                    </footer>
                    <i class="wave"></i>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>

