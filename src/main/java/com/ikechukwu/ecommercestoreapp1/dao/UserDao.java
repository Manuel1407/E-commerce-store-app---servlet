package com.ikechukwu.ecommercestoreapp1.dao;

import com.ikechukwu.ecommercestoreapp1.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private Connection connect;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection connect) {
        this.connect = connect;
    }

    public User userLogin(String email, String password) {
        User user = null;

        try {
            query = "select * from users where email = ? and password = ?";
            pst = this.connect.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if(rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("firstname"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}
