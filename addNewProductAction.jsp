<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
	Connection connection=ConnectionProvider.getConnection();
	PreparedStatement values=connection.prepareStatement("insert into product values(?,?,?,?,?)");
	values.setString(1,id);
	values.setString(2,name);
	values.setString(3,category);
	values.setString(4,price);
	values.setString(5,active);
	values.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?message=done");
}
catch(Exception error){
	response.sendRedirect("addNewProduct.jsp?message=wrong");
}
%>