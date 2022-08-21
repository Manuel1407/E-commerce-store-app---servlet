package com.ikechukwu.ecommercestoreapp1.dao;

import com.ikechukwu.ecommercestoreapp1.model.Cart;
import com.ikechukwu.ecommercestoreapp1.model.Product;
import com.ikechukwu.ecommercestoreapp1.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connect;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;


    public ProductDao(Connection connect) {
        this.connect = connect;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();

        try {
            query = "select * from products";
            pst = this.connect.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }

    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "select * from products where id=? ";

            pst = this.connect.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.connect.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.connect.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    public boolean addProduct(Product product) {
        try {
            String Query = "INSERT INTO products (name,category,price,quantity) VALUES" + "(?,?,?,?);";
            pst = DBConnection.getConnection().prepareStatement(Query);
            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setInt(4, product.getQuantity());

            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }

    public boolean deleteProducts(int id) {
        try {
            String Query = "DELETE from products WHERE id = ?";
            pst = DBConnection.getConnection().prepareStatement(Query);
            pst.setInt(1,id);

            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }

    public boolean updateProduct(Product product) {
        try {
            String Query = "Update products set name = ?,category = ?,price =?,quantity = ? where id = ?";
            pst = DBConnection.getConnection().prepareStatement(Query);
            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setInt(4, product.getQuantity());
            pst.setInt(5, product.getId());


            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }
    
}