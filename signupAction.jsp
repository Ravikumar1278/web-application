<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("secuityQuestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement values=connection.prepareStatement("insert into users value(?,?,?,?,?,?,?,?,?,?)");
	values.setString(1,name);
	values.setString(2,email);
	values.setString(3,mobileNumber);
	values.setString(4,securityQuestion);
	values.setString(5,answer);
	values.setString(6,password);
	values.setString(7,address);
	values.setString(8,city);
	values.setString(9,state);
	values.setString(10,country);
	values.executeUpdate();
	response.sendRedirect("signup.jsp?message=valid");
}
catch(Exception error){
	System.out.println(error);
	response.sendRedirect("signup.jsp?message=invalid");
	
}
%>