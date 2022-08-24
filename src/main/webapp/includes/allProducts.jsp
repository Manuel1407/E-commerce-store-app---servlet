
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.dao.ProductDao" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.util.DBConnection" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.model.Product" %>
<%@ page import="com.ikechukwu.ecommercestoreapp1.model.Cart" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String auth = (String) request.getSession().getAttribute("username");
//    if (auth == null) {
//        response.sendRedirect("login.jsp");
//    }
  ProductDao pd = new ProductDao(DBConnection.getConnection());
  List<Product> products = pd.getAllProducts();
  ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
  if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
  }
%>

<div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">S/N</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
        </tr>
        </thead>
        <tbody>
            <%
      ProductDao productDao = new ProductDao(DBConnection.getConnection());
  List<Product> productList = productDao.getAllProducts();
  int index = 1;
  %>
            <%

  for(Product product : productList){%>
        <tr>
            <th scope="row"><%=index++%></th>
            <td><%=product.getName()%></td>
            <td><%=product.getCategory()%></td>
            <td><%=product.getPrice()%></td>
            <td><%=product.getQuantity()%></td>
            <td><a class="btn btn-info" href="UpdateProduct?id=<%=product.getId()%>">Edit</a>&nbsp;
                <a class="btn btn-danger" href="DeleteProduct?id=<%=product.getId()%>">Delete</a>
            </td>
        </tr><%} %>
</div>

