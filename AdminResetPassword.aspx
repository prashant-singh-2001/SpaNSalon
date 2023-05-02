<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminResetPassword.aspx.cs" Inherits="SpaNSalon.AdminResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Admin Reset Password</title>
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
    </style>
</head>
<body class="banner-image">
    <form id="form1" runat="server">
        <section>
            <div class="container mt-5 pt-5">
                <div class="row">
                    <div class="col-12 col-sm-8 col-md-5 m-auto">
                        <div class="card border-0 shadow">
                            <asp:Image ImageUrl="Feather/gitlab.svg" CssClass="mx-auto my-4" Width="80" Height="80" runat="server" />
                            <div class="header text-center text-lg-center">
                                <h2>Provide new password</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="card-body col-md-8 m-auto ">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                                    <asp:TextBox ID="txtPasswordConf" runat="server" CssClass="form-control my-4 py-2 " placeholder="Confirm Password" TextMode="Password" required></asp:TextBox>
                                    <div class="text-center">
                                        <asp:Button ID="btnResetPassword" CssClass="btn btn-light btn-outline-primary" runat="server" Text="Change Password" OnClick="btnResetPassword_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
