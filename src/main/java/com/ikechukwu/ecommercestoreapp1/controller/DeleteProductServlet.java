package com.ikechukwu.ecommercestoreapp1.controller;

import com.ikechukwu.ecommercestoreapp1.dao.ProductDao;
import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDao dao = new ProductDao(DBConnection.getConnection());
        if (dao.deleteProducts(id)){
            RequestDispatcher rp = request.getRequestDispatcher("adminPage.jsp");
            rp.forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

