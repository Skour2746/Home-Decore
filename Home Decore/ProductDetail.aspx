<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .comments-area .comment-form p.comment-form-comment {
            width: 100%;
            display: block;
            clear: both;
        }

        .comments-area .comment-form p textarea {
            height: 150px;
            padding: 24px 60px 24px 30px;
            color: #676781;
            font-size: 14px;
            line-height: 20px;
            resize: none;
            border-radius: 30px;
            box-shadow: 0 3px 10px 0 rgba(0,0,0,.05);
        }

        .comments-area .comment-form p label {
            display: none;
            line-height: 18px;
            margin-bottom: 10px;
        }

        .comments-area .comment-form p label {
            display: none;
            line-height: 18px;
            margin-bottom: 10px;
        }

        .comments-area p.comment-form-comment::before {
            content: "\f040";
        }

        .comments-area .comment-form p input[type=text] {
            height: 60px;
            line-height: 20px;
            padding: 20px 60px 20px 30px;
            border-radius: 30px;
            color: #676781;
            font-size: 14px;
            box-shadow: 0 3px 10px 0 rgba(0,0,0,.05);
        }

        .ratingStar {
            font-size: 0pt;
            font-size: 20px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }

        .filledStar::before {
            content: "\2605";
            width: 13px;
            height: 12px;
            color: yellow !important;
        }


        .emptyStar::before {
            content: "\2606";
            width: 13px;
            height: 12px;
            color: black !important;
        }

        .savedStar {
            content: "\2606";
            width: 13px;
            height: 12px;
        }

        .auto-style1 {
            height: 50px;
        }




        .img-display {
            overflow: hidden;
        }

        .img-showcase {
            display: flex;
            width: 100%;
            height: 400px;
            transition: all 0.5s ease;
        }

            .img-showcase img {
                min-width: 100%;
            }

        .img-select {
            display: flex;
        }

        .img-item {
            margin: 0.3rem;
        }

            .img-item:nth-child(1),
            .img-item:nth-child(2),
            .img-item:nth-child(3) {
                margin-right: 0;
            }

            .img-item:hover {
                opacity: 0.8;
            }

        .qtydesign {
            width: 22% !important;
        }

        .fcc {
            width: 96% !important;
            margin-left: 10px !important;
        }

        .fmm {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="dlab-bnr-inr dlab-bnr-inr-sm overlay-black-middle" style="background-image: url(Admin/images1/banner/slide2.jpg);">
            <div class="container">
                <div class="dlab-bnr-inr-entry">
                    <div class="wonder-bx text-white">
                        <div class="wonder-theme">PD</div>
                        <div class="wonder-title">
                            <h1>Product Detail </h1>
                            <p>A well-decorated home is a journey of self-discovery.</p>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
        <!-- inner page banner END -->
        <!-- contact area -->
        <div class="section-full content-inner">
            <div class="container">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="dlab-post-media m-b50">
                                    <div class="product-imgs">
                                        <div class="img-display">
                                            <div class="img-showcase">
                                                <img src="Admin/images1/MiniCatwgory/<%# Eval("image") %>" alt="shoe image">
                                                <img src="Admin/images1/MiniCatwgory/<%# Eval("image1") %>" alt="shoe image">
                                                <img src="Admin/images1/MiniCatwgory/<%# Eval("image2") %>" alt="shoe image">
                                                <img src="Admin/images1/MiniCatwgory/<%# Eval("image4") %>" alt="shoe image">
                                            </div>
                                        </div>
                                        <div class="img-select">
                                            <div class="img-item">
                                                <a href="#" data-id="1">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image") %>" alt="shoe image">
                                                </a>
                                            </div>
                                            <div class="img-item">
                                                <a href="#" data-id="2">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image1") %>" alt="shoe image">
                                                </a>
                                            </div>
                                            <div class="img-item">
                                                <a href="#" data-id="3">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image2") %>" alt="shoe image">
                                                </a>
                                            </div>
                                            <div class="img-item">
                                                <a href="#" data-id="4">
                                                    <img src="Admin/images1/MiniCatwgory/<%# Eval("image4") %>" alt="shoe image">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="section-head text-black mb-3">
                                    <h6 class="box-title" style="font-size: 35px;"><%# Eval("Heading") %></h6>
                                    <p class="m-b0"><%# Eval("Para") %></p>
                                    <div class="qtydesign border" style="width: 34%; border-radius: 20px; padding: 9px;">
                                        <asp:Button ID="decrementButton" runat="server" Text="-" Style="border-radius: 50px; font-weight: 500; padding: 5px 10px; background-color: #4611a7; color: white; border: none; line-height: 14px;"
                                            CssClass="decrement-button" OnClientClick="return false;" />
                                        <asp:TextBox ID="quantityTextBox" Style="text-align: center; padding: 0px 0px; width: 39px; height: 44px; border: none;" runat="server" CssClass="quantity-input" Text="1"></asp:TextBox>
                                        <asp:Button ID="incrementButton" runat="server" Text="+" CssClass="increment-button" OnClientClick="return false;" Style="border-radius: 50px; font-weight: 500; padding: 5px 10px; background-color: #4611a7; color: white; border: none; line-height: 14px;" />
                                    </div>
                                    <br />
                                    <h3 class="m-b0">Price:- <%# Eval("Rate") %> /-</h5><br />
                                        <br />
                                        <br />
                                        <asp:Button ID="submit" OnClick="submit_Click1" value="Post Comment" class="submit site-button" name="submit" runat="server" Text="Add To Cart" />
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>

                </asp:ListView>

                <div class="row">
                    <div class="col-lg-6">
                    </div>
                    <!-- Left part start -->
                    <div class="col-xl-12 col-lg-6 col-md-6 p-b30">

                        <asp:ListView ID="ListView2" runat="server">
                            <ItemTemplate>
                            </ItemTemplate>

                        </asp:ListView>

                        <div class="dlab-divider bg-gray-dark"></div>
                        <div class="clear" id="comment-list">
                            <div class="comments-area" id="comments">
                                <h3 class="font-26">Your Reviews</h3>
                                <div class="clearfix">
                                    <!-- comment list END -->
                                    <ol class="comment-list">
                                        <asp:ListView ID="ListView3" runat="server" OnItemDataBound="ListView3_ItemDataBound">
                                            <ItemTemplate>
                                                <li class="comment">
                                                    <div class="comment-body">
                                                        <div class="comment-author vcard">
                                                            <img class="avatar photo" src="../Admin/images1/commenter/<%# Eval("image") %>" alt="" />
                                                            <cite class="fn"><%# Eval("c_name") %></cite>
                                                            <span class="says">says:</span>
                                                        </div>
                                                        <div class="comment-meta">
                                                            <a href="javascript:void(0);"><%# Eval("rts") %></a>
                                                            <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>

                                                        </div>
                                                        <p><%# Eval("comment") %></p>
                                                        <div class="reply"><a href="javascript:void(0);" class="comment-reply-link">Reply</a> </div>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ol>
                                    <!-- comment list END -->

                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <!-- Form -->
                                    <h3 class="font-26">Write a Review</h3>
                                    <div class="comment-respond" id="respond">
                                        <div class="comment-form" id="commentform" method="post" action="#">
                                            <div class="comment-form-rating">
                                                <div class="starrr"></div>
                                                <div class="rating-widget">
                                                    <!-- Rating Stars Box -->
                                                    <div class="rating-stars">
                                                        <label for="Rating">Rating</label>
                                                        <asp:Rating ID="Rating2" runat="server" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                            FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="1" MaxRating="5">
                                                        </asp:Rating>

                                                    </div>
                                                </div>
                                            </div>
                                            <p class="comment-form-comment">
                                                <label for="comment">Comments</label>
                                                <asp:TextBox ID="TextBox1" class="form-control" Rows="8" name="comment" placeholder="Type your comments...." TextMode="MultiLine" runat="server"></asp:TextBox>
                                            </p>


                                            <p class="comment-form-image">
                                                <label for="author">Type your name.... <span class="required">*</span></label>
                                                <asp:FileUpload ID="FileUpload1" Style="border-radius: 30px !important; padding: 25px 20px; height: 80px;" class="form-control" runat="server" />
                                                <%--<asp:TextBox ID="TextBox5" type="text" value="" name="Author" placeholder="Type your name...." class="form-control" runat="server"></asp:TextBox>--%>
                                            </p>
                                            <p class="comment-form-author">
                                                <label for="author">Type your name.... <span class="required">*</span></label>
                                                <asp:TextBox ID="TextBox2" type="text" value="" name="Author" placeholder="Type your name...." class="form-control" runat="server"></asp:TextBox>
                                            </p>



                                            <p class="comment-form-email">
                                                <label for="email">Type your email.... <span class="required">*</span></label>
                                                <asp:TextBox ID="TextBox3" type="text" value="" name="email" placeholder="Type your Email...." class="form-control" runat="server"></asp:TextBox>
                                            </p>

                                            <p class="form-submit">
                                                <asp:Button ID="submit" OnClick="submit_Click" value="Post Comment" class="submit site-button" name="submit" runat="server" Text="Post Comment" />
                                            </p>
                                        </div>
                                    </div>
                                    <!-- Form -->
                                </div>
                            </div>
                        </div>
                        <!-- blog END -->
                    </div>
                    <!-- Left part END -->
                    <!-- Side bar start -->

                    <!-- Side bar END -->
                </div>
            </div>
        </div>
        <!-- contact area END -->
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".increment-button").click(function () {
                var textBox = $(this).siblings(".quantity-input");
                var quantity = parseInt(textBox.val());
                if (!isNaN(quantity)) {
                    quantity++;
                    textBox.val(quantity);
                }
            });

            $(".decrement-button").click(function () {
                var textBox = $(this).siblings(".quantity-input");
                var quantity = parseInt(textBox.val());
                if (!isNaN(quantity) && quantity > 0) {
                    quantity--;
                    textBox.val(quantity);
                }
            });
        });
    </script>
</asp:Content>

