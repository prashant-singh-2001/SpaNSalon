<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterNewService.aspx.cs" Inherits="SpaNSalon.RegisterNewService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Service</title>
    <link rel="icon" href="Feather/plus-circle.svg" />
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid my-5">
            <div class="row" style="margin-top:9%;">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="card shadow m-5 p-1">
                <div class="card-header text-center text-capitalize">
                    <h2> Register New Service </h2>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-4 align-content-center">
                            <asp:Image ImageUrl="imageurl" CssClass="img-fluid my-3" ID="servIm" runat="server" />
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            <div class="d-flex justify-content-center my-3">
                               
                                <asp:Button ID="Button2" runat="server" Text="Upload" CssClass="btn btn-outline-dark " OnClick="Button2_Click" />
                                
                                    <asp:Literal Text="" Visible="false" ID="UploadedPic" runat="server" />
                                
                            </div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-7 d-flex justify-content-center border-start border-secondary border-5 py-5">
                            <div class="col-6 ">
                                <div class="input-group ">
                                    <label class="input-group-text">Enter Service Name</label>
                                    <asp:TextBox ID="servname" runat="server" CssClass="form-control "></asp:TextBox>
                                </div>
                                <br />
                                <div class="input-group ">
                                        <label class="input-group-text" >Enter Service Price</label>
                                        <asp:TextBox ID="price" runat="server" CssClass="form-control "></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="input-group ">
                                        <label class="input-group-text" >Choose Service Type</label>
                                        <asp:DropDownList ID="servtype" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" CssClass="dropdown form-control" DataValueField="type"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MajorProjectConnectionString %>" SelectCommand="SELECT DISTINCT [type] FROM [servicesMst]"></asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-info text-black fs-5" Text="Register!" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="col-2"></div>
            </div>
        </div>
    </form>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
</body>
</html>
