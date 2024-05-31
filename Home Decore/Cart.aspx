<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style>
        .pgrBtns, #ContentPlaceHolder1_lst_Cart_DataPager1 span {
            font-weight: 400;
            width: 45px;
            height: 45px;
            display: table;
            font-family: rubik;
            line-height: 41px;
            padding: 0;
            border-radius: 50px;
            border: 2px solid rgba(46,56,65,.1);
            margin: 20px 5px;
            text-align: center;
            cursor: pointer;
        }

        #ContentPlaceHolder1_lst_Cart_DataPager1 span {
            background-color: #4611a7;
            color: white;
        }

        #ContentPlaceHolder1_lst_Cart_DataPager1 {
            display: flex;
            text-justify: center;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="dlab-bnr-inr dlab-bnr-inr-sm overlay-black-middle" style="background-image: url(Admin/images1/banner/slide.jpg);">

            <div class="container">
                <div class="dlab-bnr-inr-entry">
                    <h1 class="text-white">Our Cart</h1>
                    <p>A well-decorated home is a journey of self-discovery.</p>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <ul class="list-inline">
                            <li><a href="index.html">Home</a></li>
                            <li>Cart</li>
                        </ul>
                    </div>
                    <!-- Breadcrumb row END -->
                </div>
            </div>

        </div>
        <!-- inner page banner END -->
        <!-- contact area -->
        <div class="content-block">
            <div class="section-full content-inner bg-white">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-lg-12 col-md-6">

                            <div class="row">
                                <asp:ListView ID="lst_Cart" runat="server" OnItemDeleting="lst_Cart_ItemDeleting" OnItemCommand="lst_Cart_ItemCommand">

                                    <ItemTemplate>

                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblqty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Rate") %>' Visible="false"></asp:Label>

                                        <div class="col-lg-6">
                                            <div class="listing-bx listing-half m-b30">
                                                <div class="listing-media">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image") %>" alt="">
                                                    <ul class="wish-bx">
                                                        <li><a class="like-btn" href="javascript:void(0)"><i class="fa fa-heart"></i></a></li>
                                                        <li><a class="info-btn" href="javascript:void(0)"><i class="fa fa-leaf"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="listing-info">
                                                    <ul class="featured-star">
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>

                                                    </ul>
                                                    <h6 class="title"><a href="#"><%# Eval("Heading") %></a></h6>
                                                    <p><%# Eval("Para") %></p>
                                                    <h5>Price:-<%# Eval("Rate") %> /-</h5>
                                                    <h5>Qty:-<%# Eval("Quantity") %></h5>

<%--                                                    <asp:Button ID="Button3" runat="server" Text="Delete" Style="float: right;" class="site-button me-5" CommandName="Delete" />--%>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" style="background:#dee5f3" class="btn btn-default me-2" CommandName="delete"><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>

                                                    
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>

                                </asp:ListView>
                            </div>
                            <asp:Label ID="lblTotal" runat="server" class="me-5 fs-4" Style="float: right;"></asp:Label>

                            <br />
                            <br />
                            <br />

                            <asp:Button ID="Button2" type="submit" value="Process to Order" runat="server" Text="Process to Order" Style="float: right;" class="site-button me-5" OnClick="Button2_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->
    </div>
    <!-- Content END-->



</asp:Content>

