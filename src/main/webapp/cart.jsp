
<%@ page import="com.ikechukwu.ecommercestoreapp1.util.DBConnection" %>

<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.model.Cart" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.dao.ProductDao" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DBConnection.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>

<html>
<head>
    <title>Cart</title>
</head>
<body>

<%@include file="includes/navbar.jsp"%>

    <br/>
    <div class="container my-3">
        <div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3>
            <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
        <table class="table table-light">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Price</th>
                <th scope="col">Buy Now</th>
                <th scope="col">Cancel</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
            %>
            <tr>
                <td><%= c.getName()%></td>
                <td><%= c.getCategory()%></td>
                <td><%= dcf.format(c.getPrice())%></td>
                <td>
                    <form action="order-now" method="post" class="form-inline">
                        <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                        <div class="form-group d-flex justify-content-between">
                            <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
                            <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly>
                            <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                    </form>
                </td>
                <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
            </tr>
            <%
                    }}%>
            </tbody>
        </table>
    </div>
</body>
</html>
