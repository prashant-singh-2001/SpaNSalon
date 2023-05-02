<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="SpaNSalon.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/icons/white1.png" />
    <title>Services</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
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
           
            background-color: rgb(255, 255, 255, 0.25) !important;
            border-radius: 25px 25px !important;
        }

        .nav-link.active {
            color: antiquewhite !important;
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

        .bri {
            --bs-bg-opacity: 1;
            background-color: rgb(228, 52, 52) !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
                <nav class="navbar navbar-dark navbar-expand-lg bri fixed-top shadow-lg my-2 py-2 start-0 end-0 mx-2 border-radius-xl top-0">
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
           
        </div>
        <div class="container-fluid blur" style="margin-top:70px">
            <div class="card nda rounded border-primary shadow" style="margin-top: 20px">
                <div class="d-flex">
                    <h3 class="me-auto p-2 ">Massages:</h3>
                </div>
                <div class="na">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="service_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                        <LayoutTemplate>
                            <div class="d-flex flex-wrap">
                                <div id="ItemPlaceholder" runat="server"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="card m-4" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="serid" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Text="Book Now!" CommandName="Select" CssClass="btn btn-light btn-outline-danger mt-2 marle"/>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                         <SelectedItemTemplate>
                            <div class="card m-3 alert-primary" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="serid" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                    </p>
                                </div>
                            </div>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [servicesMst] WHERE [TYPE] = 'Massage'"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="container-fluid ">
            <div class="card rounded nda border-primary shadow" style="margin-top: 20px">
                <div class="d-flex">
                    <h3 class="me-auto p-2 ">Hair Colouring:</h3>
                </div>
                <div class="na">
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="service_id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ListView2_SelectedIndexChanged">
                        <LayoutTemplate>
                            <div class="d-flex flex-wrap">
                                <div id="ItemPlaceholder" runat="server"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class=" card m-4" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Text="Book Now!" CommandName="Select" CssClass="btn btn-light btn-outline-danger mt-2 marle" />
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                         <SelectedItemTemplate>
                            <div class="na card m-4 bg-primary" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                    </p>
                                </div>
                            </div>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [servicesMst] WHERE [TYPE] = 'Colour Service'"></asp:SqlDataSource>
            </div>
        </div>
        <div class="container-fluid ">
            <div class="card rounded nda border-primary shadow" style="margin-top: 20px">
                <div class="d-flex">
                    <h3 class="me-auto p-2 ">Hair Dressing:</h3>
                </div>
                <div class="na">
                    <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="service_id" OnSelectedIndexChanged="ListView3_SelectedIndexChanged">
                        <LayoutTemplate>
                            <div class="d-flex flex-wrap">
                                <div id="ItemPlaceholder" runat="server"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="card m-4" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:LinkButton ID="btnLV3" runat="server" CommandName="Select" CssClass="btn btn-light btn-outline-danger mt-2 marle" >Select</asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            <div class="card m-4 bg-primary" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                    </p>
                                </div>
                            </div>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [servicesMst] WHERE [TYPE] = 'Hair Dressing'"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="container-fluid ">
            <div class="card rounded nda border-primary shadow" style="margin-top: 20px">
                <div class="d-flex">
                    <h3 class="me-auto p-2 ">Waxing:</h3>
                </div>
                <div class="na">
                    <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4" DataKeyNames="service_id" OnSelectedIndexChanged="ListView4_SelectedIndexChanged">
                        <LayoutTemplate>
                            <div class="d-flex flex-wrap">
                                <div id="ItemPlaceholder" runat="server"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="card m-4" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:LinkButton ID="btnLV3" runat="server" CommandName="Select" CssClass="btn btn-light btn-outline-danger mt-2 marle" >Select</asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            <div class="card m-4 bg-primary" style="width: 18rem;">
                                <img src="<%# Eval("img_loc")%>" class="card-img-top " alt="...">
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Eval("service_id")%>'>   
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_name")%>'>   
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price")%>'>   
                                        </asp:Label>
                                        <br />
                                    </p>
                                </div>
                            </div>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [servicesMst] WHERE [TYPE] = 'Waxing'"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
