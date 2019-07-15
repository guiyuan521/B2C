package com.st.ssm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class JDBCUtil {
	private static ResourceBundle rb = ResourceBundle.getBundle("com.situ.jsp.util.zzy");
	
	private static String className = rb.getString("driver");
	private static String 	url		= rb.getString("url");
	private static String	user	= rb.getString("user");
	private static String	password= rb.getString("password");
	
	static {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
	
	public static void close(Connection connection,Statement statement,ResultSet resultSet) {
		try {
			if(resultSet != null) {
				resultSet.close();
				resultSet = null;
			}
			if(statement != null) {
				statement.close();
				statement = null;
			}
			if(connection != null) {
				connection.close();
				connection = null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection connection,Statement statement) {
		close(connection,statement,null);
	}
	
	public static void main(String[] args) throws SQLException {
		Connection con = JDBCUtil.getConnection();
		System.out.println(con);
		JDBCUtil.close(con, null);
	}
	
	private JDBCUtil() {
	}
}
