<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>

h3
{
	color: green;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String message=request.getParameter("message");
if("added".equals(message)){
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(message)){
	

%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(message)){
%>
<h3 class="alert">Password change successfully <br> Try Again</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet result = statement.executeQuery("select * from product where active='Yes'");
	while(result.next())
	{

%>
          <tr>
            <td><%=result.getString(1) %></td>
            <td><%=result.getString(2) %></td>
            <td><%=result.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=result.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%=result.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
}
}
catch(Exception error)
{
	System.out.println(error);
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>