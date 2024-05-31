<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="ProductCategory.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .pgrBtns, #ContentPlaceHolder1_lv_listing_DataPager1 span {
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

        #ContentPlaceHolder1_lv_listing_DataPager1 span {
            background-color: #4611a7;
            color: white;
        }

        #ContentPlaceHolder1_lv_listing_DataPager1 {
            display: flex;
            justify-content: center;
            width: 100%;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- inner page banner -->
    <div class="dlab-bnr-inr dlab-bnr-inr-sm overlay-black-middle" style="background-image: url(Admin/images1/banner/slide2.jpg);">
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <div class="container">
                    <div class="dlab-bnr-inr-entry">
                        <h1 class="text-white"><%# Eval("MiniCategory") %></h1>
                        <p>A well-decorated home is a journey of self-discovery.</p>
                        <!-- Breadcrumb row -->
                        <div class="breadcrumb-row">
                            <ul class="list-inline">
                                <li><a href="#">Home</a></li>
                                <li><%# Eval("MiniCategory") %></li>
                            </ul>
                        </div>
                        <!-- Breadcrumb row END -->
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <!-- inner page banner END -->
    <!-- Contact area -->
    <div class="content-block">
        <div class="section-full content-inner bg-white">
            <div class="container">

                <div class="row">
                    <asp:ListView ID="lv_listing" runat="server" ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1" OnPagePropertiesChanging="lv_listing_PagePropertiesChanging">


                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6 col-sm-6 m-b30">
                                <div class="listing-bx overlap">
                                    <div class="listing-media">
                                        <img src="Admin/images1/MiniCatwgory/<%# Eval("image1") %>" alt="">
                                    </div>
                                    <div class="listing-info">
                                        <h3 class="title"><a href="ProductDetail.aspx?detail_id=<%#Eval("id") %>"><%# Eval("Heading").ToString().PadRight(26).Substring(0,26).TrimEnd() %> .....</a></h3>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>

                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_listing" PageSize="6">
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
                    </asp:ListView>

                </div>
              
            </div>
        </div>
    </div>
    <!-- Contact area END -->


</asp:Content>

