package common;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.io.*;

public class JDBCTemp {
	/*
	 * public static Connection getConnection() { Connection conn = null;
	 * 
	 * try { Class.forName("oracle.jdbc.driver.OracleDriver"); conn =
	 * DriverManager.getConnection( "jdbc:oracle:thin:@localhost:1521:xe",
	 * "student", "student"); conn.setAutoCommit(false); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return conn; }
	 */
	
//	public static Connection getConnection() {
//		Connection conn = null;
//		Properties prop = new Properties();
//		
//		try {
//			//톰켓이 구동하고 있는 현재 웹프로젝트(웹애플리케이션)에서의 경로 지정이
//			//필요함. 또는 현재 실행하고 있는 클래스 위치에서 부터의 경로지정도 가능함
//			
//			//현재 실행중인 JDBCTemp.class 의 위치부터 파악함
//			String currentPath = JDBCTemp.class.getResource("./").getPath();
//			prop.load(new FileReader(currentPath + "jdbc.properties"));
//			
//			String driver = prop.getProperty("driver");
//			String url = prop.getProperty("url");
//			String user = prop.getProperty("user");
//			String passwd = prop.getProperty("passwd");
//			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, user, passwd);
//			conn.setAutoCommit(false);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return conn;
//	}
	
	//톰캣(WAS)이 제공하는 DBCP(DataBase Connection Pool)를
	//이용해서 연결 처리
	//content directory(web)/META-INF/context.xml 파일에 설정됨
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
				//context.xml 에 <Resource> 앨리먼트의 설정값을 
				//읽어와서 DBCP에서 Connection 을 받음
				Context initContext = new InitialContext();
				DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/oraDB"); //context.xml 참조해서 입력
				conn = ds.getConnection();
				conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed())
				rset.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
