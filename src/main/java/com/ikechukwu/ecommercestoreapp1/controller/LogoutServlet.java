package com.ikechukwu.ecommercestoreapp1.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("auth") != null) {
            request.getSession().removeAttribute("auth");
            response.sendRedirect("userLogin.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
