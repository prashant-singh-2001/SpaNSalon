<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookService.aspx.cs" Inherits="SpaNSalon.BookService" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Service</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .ml {
            margin-bottom: 5px;
        }

        .rounded-ten {
            border-radius: 4rem !important;
        }
        body {
            background-image: url("../Images/bg1.jpg");
            background-repeat: repeat;
            background-size:contain;
            font-family: Dosis;
        }
        .calendar {
            font-size: large;
        }

        .blink_me {
            box-shadow:rgb(66, 193, 181, 0.55) 8px 8px 8px 8px inset;
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
</head>

<body class="">
    <form id="form1" runat="server">
        <div class="container">
            <div class="card shadow rounded-ten my-lg-5 bg-opacity-75">
                <div class="d-flex justify-content-center">
                <div class="card-header col-11 text-center text-uppercase fs-4">
                    <asp:Image ID="icon" CssClass="img-fluid ml" runat="server" ImageUrl="~/Feather/briefcase.svg" />&nbsp;&nbsp;  Book Your Service
                </div>
                </div>
                <div class="card-body p-5">
                    <main>
                        <div class="row g-5">
                            <div class="col-md-5 col-lg-4 order-md-last">
                                <h4 class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-danger">Service</span>
                                </h4>
                                <asp:Image ID="pimage" ImageUrl="~/Images/5.jpg" CssClass="img-fluid" runat="server" />

                                <div class="card p-1 my-1">
                                    <div class="input-group">
                                        <asp:TextBox ID="ServiceName" Enabled="false" runat="server" CssClass="form-control disabled mx-1" required></asp:TextBox>
                                        <br class="my-2"/>
                                        <asp:TextBox ID="ServiceCost" Enabled="false" runat="server" CssClass="form-control disabled mx-1" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8">
                                <h3 class="mb-3">Just one more step : </h3>
                                <div class="needs-validation">
                                    <div class="row g-3">
                                        <div class="col-sm-6">
                                            <label for="firstName" class="form-label">First name</label>
                                            <asp:TextBox ID="firstName" Enabled="false" runat="server" CssClass="form-control disabled" required></asp:TextBox>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="lastName" class="form-label">Last name</label>
                                            <asp:TextBox ID="lastName" Enabled="false" runat="server" required CssClass="form-control disabled"></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <label for="username" class="form-label">Username</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text">@</span>
                                                <asp:TextBox runat="server" ID="user_name" CssClass="form-control" required Enabled="false" Text="" />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="email" class="form-label">Email</label>
                                            <asp:TextBox runat="server" ID="email" CssClass="form-control disabled" required Enabled="false" />
                                        </div>
                                        <div class="col-3">
                                            <label for="address2" class="form-label">Select Date</label>
                                            <%--<asp:Calendar ID="date" runat="server" CssClass="form-control"></asp:Calendar>--%>
                                            <table class="table-borderless">
                                                <tr>
                                                    <td><asp:TextBox runat="server" ID="date1" CssClass="form-control col-4" AutoPostBack="true" OnTextChanged="date1_TextChanged" /></td>
                                                <td class="p-2"><asp:Image ID="Imbtn1" runat="server" ImageUrl="~/Feather/calendar.svg" Image-Align="Top"
                                                    CssClass=" my-1"  />
                                                    
                                                </td>
                                                    <td><asp:Image ID="Image1" runat="server" CssClass="blink_me" ImageUrl="~/Feather/arrow-left-circle.svg" /></td>
                                                <td><cc1:CalendarExtender ID="cal1" CssClass="" PopupButtonID="Imbtn1" runat="server" TargetControlID="Date1"
                                                    Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager> </td>
                                                </tr>
                                            </table>

                                                
                                                
                                            
                                                                                        
                                        </div>
                                        <div class="col-12">
                                            <label for="address" class="form-label">Address</label>
                                            <asp:TextBox required ID="line1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <label for="address2" class="form-label">Address 2</label>
                                            <asp:TextBox required runat="server" ID="line2" CssClass="form-control" TextMode="MultiLine"/>
                                        </div>
                                        <div class="col-md-5">
                                            <label for="state" class="form-label">State</label>
                                            <asp:DropDownList ID="state" CssClass="form-control col-3 dropdown dropdown-header" runat="server" OnSelectedIndexChanged="state_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="city" class="form-label">City</label>
                                            <asp:DropDownList ID="city" CssClass="form-control col-3 dropdown dropdown-header" runat="server" AutoPostBack="True" ></asp:DropDownList>
                                        </div>
                                        
                                        <div class="col-md-3">
                                            <label for="pin" class="form-label">Pin</label>
                                            <asp:TextBox runat="server" ID="pin" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr class="my-4" />
                                    
                                    <div class="container d-flex justify-content-center">
                                        <asp:Button Text="Confirm" runat="server" CssClass=" btn btn-primary btn-lg" OnClick="Unnamed_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
                </div>
        
    </form>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
