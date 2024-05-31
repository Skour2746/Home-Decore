<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Login" %>

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
                <div class="main-panel">
                    <div class="content-wrapper d-flex align-items-center auth px-0">
                        <div class="row w-100 mx-0">
                            <div class="col-lg-4 mx-auto">
                                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                                    <div class="brand-logo">
                                        <img src="Admin/images1/logo/black_logo.png" alt="logo">
                                    </div>
                                    <h4>New here?</h4>
                                    <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
                                    <div class="pt-3">
                                        <div class="form-group">
                                            <label for="">Name</label>

                                            <asp:TextBox ID="txtusername" runat="server" class="form-control form-control-lg" placeholder="Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtusername" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                        </div>
                                        <div class="form-group">
                                            <label for="">Email</label>
                                            <asp:TextBox ID="txtuseremail" runat="server" class="form-control form-control-lg" placeholder="Email"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtuseremail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuseremail" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Contact</label>
                                            <asp:TextBox ID="txtusercontact" runat="server" MaxLength="10" class="form-control form-control-lg" placeholder="Contact"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtusercontact" ErrorMessage="Enter only Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusercontact" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                        </div>
                                        <div class="form-group">
                                            <label for="">Password</label>
                                            <asp:TextBox ID="txtuserpassword" type="password" runat="server" class="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuserpassword" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>


                                        </div>

                                        
                                        <div class="mt-3">
                              <asp:Button ID="register" OnClick="register_Click"  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" runat="server" Text="Register" />
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>
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
        <!-- inject:js -->
        <script src="Admin/js/template.js"></script>
        <!-- endinject -->
    </form>
</body>
</html>
