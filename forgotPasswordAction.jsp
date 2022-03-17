<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");

int check=0;
try{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement=connection.createStatement();
	ResultSet result=statement.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"'and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
	while(result.next())
	{
		check=1;
		statement.executeUpdate("update users set passowrd='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?message=done");
	}
	if(check==0){
		response.sendRedirect("forgotPassword.jsp?message=invalid");
	}
	result.close();
}
catch(Exception error){
	System.out.println(error);
}
%>
