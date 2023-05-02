<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSignupForm.aspx.cs" Inherits="SpaNSalon.AdminSignupForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Create New Admin</title>
    <style>
        .banner-image {
            background-image: url("Images/4.jpg");
            background-size: cover;
        }

        .dull {
            --bs-bg-opacity: 0.20;
            background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
        }

        .bri {
            --bs-bg-opacity: 0.85;
            background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
        }

        .btn:hover {
            background-color: #90d6c5;
            color: black;
        }
        .nav-link:hover {
            border:2px double antiquewhite;
            border-radius:1rem;
            background-color:rgb(160, 141, 141, 0.24);

        }
        .nav-link {
            transition:background ease-in 0.03s; 
        }
        .rounded-ten {
            border-radius: 4rem !important;
        }
    </style>
</head>
<body class="banner-image">
    <form id="form1" runat="server">
        <section>
            <div class="container mt-0 pt-4">
                <div class="row">
                    <div class="col-12 col-sm-8 col-md- m-auto">
                        <div class="card border-0 shadow rounded-ten">
                            <asp:Image ImageUrl="BootIcon/icons/person-plus.svg" CssClass="mx-auto my-4 img-fluid" Width="80" Height="80" runat="server" />
                            <div class="header text-center text-lg-center">
                                <h2>Sign Up</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="card-body col-md-10 m-auto ">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter First Name" TextMode="SingleLine" required></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Last Name" TextMode="SingleLine" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Username" required AutoPostBack="True" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                                    <div class="my-4">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter e-Mail" TextMode="Email" required></asp:TextBox>
                                        <span class="text-sm-start">
                                            <asp:RegularExpressionValidator CssClass="text-sm-start" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                                Display="Dynamic" EnableClientScript="true" ErrorMessage="Invalid email address" ValidationGroup="Sign" /></span>

                                    </div>
                                    <div class="my-4">
                                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Contact" TextMode="Number" required></asp:TextBox>
                                        <span class="fs-8">
                                            <asp:RangeValidator Display="Dynamic" ID="RangeValidator1" runat="server" ErrorMessage="Entered number is invalid! Please recheck and enter!" ForeColor="Red" ControlToValidate="txtContact" EnableClientScript="true" MaximumValue="9999999999" MinimumValue="6000000000" Type="Double"></asp:RangeValidator></span>

                                    </div>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                                    <div class="my-4">
                                        <asp:TextBox ID="txtPasswordConf" runat="server" CssClass="form-control my-4 py-2 " placeholder="Confirm Password" TextMode="Password" required></asp:TextBox>
                                        <span class="fs-8">
                                            <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" runat="server" ErrorMessage="Please enter correct password!" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConf" EnableClientScript="true" Operator="Equal"></asp:CompareValidator>
                                        </span>

                                    </div>
                                    <h4 class="text-center">Security Question : </h4>
                                    <span class="text-md-start">Where were you born?</span>
                                    <asp:TextBox ID="txtSecurity" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Answer" TextMode="Password" required></asp:TextBox>
                                    <div class="text-center">
                                        <asp:Button ID="btnSgnUp" CssClass="btn btn-lg btn-light btn-outline-primary" runat="server" Text="Sign Up" OnClick="btnSgnUp_Click" />
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
