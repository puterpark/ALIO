package com.kosmo.alio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
	//JDBC java 
public class DBConnect {
	final static String  URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final static String  USER = "alio";
	final static String  PASSWORD = "1111";
	
	
//	public static void main(String[] a) {
	public Connection dbConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch (ClassNotFoundException e){
			e.printStackTrace();
		}
		
		Connection conn=null;

		try {			
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
		} catch (SQLException e) {			
			e.printStackTrace();
		}

		return conn;
	}
	
	public void dbClose(ResultSet rs,PreparedStatement stmt,Connection conn) {
		
		try {
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(conn !=null) conn.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

	public void dbClose(PreparedStatement pstmt,Connection conn) {
			
			try {			
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {			
				e.printStackTrace();
			}
		}
//	public static void main(String[] args) {
//		DBConnect c = new DBConnect();
//		c.dbConn();
//	}
}