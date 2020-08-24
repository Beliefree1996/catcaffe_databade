package com.bb.dao;

import com.bb.domain.Cat;
import com.bb.domain.Employee;
import com.bb.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CatDao {
    public List<Cat> findAll() {   //to find all information of cat table
        ArrayList<Cat> Cats = new ArrayList<Cat> ();
        Connection connection = DBUtil.getConnectDb();
        String sql = "select c.id, c.name cname, c.age, c.gender, c.price, c.attendance, e.name ename from cat as c, employee as e where c.employeeID=e.id";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Cat cat = new Cat();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("cname"));
                cat.setAge(rs.getInt("age"));
                cat.setGender(rs.getString("gender"));
                cat.setPrice(rs.getInt("price"));
                cat.setBreeder(rs.getString("ename"));
                cat.setAttendance(rs.getString("attendance"));
                Cats.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs,stm,connection);
        }
        return Cats;
    }

    //add a cat information
    public void addCat(String name, String gender, int age, int price, String attendance, int employeeID) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "insert into cat(name,age,gender,price,attendance,employeeID) values(?,?,?,?,?,?)";
        int rs = 0;
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, age);
            stm.setString(3, gender);
            stm.setInt(4, price);
            stm.setString(5, attendance);
            stm.setInt(6, employeeID);
            rs = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCat(Integer id) {//to delete one cat information according to its id
        Connection conn = DBUtil.getConnectDb();
        String sql = "delete from cat where id=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Cat> getLikeList(String name) {//to select cet having one specific name
        ArrayList<Cat> tag_Array = new ArrayList<>();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from cat where name like '%"+name+"%'";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while(rs.next()){
                Cat tag = new Cat();
                tag.setName(rs.getString("name"));
                tag.setGender(rs.getString("gender"));
                tag.setAge(rs.getInt("age"));
                tag.setGender(rs.getString("gender"));
                tag.setPrice(rs.getInt("price"));
                tag.setAttendance(rs.getString("attendance"));
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
