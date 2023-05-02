<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDash4.aspx.cs" Inherits="SpaNSalon.AdminDash4" %>

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
    <title>Admin Dashboard</title>
</head>
<body class="back">
    <form id="form1" runat="server">
        <div>
            <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
                <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-5" href="#">Vercetti Services</a>
                <button class="navbar-toggler position-absolute d-md-none collapsed" style="margin-right: 30px" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <asp:Label ID="Admin" runat="server" Text="ADMIN" CssClass="fs-4 form-control form-control-dark w-100 text-center"></asp:Label>
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
                                    <a class="nav-link active" aria-current="page" href="AdminDash.aspx">
                                        <span data-feather="at-sign"></span>
                                        <asp:Label ID="username" runat="server" Text="AdminName" ></asp:Label>
                                    </a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="AdminDash3.aspx">
                                        <span data-feather="users"></span>
                                        View Employee Status
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="AdminDash5.aspx">
                                        <span data-feather="codesandbox"></span>
                                        View Services
                                    </a>
                                </li>
                            </ul>
                            <hr class="border-bottom border-3 my-3" />
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="AdminDash.aspx">
                                        <span data-feather="pocket"></span>
                                        Completed Services
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="AdminDash2.aspx">
                                        <span data-feather="info"></span>
                                        Requested Services
                                    </a>
                                </li>
                            </ul>
                            <hr class=" my-3 border border-2 border-warning" />
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="AdminSignupForm.aspx">
                                        <span data-feather="user-plus"></span>
                                        Add New Admin
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2">Dashboard</h1>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <div class="btn-group me-2">
                                    <a class="btn btn-sm btn-outline-secondary" href="AdminDash.aspx">Show Completed</a>
                                </div>                                
                            </div>
                        </div>
                        <h2>In Progress Services: </h2>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                                <div class="table-responsive">
                                    <table class="table table-striped table-sm">
                                        <thead>
                                            <tr>
                                                <th scope="col">Service Name</th>
                                                <th scope="col">Cost</th>
                                                <th scope="col">Dated</th>
                                                <th scope="col">Employee Name</th>
                                                <th scope="col">User Name</th>
                                                <th scope="col">User Contact</th>
                                                <th scope="col">User Mail</th>
                                                <th scope="col">Type of Service</th>
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
                                    <td><%# Eval("user_FN")%> <%# Eval("user_LN")%></td>
                                    <td><%# Eval("contact")%> </td>
                                    <td><%# Eval("email")%> </td>
                                    <td><%# Eval("type")%> </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT * FROM [all_info] where status='P'"></asp:SqlDataSource>

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
