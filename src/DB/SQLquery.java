package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class SQLquery {

	private Connection conn = null;
	private Statement stmt = null;

	
	
	public SQLquery(){
		conn = new MyConn().getConnection();
	}

	public boolean write(String sql){
		int rows = 0;
		try{
			stmt = (Statement)conn.createStatement();
			rows = stmt.executeUpdate(sql);
			System.out.println("-----"+sql+"-----");

		}catch(Exception e){
			e.printStackTrace();
		}
		return	rows>0 ? true : false;
	}

	public String[] read(String sql,String... field){

		String usrData[] = new String[field.length];

		try{
			stmt = (Statement)conn.createStatement();
			ResultSet rs =  stmt.executeQuery(sql);
			System.out.println("-----"+sql+"-----");
			while(rs.next()){
				for(int i = 0 ;i < field.length ;i++){
					usrData[i] = rs.getString(field[i]);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		//查询结果为空则返回各个元素为null的数组
		return usrData;
	}

	public ArrayList<String[]> reads(String sql,String... field){

		ArrayList<String[]> usrsData = new ArrayList<String[]>();


		try{
			stmt = (Statement)conn.createStatement();
			
			ResultSet rs =  stmt.executeQuery(sql);
			System.out.println("-----"+sql+"-----");
			while(rs.next()){
				String usrData[] = new String[field.length];
				for(int i = 0 ;i < field.length ;i++){
					usrData[i] = rs.getString(field[i]);
				}
				usrsData.add(usrData);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return usrsData;
	}

	public void close(){
		try {
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
			System.out.println("------数据库连接已关闭-----");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
