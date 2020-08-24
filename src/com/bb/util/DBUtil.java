package com.bb.util;

import java.sql.*;

public class DBUtil {
	public static String username = "root";
	public static String password = "CXin082310";//要改成自己的mysql密码
	public static String url = "jdbc:mysql://localhost:3306/cat?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnectDb() {//次类用来处理对数据库的连接操作
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	//数据库 关闭
	public static void CloseDB(ResultSet rs, PreparedStatement stm, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();//数据库关闭异常
			}
		}
		if (stm != null) {
			try {
				stm.close();
			} catch (SQLException e) {
				e.printStackTrace();//数据库关闭异常
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();//数据库关闭异常
			}
		}
	}
}
