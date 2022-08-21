<%@ page import="com.ikechukwu.week6taskiyke.model.User" %>
<%@ page import="com.ikechukwu.week6taskiyke.dao.ProductDao" %>
<%@ page import="com.ikechukwu.week6taskiyke.util.DBConnection" %>
<%@ page import="com.ikechukwu.week6taskiyke.model.Product" %>
<%@ page import="com.ikechukwu.week6taskiyke.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<br/>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">EmmyStores</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${ cart_list.size() }</span> </a></li>
                <% if (auth != null) { %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="userLogin.jsp">Logout</a></li>
                <% } else {%>
                <li class="nav-item"><a class="nav-link" href="userLogin.jsp">Login</a></li>
                <% } %>
            </ul>
        </div>
    </nav>
</div>

