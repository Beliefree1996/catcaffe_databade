package com.bb.dao;



import com.bb.domain.User;
import com.bb.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 有关账号的连接数据库操作，登录验证，注册，修改账号，修改密码
 */
public class UserDao {
	
	/**
	 * 登录验证功能，传入用户名和密码，在数据库中查找，如果找到了，返回true，没找到则返回false
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean Login_verify(String username,String password){//username & password as input
		Connection conn = DBUtil.getConnectDb();//连接数据库
		String sql = "select * from user where username='"+username+"' and password='"+password + "'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if(rs.next()){
				return true;//if this sql string is executable, it's legal login
			}
		} catch (SQLException e) {
			e.printStackTrace();//exception
		}finally{
			DBUtil.CloseDB(rs, stm, conn);//close database
		}
		return false;//if not executable
	}

	/**
	 * 根据传入的账号，密码，来查找对应的读者信息，返回一个User类型，
	 * @param username
	 * @param password
	 * @return
	 */
	public User getUserInfo(String username, String password) {
		User User = new User();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from user where username='"+username+"' and password='"+password + "'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
//			stm.setString(1,name);
			rs = stm.executeQuery();
			if(rs.next()){
				User.setId(rs.getInt("id"));
				User.setUsername(rs.getString("username"));
				User.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return User;
	}

	/**
	 * 根据传入的id，，返回一个User类型的数据，与上一个相似，只是id的类型为String，
	 * @param id
	 * @return
	 */
	public User get_AidInfo2(String id){
		User User = new User();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from user where id="+id;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if(rs.next()){
				User.setId(rs.getInt("id"));
				User.setUsername(rs.getString("username"));
				User.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return User;
	}
	
	/**
	 * 注册管理员账号的，传入账号，密码
	 * @param username
	 * @param password
	 */
	public void Register(String username, String password) {
				Connection conn = DBUtil.getConnectDb();
				String sql = "insert into user(username,password) values(?,?)";
				int rs = 0;
				PreparedStatement stm = null;
				try {
					stm = conn.prepareStatement(sql);
					stm.setString(1, username);
					stm.setString(2, password);
					rs = stm.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}



}
