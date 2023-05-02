<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dummy.aspx.cs" Inherits="SpaNSalon.Dummy1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        .banner-image {
            background-image: url("Images/2950241.png");
            background-size: cover;
        }

        .dull {
            --bs-bg-opacity: 0.75;
            background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
        }

        .bri {
            --bs-bg-opacity: 1;
            background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
        }

        .btn:hover {
            background-color: #90d6c5;
            color: black;
        }

        .new1 {
            margin-bottom: 10px;
        }

        .nda {
            transition: transform 0.2s ease;
        }

            .nda:hover {
                transform: scale(1.005);
                box-shadow: 0 1rem 3rem rgb(0, 247, 255, 0.35) !important;
            }

        .na .card:hover {
            transform: scale(1.12);
            background-color: azure;
            background-blend-mode: lighten;
            border-block-color: var(--bs-danger)
        }

        .nav-link:hover {
            color: var(--bs-success) !important;
        }

        .nav-link.active {
            color: black !important;
        }

        .na .card {
            transition: transform 0.2s ease;
        }

        .navbar-nav .nav-link {
            font: bold 18px arial,verdana;
        }

        .navbar-nav .active {
            font: bold 19px arial,verdana;
        }

        body {
            background-image: url("../Images/bg1.jpg");
            background-repeat: repeat;
            font-family: Dosis;
        }

        .blur {
            box-shadow: inset 0 0 2px #fefefed1;
            -webkit-backdrop-filter: saturate(200%) blur(30px);
            backdrop-filter: saturate(200%) blur(30px);
            background-color: hsla(,0%,100%,.8) !important;
        }

        .border-radius-xl {
            border-radius: .75rem
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light navbar-expand-lg alert-danger my-2 py-2 border-radius-xl fixed-top shadow-lg mx-2">
            <div class="container-fluid">
                <a class="navbar-brand" href="Index.aspx">
                    <img src="Images/icons/11.png" class="img-fluid " alt="" width="30" height="24" />
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link " aria-current="page" href="Index.aspx">
                            <asp:Label ID="Home" runat="server" Text="Home"></asp:Label></a>
                        <a class="nav-link active" href="Services.aspx">
                            <asp:Label ID="View" runat="server" Text="View Service"></asp:Label></a>
                        <a class="nav-link" href="Dash1.aspx">
                            <asp:Label ID="Label5" runat="server" Text="Dashboard"></asp:Label></a>
                    </div>
                    <div class="mx-auto"></div>
                    <div class="navbar-nav">
                        <a class="btn" href="LoginForm.aspx">
                            <img src="Feather/upload.svg" class="img-fluid" alt="LogIn" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Log In" /></a></li>
                        &nbsp;
                     <a class="btn " href="SignUpForm.aspx">
                         <img src="Feather/log-in.svg" alt="Sign Up" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Sign Up" />
                     </a>
                    </div>
                </div>
            </div>
        </nav>
    </form>
</body>
</html>
