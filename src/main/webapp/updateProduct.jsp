<%@ page import="com.ikechukwu.ecommercestoreapp1.model.User" %>
<%
    String auth = (String) request.getSession().getAttribute("username");
    if (auth == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>NfoTECH stores</title>
</head>

<body>
<%
  String name = (String) request.getAttribute("name");
  String category = (String) request.getAttribute("category");
  Double price = (Double) request.getAttribute("price");
  int quantity = (int) request.getAttribute("quantity");
%>

<!-- Start All Title Box -->
<div class="all-title-box">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="adminMainPage.jsp">Back</a></li>
<%--          <li class="breadcrumb-item active"> Update Page </li>--%>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- End All Title Box -->

<!-- Start Contact Us  -->
<div class="contact-box-main">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-sm-12">
        <div class="contact-form-right">
          <form method="post" action="UpdateProduct">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" class="form-control" value="<%=name%>" name="name" placeholder="Product" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" class="form-control" value="<%=category%>"  name="category" placeholder="category" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" class="form-control" name="quantity" value="<%=quantity%>"  placeholder="productQuantity" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" class="form-control" name="price" placeholder="Price" value="<%=price%>" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="submit-button text-center">
                  <button class="btn hvr-hover" id="submit" type="submit">Update</button>
                </div>
              </div>
              <div class="col-md-12 d-flex justify-content-center">
                <h1 style="color: Green">${UpdateSuccess}</h1><br>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<!-- Start Footer  -->
<footer>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</footer>
<!-- End Footer  -->

<!-- Start copyright  -->
<div class="footer-copyright">
  <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">Nfotech Stores</a></p>
</div>
<!-- End copyright  -->

<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

<!-- ALL JS FILES -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="js/jquery.superslides.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="js/inewsticker.js"></script>
<script src="js/bootsnav.js."></script>
<script src="js/images-loded.min.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/baguetteBox.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/custom.js"></script>
</body>

</html>