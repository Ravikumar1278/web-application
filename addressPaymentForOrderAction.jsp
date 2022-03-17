<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId=request.getParameter("transactionId");
String status ="bill";
try{
	Connection connection=ConnectionProvider.getConnection();
	PreparedStatement values=connection.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	values.setString(1,address);
	values.setString(2,city);
	values.setString(3,state);
	values.setString(4,country);
	values.setString(5,mobileNumber);
	values.setString(6,email);
	values.executeUpdate();
	
	PreparedStatement data=connection.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
	data.setString(1,address);
	data.setString(2,city);
	data.setString(3,state);
	data.setString(4,country);
	data.setString(5,mobileNumber);
	data.setString(6,paymentMethod);
	data.setString(7,transactionId);
	data.setString(8,status);
	data.setString(9,email);
	data.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception error){
	System.out.println(error);
}
	
%>