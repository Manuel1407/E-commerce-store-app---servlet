package com.ikechukwu.ecommercestoreapp1.controller;

import com.ikechukwu.ecommercestoreapp1.dao.ProductDao;
import com.ikechukwu.ecommercestoreapp1.model.Product;
import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateProduct", value = "/UpdateProduct")
public class UpdateProductServlet extends HttpServlet {
    ProductDao productDao = new ProductDao(DBConnection.getConnection());
    int id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        Product product =  productDao.getSingleProduct(id);
        request.setAttribute("name",product.getName());
        request.setAttribute("category",product.getCategory());
        request.setAttribute("price",product.getPrice());
        request.setAttribute("quantity",product.getQuantity());

        RequestDispatcher rp = request.getRequestDispatcher("updateProduct.jsp");
        rp.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        product.setName(name);
        product.setQuantity(quantity);
        product.setPrice(price);
        product.setCategory(category);
        product.setId(id);
        try {
            if (productDao.updateProduct(product)){
                request.setAttribute("UpdateSuccess", "Product updated Successfully");
                request.getRequestDispatcher("adminPage.jsp").forward(request,response);
            }
        }
        catch (Exception e){
            e.getMessage();
        }

    }
}
