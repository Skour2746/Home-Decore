<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home Decore Portal.master" AutoEventWireup="true" CodeFile="Sub-Category.aspx.cs" Inherits="Admin_Sub_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-scroller">
    <!-- partial:../../partials/_horizontal-navbar.html -->
         <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-4 grid-margin">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Sub-Category Form</h4>
                 
                  <div class="forms-sample">
                       <div class="form-group">
                      <label for="exampleInputUsername1">Category</label><br />
                       <asp:DropDownList ID="ddcategory" class="js-example-basic-single w-100" runat="server" DataTextField="category" DataValueField="id">

        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputUsername1">Sub-Category</label>
        <asp:TextBox ID="txtsubcategory" runat="server" type="text" class="form-control" placeholder="Enter Category Name"></asp:TextBox>
                    </div>
                       <div class="form-group">
                      <label for="exampleInputUsername1">Image</label><br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
                           <asp:Image ID="Image1" runat="server" />
                    </div>
        <asp:Button ID="Button1" runat="server" type="submit" OnClick="Button1_Click"  class="btn btn-primary me-2" Text="Submit" />

                  </div>
                </div>
              </div>
            </div>


              <div class="col-lg-8 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Sub-Category Table</h4>
                
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>id</th>
                          <th>cid</th>
                          <th>Sub-Category</th>
                          <th>image</th>
                          <th>status</th>
                          <th>rts</th>
                          <th>Change<br /> Status</th>
                        
                          <th>Edit</th>




                        </tr>
                      </thead>
                      <tbody>
                <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                <asp:ListView ID="lstsubcategory" runat="server" OnItemCommand="lstsubcategory_ItemCommand" OnItemEditing="lstsubcategory_ItemEditing">
                    <ItemTemplate>
                        <tr>
                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblSubCategory" runat="server" Text='<%# Eval("SubCategory") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false"></asp:Label>

                          <td><%# Eval("id") %></td>
                          <td><%# Eval("cid") %></td>
                          <td><%# Eval("SubCategory") %></td>
                          <td ><img src="images1/<%# Eval("image") %>" alt="" />  </td>
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

