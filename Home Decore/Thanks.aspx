<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
.thankyou-wrapper{
  width:100%;
  height:auto;
  margin:auto;
  background:#ffffff; 
  padding:10px 0px 50px;
}
.thankyou-wrapper h1{
  font:100px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding:0px 10px 10px;
}
.thankyou-wrapper p{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding:5px 10px 10px;
}
.thankyou-wrapper a{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#ffffff;
  display:block;
  text-decoration:none;
  width:250px;
  background:#4611a7;
  margin:10px auto 0px;
  padding:15px 20px 15px;
  border-bottom:5px solid #4611a7;
}
.thankyou-wrapper a:hover{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#ffffff;
  display:block;
  text-decoration:none;
  width:250px;
  background:#4611a7;
  margin:10px auto 0px;
  padding:15px 20px 15px;
  border-bottom:5px solid #4611a7;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
       <section class="login-main-wrapper">
      <div class="main-container">
          <div class="login-process">
              <div class="login-main-container">
                  <div class="thankyou-wrapper">
                      <h1><img src="http://montco.happeningmag.com/wp-content/uploads/2014/11/thankyou.png" alt="thanks" /></h1>
                        <p>for contacting us, we will get in touch with you soon... </p>
                        <a href="index.aspx">Back to Home</a>
                        <div class="clr"></div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </section>
    </form>
</body>
</html>
