<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash1.aspx.cs" Inherits="SpaNSalon.Dummy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
            .back {
                background: url(../Images/bgdash2.jpg);
                background-repeat: repeat;
                background-size:cover;
                background-blend-mode: saturation;
                background-position: top;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="Content/dashboard.css" rel="stylesheet" />
    <title>User DashBoard</title>
</head>
<body class="back">
    <form id="form1" runat="server">
        <div>
            <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
                <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Vercetti Services</a>
                <button class="navbar-toggler position-absolute d-md-none collapsed" style="margin-right: 30px" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <asp:Label ID="name" runat="server" CssClass="fs-3 form-control form-control-dark w-100 text-center" Text="DashBoard" aria-label="Label"></asp:Label>
                
                <div class="navbar-nav">

                    <div class="nav-item text-nowrap">

                        <asp:LinkButton ID="logout" runat="server" class="nav-link px-3" OnClick="logout_Click"><span data-feather="log-out"></span></asp:LinkButton>
                    </div>
                </div>
            </header>
            <div class="container-fluid">
                <div class="row">
                    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                        <div class="position-sticky pt-3">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">
                                        <span data-feather="at-sign"></span>
                                        <asp:Label ID="unit" runat="server"></asp:Label>

                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">
                                        <span data-feather="user"></span>
                                        <asp:Label ID="nami" runat="server"></asp:Label>

                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">
                                        <span data-feather="navigation"></span>
                                        <asp:Label CssClass="col-form-label" ID="mil" runat="server"></asp:Label>

                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="Index.aspx">
                                        <span data-feather="home"></span>
                                        Home            

                                    </a>
                                </li>


                            </ul>
                        </div>
                    </nav>

                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        
                        <h2>Services Availed: </h2>
                        
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                                <div class="table-responsive my-5 text-center">
                                    <table class="table table-striped fs-5">
                                        <thead class="text-danger fs-4">
                                            <tr>
                                                <th scope="col">Service Name</th>
                                                <th scope="col">Cost</th>
                                                <th scope="col">Dated</th>
                                                <th scope="col">Emp Name</th>
                                                <th scope="col">Emp Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <div id="ItemPlaceholder" runat="server"></div>
                                        </tbody>
                                    </table>
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                        <td><%# Eval("service_name")%></td>
                                        <td><%# Eval("price")%></td>
                                        <td><%# Eval("date_req").ToString().Substring(0,10)%></td>
                                        <td><%# Eval("emp_FN")%> <%# Eval("emp_LN")%></td>
                                        <td><%# Eval("email")%></td>
                                    </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [user_serv] WHERE ([user_id] = @user_id)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="null" Name="user_id" SessionField="username" Type="String" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                    </main>
                </div>
            </div>

        </div>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="Scripts/dashboard.js"></script>
</body>
</html>
