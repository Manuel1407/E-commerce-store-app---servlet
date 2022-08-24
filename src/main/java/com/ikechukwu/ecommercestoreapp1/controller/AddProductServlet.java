package com.ikechukwu.ecommercestoreapp1.controller;

import com.ikechukwu.ecommercestoreapp1.dao.ProductDao;
import com.ikechukwu.ecommercestoreapp1.model.Product;
import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AddProductServlet", value = "/AddProduct")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("adminPage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product();
        product.setName(productName);
        product.setCategory(category);
        product.setPrice(Double.valueOf(price));
        product.setQuantity(quantity);
        ProductDao productDao = new ProductDao(DBConnection.getConnection());
        if(productDao.addProduct(product)){
            request.setAttribute("Success", "Product Added successfully");
            request.getRequestDispatcher("adminPage.jsp").forward(request, response);
        }
    }
}