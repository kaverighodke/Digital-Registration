package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DatabaseUtil {

	public static final String URL = "jdbc:mysql://localhost:3306/stackhack?characterEncoding=latin1";
	public static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "root";

	public static Connection getConnection() {
		Connection con = null;

		try {
			Class.forName(DRIVER_NAME);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}

	public static void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	public static void closeStatement(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
