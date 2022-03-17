package Project;

import java.sql.*;

public class ConnectionProvider {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","yashini@123");
			return connection;
		}
		catch(Exception error) {
			System.out.print(error);
			return null;
		}
	}
}
