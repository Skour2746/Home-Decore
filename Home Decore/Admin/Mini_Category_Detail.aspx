<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home Decore Portal.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Mini_Category_Detail.aspx.cs" Inherits="Admin_Mini_Category_Detail" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-scroller">
        <!-- partial:../../partials/_horizontal-navbar.html -->
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Mini-Category Detail</h4>


                                    <div class="forms-sample">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Category</b></label><br />
                                                    <asp:DropDownList ID="ddcategory" class="form-control js-example-basic-single w-100" runat="server" DataTextField="category" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>

                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>SubCategory</b></label><br />
                                                    <asp:DropDownList ID="ddsubcategory" class="form-control js-example-basic-single w-100" runat="server" DataTextField="SubCategory" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddsubcategory_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>

                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Mini-Category</b></label><br />
                                                    <asp:DropDownList ID="ddminicategory" class="form-control js-example-basic-single w-100" runat="server" DataTextField="minicategory" DataValueField="id">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Image</b></label><br />
                                                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                                    <asp:Image ID="Image1" runat="server" Height="100px" />
                                                </div>
                                            </div>

                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Image1</b></label><br />
                                                    <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" />
                                                    <asp:Image ID="Image2" runat="server" Height="100px" />

                                                </div>
                                            </div>

                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Image2</b></label><br />
                                                    <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" />
                                                    <asp:Image ID="Image3" runat="server" Height="100px" />
                                                </div>
                                            </div>
                                               <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Image4</b></label><br />
                                                    <asp:FileUpload ID="FileUpload5" class="form-control" runat="server" />
                                                    <asp:Image ID="Image5" runat="server" Height="100px" />
                                                </div>
                                            </div>


                                        </div>

                                        <div class="row">
                                         
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Heading</b></label>
                                                    <asp:TextBox ID="txtheading" runat="server" type="text" class="form-control" placeholder="Enter Category Name"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="exampleInputUsername1"><b>Rate</b></label>
                                                    <asp:TextBox ID="txtrate" runat="server" type="text" class="form-control" placeholder="Enter Rate"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Paragraph</label>
                                            <asp:TextBox ID="txtpara" TextMode="MultiLine" runat="server" Width="100%" Height="300"></asp:TextBox>

                                            <script type="text/javascript">
                                                CKEDITOR.replace('<%=txtpara.ClientID%>');
                                            </script>
                                        </div>


                                        <asp:Button ID="submit" runat="server" type="submit" OnClick="submit_Click" class="btn btn-primary me-2" Text="Submit" />

                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Mini-Category Table</h4>

                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th>cid</th>
                                                    <th>SubCategory_id</th>
                                                    <th>Mini_Category</th>

                                                    <th>image</th>
                                                    <th>image1</th>
                                                    <th>image2</th>
                                                    <th>image3</th>
                                                    <th>image4</th>
                                                    <th>Heading</th>
                                                    <th>Detail</th>
                                                    <th>Rate</th>
                                                    <th>status</th>
                                                    <th>rts</th>
                                                    <th>Change<br />
                                                        Status</th>

                                                    <th>Edit</th>




                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                                <asp:ListView ID="lstminicategorydetail" runat="server" OnItemCommand="lstminicategory_ItemCommand" OnItemEditing="lstminicategory_ItemEditing">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cid") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblsubcat" runat="server" Text='<%# Eval("Subid") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblminicat" runat="server" Text='<%# Eval("MiniCid") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblimage1" runat="server" Text='<%# Eval("image1") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblimage2" runat="server" Text='<%# Eval("image2") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblimage4" runat="server" Text='<%# Eval("image4") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblpara" runat="server" Text='<%# Eval("Para") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblRate" runat="server" Text='<%# Eval("Rate") %>' Visible="false"></asp:Label>



                                                            <td><%# Eval("id") %></td>
                                                            <td><%# Eval("cid") %></td>
                                                            <td><%# Eval("Subid") %></td>
                                                            <td><%# Eval("MiniCid") %></td>
                                                            <td>
                                                                <img src="images1/MiniCatwgory/<%# Eval("image") %>" alt="" /></td>
                                                            <td>
                                                                <img src="images1/MiniCatwgory/<%# Eval("image1") %>" alt="" /></td>
                                                            <td>
                                                                <img src="images1/MiniCatwgory/<%# Eval("image2") %>" alt="" /></td>
                                                            <td>
                                                                <img src="images1/MiniCatwgory/<%# Eval("image4") %>" alt="" /></td>

                                                            <td><%# Eval("Heading") %></td>
                                                            <td><%# Eval("Para") %></td>
                                                            <td><%# Eval("Rate") %></td>
                                                            <td><%# Eval("status") %></td>
                                                            <td><%# Eval("rts") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="btnChangeStatus" type="submit" CommandName="active" class="btn btn-primary me-2 bg-secondary border-secondary" Visible='<%# Eval("status").ToString() == "1" ? false : true%>' runat="server"><i class="fa fa-play" aria-hidden="true"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="Button3" type="submit" CommandName="deactive" class="btn btn-primary me-2 bg-warning border-warning" Visible='<%# Eval("status").ToString() == "0" ? false : true%>' runat="server"><i class="fa fa-pause" aria-hidden="true"></i></asp:LinkButton>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="btnedit" type="submit" CommandName="edit" class="btn btn-primary me-2" runat="server"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>



                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>


</asp:Content>

