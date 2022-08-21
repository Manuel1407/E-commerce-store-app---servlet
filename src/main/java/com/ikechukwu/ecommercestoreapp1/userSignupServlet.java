package com.ikechukwu.ecommercestoreapp1;

import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "userSignupServlet", value = "/userSignupServlet")

public class userSignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uFName = request.getParameter("firstname");
        String uLName = request.getParameter("lastname");
        String uEmail = request.getParameter("email");
        String uPhone = request.getParameter("phone");
        String uPass = request.getParameter("password");
        String uCPass = request.getParameter("Cpassword");
        RequestDispatcher dispatcher = null;
        Connection connection = null;

        if (!uPass.equals(uCPass)) {
            request.setAttribute("status", "invalidRePassword");
            dispatcher = request.getRequestDispatcher("userSignup.jsp");
            dispatcher.forward(request, response);
        }

        PreparedStatement pst = null;
        int rowCount;
        try {
            pst = DBConnection.getConnection().prepareStatement("insert into users(firstname,lastname,email,phoneNo,password) values(?,?,?,?,?) ");
            pst.setString(1, uFName);
            pst.setString(2, uLName);
            pst.setString(3, uEmail);
            pst.setString(4, uPhone);
            pst.setString(5, uPass);

            rowCount = pst.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        dispatcher = request.getRequestDispatcher("userSignup.jsp");
        if (rowCount > 0) {
            request.setAttribute("status", "success");
        } else {
            request.setAttribute("status", "failed");
        }
        dispatcher.forward(request, response);

    }
}
