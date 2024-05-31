<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home Decore Portal.master" AutoEventWireup="true" CodeFile="ApprovedComments.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-scroller">
    <!-- partial:../../partials/_horizontal-navbar.html -->
         <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <h4 class="card-title">Approved Comments</h4>

            <div class="row">
                <asp:ListView ID="lv_comment" runat="server" OnItemDataBound="lv_comment_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-11 mx-5 mt-3">
                            <div class="card">
                                <div class="card-body">

                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <h4 class="card-title">
                                        <img src="../Admin/images1/commenter/<%# Eval("image") %>" style="float: left;" class="rounded-circle me-5" height="150px" width="150px" /></h4>
                                            <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>
                                  
                                    <h1 class="card-description">
                                        <%# Eval("c_name") %>
                                    </h1>
                                    <p>
                                        <%# Eval("comment") %>
                                    </p> <p>
                                        <%# Eval("email") %>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <!-- page-body-wrapper ends -->
  </div>

</asp:Content>

