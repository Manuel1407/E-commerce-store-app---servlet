package com.ikechukwu.ecommercestoreapp1.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "adminLoginServlet", value = "/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uName = request.getParameter("username");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmmyStores", "root", "Current1");
            PreparedStatement pst = connection.prepareStatement("select * from Admin where username = ? and password = ? ");
            pst.setString(1, uName);
            pst.setString(2, pass);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
                dispatcher = request.getRequestDispatcher("adminPage.jsp");             // Admin homepage
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("adminLogin.jsp");
            }
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
