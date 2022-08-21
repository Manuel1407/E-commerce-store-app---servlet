package com.ikechukwu.ecommercestoreapp1;

import com.ikechukwu.ecommercestoreapp1.dao.UserDao;
import com.ikechukwu.ecommercestoreapp1.model.User;
import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "userLoginServlet", value = "/userLoginServlet")
public class userLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("userLogin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mail = request.getParameter("email");
        String pass = request.getParameter("password");

        UserDao udao = new UserDao(DBConnection.getConnection());
        User user = udao.userLogin(mail, pass);

        if (user != null) {
            request.getSession().setAttribute("auth", user);
            response.sendRedirect("index.jsp");
        } else {
            out.print("user login failed");
        }


    }
}
