<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .pgrBtns, #ContentPlaceHolder1_listing_SubCategory_DataPager1 span {
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

        #ContentPlaceHolder1_listing_SubCategory_DataPager1 span {
            background-color: #4611a7;
            color: white;
        }

        #ContentPlaceHolder1_listing_SubCategory_DataPager1 {
            display: flex;
            text-justify: center;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="dlab-bnr-inr dlab-bnr-inr-sm overlay-black-middle" style="background-image: url(Admin/images1/banner/life-style.jpg);">
            <asp:ListView ID="ListView1" runat="server">
                <ItemTemplate>
                    <div class="container">
                        <div class="dlab-bnr-inr-entry">
                            <h1 class="text-white"><%# Eval("SubCategory") %></h1>
                            <p>A well-decorated home is a journey of self-discovery.</p>
                            <!-- Breadcrumb row -->
                            <div class="breadcrumb-row">
                                <ul class="list-inline">
                                    <li><a href="index.html">Home</a></li>
                                    <li><%# Eval("SubCategory") %></li>
                                </ul>
                            </div>
                            <!-- Breadcrumb row END -->
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <!-- inner page banner END -->
        <!-- contact area -->
        <div class="content-block">
            <div class="section-full content-inner bg-white">
                <div class="container-fluid">
                    <div class="row">
                        
                        <div class="col-lg-12 col-md-6">
                            
                            <div class="row">
                                <asp:ListView ID="listing_SubCategory" runat="server" ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1" OnPagePropertiesChanging="listing_SubCategory_PagePropertiesChanging">
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listing_SubCategory" PageSize="4">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonCssClass="pgrBtns" ButtonType="button" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />

                                                <asp:NumericPagerField NumericButtonCssClass="pgrBtns" ButtonType="button" />

                                                <asp:NextPreviousPagerField ButtonCssClass="pgrBtns" ButtonType="button" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                            </Fields>
                                        </asp:DataPager>
                                    </LayoutTemplate>

                                    <GroupTemplate>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                
                                        <div class="col-lg-6">
                                            <div class="listing-bx listing-half m-b30">
                                                <div class="listing-media">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image1") %>" alt="">
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
                                                    <h6 class="title"><a href="ProductCategory.aspx?listing_cid=<%# Eval("MiniCid") %>"><%# Eval("Heading").ToString().PadRight(60).Substring(0,60).TrimEnd() %>.....</a></h6>
                                                    <p><%# Eval("Para").ToString().PadRight(100).Substring(0,100).TrimEnd() %>.....</p>

                                                    <ul class="place-info">
                                                        <li class="place-location"><i class="fa fa-map-marker"></i>12/a, New</li>
                                                        <li class="open"><i class="fa fa-check"></i>Open Now</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                              
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->
    </div>
    <!-- Content END-->
</asp:Content>

