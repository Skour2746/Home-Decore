<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="Shipping.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="page-content bg-white" style="padding-bottom: 0px;">
        <!-- inner page banner -->
        <div class="dlab-bnr-inr dlab-bnr-inr-sm overlay-black-middle" style="background-image: url(Admin/images1/banner/slide.jpg);">

            <div class="container">
                <div class="dlab-bnr-inr-entry">
                    <h1 class="text-white">Shipping</h1>
                    <p>A well-decorated home is a journey of self-discovery.</p>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <ul class="list-inline">
                            <li><a href="index.html">Home</a></li>
                            <li>Shipping</li>
                        </ul>
                    </div>
                    <!-- Breadcrumb row END -->
                </div>
            </div>
        </div>
        </div>


        <section id="question" class="question mb-5 pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <br />
                        <br />
                        <br />
                        <center>
                            <h1>Add Your Address</h1>
                        </center>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="address">
                                    <label>Name</label>
                                    <asp:TextBox ID="txtname" class="form-control" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="address">
                                    <label>Contact</label>
                                    <asp:TextBox ID="txtcontact" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                    <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcontact" Style="color: red; font-weight: bold;" ErrorMessage="Enter only Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="address">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtaddress" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="address">
                                    <label>State</label>
                                    <asp:TextBox ID="txtstate" class="form-control" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtstate" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="address">
                                    <label>City</label>
                                    <asp:TextBox ID="txtcity" class="form-control" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="address">
                                    <label>Pin Code</label>
                                    <asp:TextBox ID="txtpincode" class="form-control" runat="server"></asp:TextBox>
                                    <%-- <asp:RegularExpressionValidator ID="regularExp" runat="server" ControlToValidate="txtpincode" Style="color: red; font-weight: bold;" ValidationExpression="[0-9]{5}" ErrorMessage="Invalid Zip Code."></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="address">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtemail" class="form-control" runat="server"></asp:TextBox>
                                    <%--<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="color: red; font-weight: bold;" ControlToValidate="txtemail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="address">
                                    <label>Order Note</label><br />
                                    <asp:TextBox ID="txtOrderNote" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <asp:ListView ID="ListView1" runat="server" Visible="false">
                                <ItemTemplate>

                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblCid" runat="server" Text='<%# Eval("Customer_id") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblPid" runat="server" Text='<%# Eval("Product_id") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblqty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Rate") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblrts" runat="server" Text='<%# Eval("rts") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:ListView>

                         
                        </div>
                        <br />

                    </div>


                    <div class="col-lg-3">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="box" style="border: 1px solid black; border-radius: 10px;">
                            <h4 class="text-center my-4">Order Summary:</h4>

                            <div class="box1 px-2 d-flex" style="justify-content: space-between;">
                                <h5>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Cash On Delivery" /><br />
                                   Total: <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label> /-
                                </h5>
                            </div>

                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" class="site-button my-4" Style="margin-left: 70px;" Text="Place to Order" />


                        </div>
                    </div>
                </div>
            </div>

        </section>
</asp:Content>

