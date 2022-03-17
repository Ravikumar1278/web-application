<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try
{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	statement.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("No"))
	{
		statement.executeUpdate("delete from cart where product id='"+id+"' and address is NULL");
		
	}
	response.sendRedirect("allProductEditProduct.jsp?message=done");
}
catch(Exception error){
	System.out.println(error);
	response.sendRedirect("allProductEditProduct.jsp?message=wrong");
}
%>
