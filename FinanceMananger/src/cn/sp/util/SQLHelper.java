package cn.sp.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class SQLHelper {
	private static Connection ct = null;
//	private static PreparedStatement ps = null;
//	private static ResultSet rs = null;
	private static String driver ="";
	private static String url ="";
	private static String user ="";
	private static String password ="";
	private static Properties pp = null;
	private static InputStream fis = null;
	//使用静态代码块完成驱动的加载，并使用外部配置文件的读取方法
	static {
		try {
			pp = new Properties();
			fis = SQLHelper.class.getClassLoader().getResourceAsStream("Database.properties");
			pp.load(fis);
			driver = pp.getProperty("driver");
			url = pp.getProperty("url");
			user = pp.getProperty("user");
			password = pp.getProperty("password");
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis !=null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	//连接数据库的方法
	public static Connection getConnection() {
		try {
			ct = DriverManager.getConnection(url,user,password);
//			System.out.println("数据库连接成功");//debug
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ct;
	}
//	关闭连接的方法
	public static void close(Connection ct,Statement st){
		if(st!=null){
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		if(ct!=null){
			try {
				ct.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}
	public static void close(ResultSet rs,Statement ps,Connection ct) {
		try {
			if(rs !=null)
				rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			if(ps !=null)
				ps.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(ct !=null)
				ct.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
