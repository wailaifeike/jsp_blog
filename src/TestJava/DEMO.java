package TestJava;

import java.io.IOException;
import java.io.InputStream;
//import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

//import org.junit.Test;

import com.mysql.jdbc.Connection;

//import java.sql.*;


import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;

public class DEMO {
//	public static void main(String[] args) throws SQLException {
//		Driver driver = new com.mysql.jdbc.Driver();
//		String url = "jdbc:mysql://127.0.0.1:3306/javadb";
//		Properties info = new Properties();
//		info.put("user", "root");
//		info.put("password", "mysql");
//		Connection con = (Connection) driver.connect(url, info);
//		System.out.println(con.getActiveStatementCount());
//
//	}


	public ResultSet testResultSet(String sql){
		Connection conn = null;
		Statement statement = null;
		ResultSet rs = null;
		try {
			conn = (Connection) JDBCTools.getConnection();
			statement = (Statement) conn.createStatement();
//			String sql = "SELECT id, username, password, phone,eamil " +
//                    "FROM UserInfo";
			//4. 执行查询, 得到 ResultSet
			rs = statement.executeQuery(sql);
//			System.out.println(rs);

			//5. 处理 ResultSet
//			while(rs.next()){
//				int id = rs.getInt(1);
//				String name = rs.getString("username");
//				String password = rs.getString(3);
//				String phone = rs.getString(4);
//				String email = rs.getString(5);
//
//				System.out.println(id);
//				System.out.println(name);
//				System.out.println(password);
//				System.out.println(phone);
//				System.out.println(email);
//			}

            return rs;
		} catch (Exception e) {
			e.printStackTrace();
            return null;
		} finally{
//			JDBCTools.release(rs, statement, conn);
		}

	}

	public Connection getConnection() throws InstantiationException, ReflectiveOperationException, ClassNotFoundException, IOException, SQLException {
		String driverClass = null;
		String jdbcUrl = null;
		String user = null;
		String password = null;

		InputStream in =
				getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		Properties properties = new Properties();
		properties.load(in);
		driverClass = properties.getProperty("driver");
		jdbcUrl = properties.getProperty("jdbcUrl");
		user = properties.getProperty("user");
		password = properties.getProperty("password");

		//通过反射常见 Driver 对象.
		Driver driver =
				(Driver) Class.forName(driverClass).newInstance();

		Properties info = new Properties();
		info.put("user", user);
		info.put("password", password);

		//通过 Driver 的 connect 方法获取数据库连接.
		Connection connection = (Connection) driver.connect(jdbcUrl, info);

		return connection;


	}

	public Connection getConnection2() throws Exception{
		//1. 准备连接数据库的 4 个字符串.
		//1). 创建 Properties 对象
		Properties properties = new Properties();

		//2). 获取 jdbc.properties 对应的输入流
		InputStream in =
				this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");

		//3). 加载 2） 对应的输入流
		properties.load(in);

		//4). 具体决定 user, password 等4 个字符串.
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String jdbcUrl = properties.getProperty("jdbcUrl");
		String driver = properties.getProperty("driver");

		//2. 加载数据库驱动程序(对应的 Driver 实现类中有注册驱动的静态代码块.)
		Class.forName(driver);

		//3. 通过 DriverManager 的 getConnection() 方法获取数据库连接.
		return (Connection) DriverManager.getConnection(jdbcUrl, user, password);
	}


	public void update(String sql){
		Connection conn = null;
		Statement statement = null;

		try {
			conn = (Connection) JDBCTools.getConnection();
			statement = (Statement) conn.createStatement();
			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCTools.release(statement, conn);
		}
	}


	public void testGetConnection() throws Exception{
		Connection con = getConnection();
		System.out.println(con);
	}



	public void testGetConnection2() throws Exception{
		System.out.println(getConnection2());
	}


	public void testStatement() throws Exception{
		//1. 获取数据库连接
		Connection conn = null;
		Statement statement = null;

		try {
			conn = getConnection2();

			//3. 准备插入的 SQL 语句
			String sql = null;

//			sql = "INSERT INTO customers (NAME, EMAIL, BIRTH) " +
//					"VALUES('XYZ', 'xyz@atguigu.com', '1990-12-12')";
//			sql = "DELETE FROM customers WHERE id = 1";
			sql = "INSERT into userinfo VALUES(\"zhangsan3\",3,\"12345678910\",\"17685164678\",\"116730@qq.com\")";
			System.out.println(sql);

			//4. 执行插入.
			//1). 获取操作 SQL 语句的 Statement 对象:
			//调用 Connection 的 createStatement() 方法来获取
			statement = (Statement) conn.createStatement();

			//2). 调用 Statement 对象的 executeUpdate(sql) 执行 SQL 语句进行插入
			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				//5. 关闭 Statement 对象.
				if(statement != null)
					statement.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				//2. 关闭连接
				if(conn != null)
					conn.close();
			}
		}

	}


}
