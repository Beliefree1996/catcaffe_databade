package com.bb.dao;

import com.bb.domain.Employee;
import com.bb.domain.Product;
import com.bb.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    public List<Product> findAll() {
        ArrayList<Product> Products = new ArrayList<Product> ();
        Connection connection = DBUtil.getConnectDb();
        String sql = "select * from product";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCost(rs.getInt("cost"));
                product.setSale(rs.getInt("sale"));
                Products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs,stm,connection);
        }
        return Products;
    }

    public void addProduct(String name, int sale, int cost) {
        {
            Connection conn = DBUtil.getConnectDb();
            String sql = "insert into product(name,sale,cost) values(?,?,?)";
            int rs = 0;
            PreparedStatement stm = null;
            try {
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                stm.setInt(2, sale);
                stm.setInt(3, cost);
                rs = stm.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateProduct(int id, String name, int sale, int cost) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "update product set name=?,sale=?,cost=? where id=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, sale);
            stm.setInt(3, cost);
            stm.setInt(4, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void deleteProduct(Integer id) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "delete from product where id=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getLikeList(String name) {
        ArrayList<Product> tag_Array = new ArrayList<>();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from product where name like '%"+name+"%'";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while(rs.next()){
                Product tag = new Product();
                tag.setName(rs.getString("name"));
                tag.setSale(rs.getInt("sale"));
                tag.setCost(rs.getInt("cost"));
                tag_Array.add(tag);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.CloseDB(rs, stm, conn);
        }
        return tag_Array;
    }
}
