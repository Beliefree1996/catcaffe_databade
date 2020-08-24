package com.bb.dao;
import	java.sql.ResultSet;
import com.bb.domain.Employee;
import com.bb.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import	java.util.List;

public class EmployeeDao {
    /**
     * 查询所有
     * @return
     */
    public List<Employee> findAll() {
        ArrayList<Employee> employees = new ArrayList<Employee> ();
        Connection connection = DBUtil.getConnectDb();
//        String sql = "select * from employee";
        String sql = "select e.id, e.name ename, e.age, e.gender, e.home_address, e.month_salary, e.technical_title, u.username uname from employee as e, user as u where e.userId=u.id";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setName(rs.getString("ename"));
                employee.setAge(rs.getInt("age"));
                employee.setGender(rs.getString("gender"));
                employee.setHomeAddress(rs.getString("home_address"));
                employee.setManager(rs.getString("uname"));
                employee.setMonthSalary(rs.getString("month_salary"));
                employee.setTechnicalTitle(rs.getString("technical_title"));
                employees.add(employee);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs,stm,connection);
        }
        return employees;
    }

    /**
     * 添加员工
     * @param name
     * @param gender
     * @param age
     * @param technicalTitle
     * @param monthSalary
     * @param homeAddress
     */
    public void addEmployee(String name, String gender, int age, String technicalTitle, String monthSalary, String homeAddress) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "insert into employee(name,gender,age,technical_title,month_salary,home_address) values(?,?,?,?,?,?)";
        int rs = 0;
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, gender);
            stm.setInt(3, age);
            stm.setString(4, technicalTitle);
            stm.setString(5, monthSalary);
            stm.setString(6, homeAddress);
            rs = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEmployee(Integer id) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "delete from employee where id=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Employee> getLikeList(String name) {
        ArrayList<Employee> tag_Array = new ArrayList<Employee>();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from employee where name like '%"+name+"%'";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while(rs.next()){
                Employee tag = new Employee();
                tag.setName(rs.getString("name"));
                tag.setGender(rs.getString("gender"));
                tag.setAge(rs.getInt("age"));
                tag.setTechnicalTitle(rs.getString("technical_title"));
                tag.setMonthSalary(rs.getString("month_salary"));
                tag.setHomeAddress(rs.getString("home_address"));
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
