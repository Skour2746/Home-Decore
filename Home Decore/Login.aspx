﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kapella Bootstrap Admin Dashboard Template</title>
    <!-- base:css -->
    <link rel="stylesheet" href="Admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="Admin/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="Admin/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="Admin/images/favicon.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                    <div class="row flex-grow">
                        <div class="col-lg-6 d-flex align-items-center justify-content-center">
                            <div class="auth-form-transparent text-left p-3">
                                <div class="brand-logo">
                                    <img src="Admin/images1/logo/black_logo.png" alt="logo">
                                </div>
                                <h4>Welcome back!</h4>
                                <h6 class="font-weight-light">Happy to see you again!</h6>
                                <div class="pt-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail">Username</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-account-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtusername" type="text" class="form-control form-control-lg border-left-0" placeholder="Usename" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword">Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-lock-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtpassword" type="password" class="form-control form-control-lg border-left-0" placeholder="Password" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="my-2 d-flex justify-content-between align-items-center">
                                    </div>
                                    <div class="my-3">
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                                        <asp:Button ID="login" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" runat="server" Text="LOGIN" OnClick="login_Click" />

                                    </div>

                                    <div class="text-center mt-4 font-weight-light">
                                        Don't have an account? <a href="Register.aspx" class="text-primary">Register</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 login-half-bg d-flex flex-row">
                            <p class="text-white font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2021  All rights reserved.</p>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- base:js -->
        <script src="Admin/vendors/base/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="Admin/js/template.js"></script>
        <!-- endinject -->
        <!-- plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->
    </form>
</body>
</html>
