<%@ Page Title="" Language="C#" MasterPageFile="~/Home Frontend.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content bg-white">
        <!-- Section Banner -->
        <div class="dlab-bnr-inr dlab-bnr-inr-md" style="background: linear-gradient(to right,rgb(42, 2,55), rgba(36, 2, 46,0.726), rgb(42, 2,55)), url(Admin/images1/banner/slide.jpg); background-size: cover;">
            <div class="container">
                <div class="dlab-bnr-inr-entry align-m dlab-home">
                    <div class="bnr-content">
                        <h2 style="text-shadow: 3px 3px 3px black; font-size: 55px;"><strong>The best journeys</strong>  lead you home.</h2>
                    </div>
                    <div class="dlab-tabs search-filter">
                        <p style="font-size: 18px; color: white;">Home is where love resides, memories are created, friends always belong, and laughter never ends.</p>
                        <div class="tab-content" style="width: 40%; transform: translate(70%,0);">
                            <div id="place" class="tab-pane active">

                                <div>
                                    <div class="input-group">
                                        <div class="form-control" style="padding-top: 0px; padding-left: 0px; padding-right: 0px;">
                                            <asp:DropDownList ID="lst_ddcategory" runat="server" DataTextField="Category" DataValueField="id" CssClass="fcsearch" AppendDataBoundItems="true" AutoPostBack="true">
                                                <asp:ListItem Text="Select Category" Value="1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;
                                        <div class="input-group-prepend">
                                            <asp:Button ID="Key_search" class="site-button text-uppercase" runat="server" Text="Search" OnClick="Key_search_Click" />
                                            <%--<button class="site-button text-uppercase"><i class="fa m-r5 fa-search"></i> Search</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="party" class="tab-pane">
                                <div>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="What are you looking for?">
                                        <div class="form-control">
                                            <select>
                                                <option>Select Category</option>
                                                <option>Construction</option>
                                                <option>Corodinator</option>
                                                <option>Employer</option>
                                                <option>Financial Career</option>
                                                <option>Information Technology</option>
                                                <option>Marketing</option>
                                                <option>Quality check</option>
                                                <option>Real Estate</option>
                                                <option>Sales</option>
                                                <option>Supporting</option>
                                                <option>Teaching</option>
                                            </select>
                                        </div>
                                        <div class="input-group-prepend">
                                            <button class="site-button text-uppercase"><i class="fa m-r5 fa-search"></i>Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="restauren" class="tab-pane">
                                <div>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="What are you looking for?">
                                        <div class="form-control">
                                            <select>
                                                <option>Select Category</option>
                                                <option>Construction</option>
                                                <option>Corodinator</option>
                                                <option>Employer</option>
                                                <option>Financial Career</option>
                                                <option>Information Technology</option>
                                                <option>Marketing</option>
                                                <option>Quality check</option>
                                                <option>Real Estate</option>
                                                <option>Sales</option>
                                                <option>Supporting</option>
                                                <option>Teaching</option>
                                            </select>
                                        </div>
                                        <div class="input-group-prepend">
                                            <button class="site-button text-uppercase"><i class="fa m-r5 fa-search"></i>Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="text-center text-white m-b10 m-t30" style="font-size: 28px; font-weight: bold; text-shadow: 3px 3px 3px black;">Follow Us : </p>
                    </div>

                    <div class="category-bx">
                        <a href="listing-left-sidebar.html" class="category">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                            <p>Facebook</p>
                        </a>
                        <a href="listing-left-sidebar.html" class="category">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <p>Instagram</p>
                        </a>
                        <a href="listing-left-sidebar.html" class="category">
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <p>Twitter</p>
                        </a>
                        <a href="listing-left-sidebar.html" class="category">
                            <i class="fa fa-youtube-square" aria-hidden="true"></i>
                            <p>YouTube</p>
                        </a>

                    </div>
                </div>
            </div>
        </div>
        <!-- Section Banner END -->
    </div>


    <!-- Search Filter -->
    <div class="section-full">
        <div class="container">
        </div>
    </div>
    <!-- Search Filter END -->
    <div class="content-block">
        <!-- Featured Destinations -->
        <div class="section-full bg-white content-inner">
            <div class="container">
                <div class="section-head text-black text-center">

                    <h2 class="box-title">Our Categories</h2>
                    <div class="dlab-separator bg-primary"></div>
                    <p>A home is more than just a place; it's a sanctuary where we find comfort, joy, and a reflection of our inner selves. The colors on the walls, the carefully chosen furniture, and the little details scattered around all weave together a story that is uniquely ours.</p>
                </div>
                <div class="row">
                    <asp:ListView ID="list_Category" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="featured-bx m-b30">
                                    <a href="CategoryDetail.aspx?SelectedId=<%# Eval("id") %>">
                                        <div class="featured-media">
                                            <img src="Admin/images1/category/<%# Eval("image") %>" alt="">
                                        </div>
                                        <div class="featured-info">
                                            <h5 class="title"><a href="CategoryDetail.aspx?SelectedId=<%# Eval("id") %>"><%# Eval("category") %></a></h5>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <!-- Featured Destinations End -->
          <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bgg mb-5" style="background:linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(Admin/images1/banner/slide1.jpg);height:300px; background-size:100% 100%;">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Services -->
        <div class="section-full bg-gray content-inner about-us">
            <div class="container-fluid">
                <div class="section-head text-black text-center">
                    <h2 class="box-title">Our Products</h2>
                    <div class="dlab-separator bg-primary"></div>
                    <p>Designing a home is akin to composing a symphony of emotions, textures, and colors. It is a canvas upon which we paint the story of our existence, using furniture, art, and decor as the medium of self-expression. </p>
                </div>
                <div class="most-visite owl-carousel owl-btn-center-lr owl-btn-1 primary">
                    <asp:ListView ID="lst_Mini_Category_detail" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <div class="listing-bx featured-star-left m-b30">
                                    <div class="listing-media">
                                        <img src="Admin/images1/MiniCatwgory/<%# Eval("image1") %>" alt="">
                                      
                                    </div>
                                    <div class="listing-info">
                                        <h3 class="title"><a href="listing-details.html"><%# Eval("Heading").ToString().PadRight(40).Substring(0,40).TrimEnd() %>..</a></h3>
                                        <p><%# Eval("Para").ToString().PadRight(60).Substring(0,60).TrimEnd() %>.....</p>
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
        <!-- Our Services -->
      

        <!-- Why Choose Us -->
        <div class="section-full bg-white content-inner-2 bg-img-fix overlay-black-dark owl-out" style="background-image:url(images/background/bg1.jpg); background-position: left bottom;">
                <div class="container">
					<div class="section-head text-center text-white">
						<h2 class="box-title">What Our Customers Say</h2>
						<div class="dlab-separator bg-primary"></div>
						<p>Each piece of decor is like a bookmark, holding a chapter of our lives—whether it's the vintage mirror that witnessed countless reflections or the cozy corner that cradled our deepest conversations.</p>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div id="owl-demo" class="testimonial-one owl-loaded owl-theme owl-carousel owl-btn-center-lr owl-btn-3 btn-white owl-dots-primary-big style-2">
									
                                    <asp:ListView ID="ListView2" runat="server">
                                        <ItemTemplate>
                                    <div class="item">
										<div class="testimonial-2 testimonial-bg">
											<div class="testimonial-text">
												<p><%# Eval("comment") %></p>
											</div>
											<div class="testimonial-detail clearfix">
												<div class="testimonial-pic quote-left radius shadow"><img src="Admin/images1/commenter/<%# Eval("image") %>" width="100" height="100" alt=""></div>
												<strong class="testimonial-name"><%# Eval("c_name") %></strong>  
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

        <!-- Featured Destinations -->
        <div class="section-full bg-white content-inner">
            <div class="container">
                <div class="section-head text-black text-center">
                    <h2 class="box-title">From The Blog</h2>
                    <div class="dlab-separator bg-primary"></div>
                    <p>The journey of transforming a house into a home is a poetic exploration of self-discovery and expression. As we walk through the corridors of our homes, we traverse the landscape of our memories.</p>
                </div>
                <div class="blog-carousel owl-carousel owl-none blog-shadow-out">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <div class="blog-post dez-blog">
                                    <div class="dlab-post-media">
                                        <a href="blog-details.html">
                                            <img src="Admin/images1/MiniCatwgory/<%# Eval("image") %>" alt=""></a>
                                    </div>
                                    <div class="dlab-info">
                                        
                                        <div class="dlab-post-title ">
                                            <h5 class="post-title"><a href="blog-details.html"><%# Eval("Heading").ToString().PadRight(67).Substring(0,67).TrimEnd()  %>.</a></h5>
                                        </div>
                                        <div class="dlab-post-text">
                                            <p><%# Eval("Para").ToString().PadRight(100).Substring(0,100).TrimEnd()  %></p>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <!-- Featured Destinations End -->
    </div>
    <!-- contact area END -->

    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var showChar = 40,
                showtxt = "Read More",
                hidetxt = "Read Less";
            $('.more').each(function () {
                var content = $(this).text();
                if (content.length > showChar) {
                    var con = content.substr(0, showChar);
                    var hcon = content.substr(showChar, content.length - showChar);
                    var txt = con + '<span class="dots">...</span><span class="morecontent"><span>' + hcon + '</span>&nbsp;&nbsp;<a href="" class="moretxt">' + showtxt + '</a></span>';
                    $(this).html(txt);
                }
            });
            $(".moretxt").click(function () {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).text(showtxt);
                } else {
                    $(this).addClass("less");
                    $(this).text(hidetxt);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });
    </script>


</asp:Content>

