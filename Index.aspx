    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SpaNSalon.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/icons/white1.png" />
    <title>Vercetti Spa</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.typekit.net/ddx1owz.css" />
    <script src="Scripts/bootstrap.js"></script>
    <style>
        .nav-link:hover 
        {
            background-color: rgb(255, 255, 255, 0.25) !important;
            border-radius: 25px 25px !important;
        }
        
        .nav-link.active 
        {
            color:antiquewhite !important;
            
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
               
        .dull {
            --bs-bg-opacity: 0.98;
            background-color: rgb(239, 98, 98, 0.98) !important;
        }

        .bri {
            --bs-bg-opacity: 1;
            background-color: rgb(228, 52, 52) !important;
        }

        .btn:hover {
            background-color: #90d6c5;
            color: black;
        }

        .new1 {
            margin-bottom: 10px;
        }

        .marle {
            margin-left: 62%;
        }

        .name1 .card:hover {
            transform: scale(1.12);
        }

        .name1 .card {
            transition: transform 0.2s ease;
        }

        .border-radius-xl {
            border-radius: .75rem
        }

        .blur {
            box-shadow: inset 0 0 2px #fefefed1;
            -webkit-backdrop-filter: saturate(200%) blur(30px);
            backdrop-filter: saturate(200%) blur(30px);
            background-color: hsla(0,0%,100%,.8) !important
        }

            .blur.saturation-less {
                -webkit-backdrop-filter: saturate(20%) blur(30px);
                backdrop-filter: saturate(20%) blur(30px)
            }

        body {
            background-image: url("../Images/bg1.jpg");
            background-repeat: repeat;
            background-size:contain;
            font-family: Dosis;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-expand-lg navbar-dark dull alert-danger fixed-top shadow-lg my-2 py-2 start-0 end-0 mx-5 border-radius-xl top-0">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Index.aspx">
                        <img src="Images/icons/11.png" alt="" width="30" height="24" />
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" aria-current="page" href="#">
                                <asp:Label ID="Label1" runat="server" Text="Home"></asp:Label></a>
                            <a class="nav-link" href="Services.aspx">
                                <asp:Label ID="Label3" runat="server" Text="View Service"></asp:Label></a>
                            
                            <a class="nav-link" href="Dash1.aspx">
                                <asp:Label ID="Label5" runat="server" Text="Dashboard"></asp:Label></a>
                        </div>
                        <div class="mx-auto"></div>
                        <div class="navbar-nav">
                            <a class="btn text-nowrap" href="LoginForm.aspx">
                                <img src="Feather/upload.svg" class="img-fluid" alt="LogIn" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Log In" /></a></li>
                        &nbsp;
                     <a class="btn text-nowrap" href="SignUpForm.aspx">
                         <img src="Feather/log-in.svg" alt="Sign Up" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Sign Up" />
                     </a>
                        </div>
                    </div>
                </div>
            </nav>

        </div>
        <div id="carouselExampleFade" class="carousel slide carousel-fade shadow-lg" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Images/1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <img src="Images/2.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <img src="Images/3.jpg" class="d-block w-100" alt="..." />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container-fluid ">
            <div class="card rounded  border-primary shadow" style="margin-top: 20px">
                <div class="d-flex">
                    <h3 class="me-auto p-2 ">Our Services:</h3>
                    <asp:Button ID="Serv" runat="server" Text="View More" CssClass="btn btn-info shadow-lg m-1 p-2" OnClick="Serv_Click" />
                </div>
                <div class="name1">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="service_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                        <LayoutTemplate>
                            <div class="d-flex flex-wrap">
                                <div id="ItemPlaceholder" runat="server"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="name1 card m-2" style="width: 18rem;">
                                <img src="<%# Eval("img_loc") %>"" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">

                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Text="Book Now!" CssClass="btn btn-light btn-outline-danger mt-2 marle" CommandName="Select"/>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            <div class="name1 card m-2" style="width: 18rem;">
                                <img src="<%# Eval("img_loc") %>"" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">

                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Text="Selected!" CssClass="btn btn-light btn-outline-danger mt-2 marle disabled" />
                                    </p>
                                </div>
                            </div>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT TOP 6 * FROM [servicesMst]"></asp:SqlDataSource>
                </div>
                <div class="container-fluid d-flex justify-content-end">
                </div>
            </div>
        </div>

        <div class="container-fluid" style="margin-top: 10px;">
            <div class="card rounded border-primary shadow">
                <div class="card-body">
                    <div class="container-fluid ">
                        <h1 class="d-flex justify-content-center">About Us!
                        </h1>
                        <p class="lh-base text-center">
                            Getting everything home is the trend of the new generation. Why should spa and salon services should be at one specific location?
                            <br />
                            Vercetti Services is designed to provide Spa services at home with the online booking system. Here an end customer can create their account and book a service in available areas.
                            <br />
                            The user(s) can navigate to the booking page either from the index or select a service specifically from the Service page. Each user can keep track of their availed services. They can also see the employee who provided them the service.

                        </p>
                        <hr class="rounded-pill my-5" style="border: 0.2rem solid blue" />
                        <div class="row">
                            <div class="col-2">
                                <img src="Images/ashura.jpg" alt="Prashant Singh" class="img-fluid" />
                            </div>
                            <div class="col-4 lh-lg">
                                !asgdh jasgdjghasj das dxj hgashgd kjahsgdkj hgajshgd kjagskdjgh asjkghd kjasgd ad
                                asghdgf ah fdj hashgahgkjdaghs jdghakshgd kjagkshdgk jasghkdgaskdg as
                                asd afjsghdfjashfjd gasjhgdj agsdja
                            </div>
                            <div class="col-2">
                                <img src="Images/indra.jpeg" alt="Prashant Singh" class="img-fluid" />
                            </div>
                            <div class="col-4 lh-lg">
                                !asgdh jasgdjghasj das dxj hgashgd kjahsgdkj hgajshgd kjagskdjgh asjkghd kjasgd ad
                                asghdgf ah fdj hashgahgkjdaghs jdghakshgd kjagkshdgk jasghkdgaskdg as
                                asd afjsghdfjashfjd gasjhgdj agsdja
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="d-flex flex-wrap card-footer bg-light justify-content-between align-items-center py-3 my-4 border-top">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                    <img src="Images/icons/1.png" class="bi" width="30" height="24" />
                </a>
                <b><span>© 2022 Vercetti Services</span></b>
            </div>

            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-3"><a class="text-muted" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">
                    <img class="bi" width="24" height="24" src="Feather/twitter.svg" /></a></li>
                <li class="ms-3"><a class="text-muted" href="#">
                    <img class="bi" width="24" height="24" src="Feather/instagram.svg" /></a></li>
                <li class="ms-3"><a class="text-muted" href="#">
                    <img class="bi" width="24" height="24" src="Feather/facebook.svg"></a></li>
            </ul>
        </footer>
    </form>

    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script>
        var nav = document.querySelector('nav');
        window.addEventListener('scroll', function () {
            if (window.pageYOffset > 10) {
                nav.classList.remove('dull', 'shadow');
                nav.classList.add('bri', 'shadow');
            }
            else {
                nav.classList.add('dull', 'shadow');
                nav.classList.remove('bri', 'shadow');
            }
        })
    </script>
</body>
</html>
