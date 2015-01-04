package DB;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class MyConn {
	
	Connection conn = null;
	
	public MyConn(){
		String user = "root";
		String password = "root";
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost/jwm";
		
		try{
			Class.forName(driverName);
			conn = (Connection)DriverManager.getConnection(dbURL, user, password);
		}catch(Exception e){
			System.out.println("数据库异常");
		}
	}
	
	public Connection getConnection(){
		return conn;
	}
	
}
