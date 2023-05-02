<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDash2.aspx.cs" Inherits="SpaNSalon.AdminDash2" %>

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
                <asp:Label ID="name" runat="server" CssClass="fs-4 form-control form-control-dark w-100 text-center" Text="ADMIN" aria-label="Label"></asp:Label>
                <div class="navbar-nav">
                    <div class="nav-item text-nowrap">
                        <asp:LinkButton ID="logout" OnClick="logout_Click" runat="server" class="nav-link px-3"><span data-feather="log-out"></span></asp:LinkButton>
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
                                        <asp:Label ID="ue" runat="server" Text="AdminName" ></asp:Label>
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
                                    <a class="nav-link" aria-current="page" href="AdminDash.aspx">
                                        <span data-feather="pocket"></span>
                                        Completed Services
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="AdminDash2.aspx">
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
                    <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        <div class="row g-5">
                            <div class="col-md-5 col-lg-4 order-md-last">
                                <asp:Image ID="servIm" runat="server" CssClass="img-fluid d-flex justify-content-between align-items-center mb-3" />
                                <h2><asp:Label ID="servName" CssClass="text-dark text-center" runat="server" Text=""></asp:Label></h2>

                                <!--      <ul class="list-group mb-3">
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0">Product name</h6>
                                            <small class="text-muted">Brief description</small>
                                        </div>
                                        <span class="text-muted">$12</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0">Second product</h6>
                                            <small class="text-muted">Brief description</small>
                                        </div>
                                        <span class="text-muted">$8</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0">Third item</h6>
                                            <small class="text-muted">Brief description</small>
                                        </div>
                                        <span class="text-muted">$5</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                        <div class="text-success">
                                            <h6 class="my-0">Promo code</h6>
                                            <small>EXAMPLECODE</small>
                                        </div>
                                        <span class="text-success">−$5</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <span>Total (USD)</span>
                                        <strong>$20</strong>
                                    </li>
                                </ul>

                                <form class="card p-2">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Promo code">
                                        <button type="submit" class="btn btn-secondary">Redeem</button>
                                    </div>
                                </form>-->
                            </div>
                            <div class="col-md-7 col-lg-8">
                                <h1 class="mb-3 text-center">Latest Service Requests</h1>
                                <div>
                                    <div class="row g-3">
                                        <div class="col-auto">
                                            <div class=" input-group">
                                                <span class="input-group-text">Name</span>
                                                <asp:Label ID="uFullName" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                                            </div>
                                        </div>                                      
                                        <div class="col-auto">
                                            <div class="input-group">
                                                <span class="input-group-text">Contact No.</span>
                                                <asp:Label ID="ucontact" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-auto">
                                            <div class="input-group">
                                                <span class="input-group-text">e-Mail</span>
                                                <asp:Label ID="umail" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-auto">
                                            <div class="input-group">
                                                <span class="input-group-text">Address</span>
                                                <asp:Label ID="address" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-4">
                                                    <hr class="my-4" />
                                                </div>
                                                <div class="col-4">
                                                    <h3 class="mb-3 text-center">Assigned Employee : </h3>
                                                </div>
                                                <div class="col-4">
                                                    <hr class="my-4" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-auto">
                                            <div class="input-group">
                                                <span class="input-group-text">Employee Name</span>
                                                <asp:Label ID="emp" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group">
                                                <span class="input-group-text">Employee ID</span>
                                                <asp:Label ID="empID" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                            </div>
                                        </div>


                                    </div>



                                    <!-- <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="same-address">
                                        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
                                    </div>

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="save-info">
                                        <label class="form-check-label" for="save-info">Save this information for next time</label>
                                    </div>

                                    <hr class="my-4">

                                    <h4 class="mb-3">Payment</h4>

                                    <div class="my-3">
                                        <div class="form-check">
                                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
                                            <label class="form-check-label" for="credit">Credit card</label>
                                        </div>
                                        <div class="form-check">
                                            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
                                            <label class="form-check-label" for="debit">Debit card</label>
                                        </div>
                                        <div class="form-check">
                                            <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required="">
                                            <label class="form-check-label" for="paypal">PayPal</label>
                                        </div>
                                    </div>

                                    <div class="row gy-3">
                                        <div class="col-md-6">
                                            <label for="cc-name" class="form-label">Name on card</label>
                                            <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                                            <small class="text-muted">Full name as displayed on card</small>
                                            <div class="invalid-feedback">
                                                Name on card is required
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="cc-number" class="form-label">Credit card number</label>
                                            <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                                            <div class="invalid-feedback">
                                                Credit card number is required
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label for="cc-expiration" class="form-label">Expiration</label>
                                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                                            <div class="invalid-feedback">
                                                Expiration date required
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label for="cc-cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                                            <div class="invalid-feedback">
                                                Security code required
                                            </div>
                                        </div>
                                        -->
                                </div>
                                <hr class="my-4"/>
                                <div class="d-flex justify-content-center">
                                    <asp:Button ID="btnAssign" runat="server" Text="Assign" CssClass="btn btn-light btn-outline-success mx-4 justify-content-center" OnClick="btnAssign_Click" />
                                    <asp:Button ID="btnDeny" runat="server" Text="Deny" CssClass=" btn btn-light btn-outline-danger mx-4 justify-content-center" OnClick="btnDeny_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--  </div>-->
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
