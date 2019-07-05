package Bean;
import java.sql.*;
public class DBBean {
	private String driverStr="com.mysql.cj.jdbc.Driver";
	private String connStr="jdbc:mysql://localhost:3306/transport_sys?serverTimezone=UTC";//必须加上serverTimezone=UTC，否则会出错
	private String dbusername="root";
	private String dbpassword="123456";
	private Connection conn=null;
	private Statement stmt=null;
	public DBBean()
	{
		try {
			Class.forName(driverStr);
			conn=DriverManager.getConnection(connStr, dbusername, dbpassword);
			stmt=conn.createStatement();
		}
		catch(Exception ex)
		{
			System.out.println("数据连接失败");
		}
	}
	
	public int executeUpdate(String s)
	{
		int result=0;
		System.out.println("更新语句："+s+"\n");
		try {
			result=stmt.executeUpdate(s);
		}catch(Exception ex) {
			System.out.println("执行更新错误！");
		}
		return result;
	}
	
	public ResultSet executeQuery(String s)
	{
		ResultSet rs=null;
		System.out.println("查询语句："+s+"\n");
		try {
			rs=stmt.executeQuery(s);
		}catch(Exception ex) {
			System.out.println("执行查询错误");
		}
		return rs;
	}
	public void executeInsert(String s)
	{
		System.out.println("插入语句："+s+"\n");
		try {
			stmt.executeUpdate(s);
		}catch(SQLException e) {
			System.out.println("执行插入错误");
		}
	}
	public void close() {
		try {
			stmt.close();
			conn.close();
		}catch(Exception e) {
			
		}
	}
}
