<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginForm.aspx.cs" Inherits="SpaNSalon.AdminLoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>Admin LogIn</title>
    <style>
        .banner_img {
            background-image: url(../Images/4.jpg);
            background-size: cover;
        }
        .rounded-ten {
            border-radius: 2rem !important;
        }
    </style>
</head>
<body class="banner_img">
    <form id="form1" runat="server">
        <section>
            <div class="container mt-5 pt-5 rounded-circle">
                <div class="row">
                    <div class="col-12 col-sm-8 col-md-5 m-auto">
                        <div class="card border-0 shadow rounded-ten" style="opacity: 85">
                            <asp:Image ImageUrl="~/BootIcon/icons/person-workspace.svg" CssClass="login100-form-avatar mx-auto my-4" Width="50" Height="50" runat="server" />
                            <div class="login100-form-title header text-center text-lg-center">
                                <h2>Admin Log In</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="card-body col-md-8 m-auto ">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Username" required></asp:TextBox>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control my-4 py-2 " placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                                    <div class="text-center">
                                        <asp:Button ID="btnLGN" CssClass="btn btn-light btn-outline-primary" runat="server" Text="Login" OnClick="btnLGN_Click" />
                                        <a href="AdminChangePassword.aspx" class="nav-link">Forgot Password? Click Here!</a>
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
