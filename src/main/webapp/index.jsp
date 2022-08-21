<%@ page import="com.ikechukwu.ecommercestoreapp1.util.DBConnection" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.dao.ProductDao" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.model.Product" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.model.Cart" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    ProductDao pd = new ProductDao(DBConnection.getConnection());
    List<Product> products = pd.getAllProducts();
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Homepage</title>
</head>
<body>

<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
            if(!(products.isEmpty())){
                for(Product p:products){
        %>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <img src="productImage/<%=p.getImage()%>" class="card-img-top" alt="Card images cap">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getName()%></h5>
                    <h6 class="price">Price: N<%=p.getPrice()%></h6>
                    <h6 class="category">Category: <%=p.getCategory()%></h6>
                    <div class="my-3 justify-content-between">
                        <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart</a>
                        <a href="#" class="btn btn-primary">Like</a>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <%}
        }
        %>
    </div>
</div>
</body>
</html>