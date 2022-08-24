package com.ikechukwu.ecommercestoreapp1.dao;

import com.ikechukwu.ecommercestoreapp1.model.Order;
import com.ikechukwu.ecommercestoreapp1.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;



    public OrderDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE userId = ? ORDER BY orders.orderId DESC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("productId");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("productId"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("orderQty"));
                order.setQunatity(rs.getInt("orderQty"));
                order.setDate(rs.getString("orderDate"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "DELETE FROM orders WHERE orderId = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}