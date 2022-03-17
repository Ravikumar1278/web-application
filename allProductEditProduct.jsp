<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
String message=request.getParameter("message");
if("done".equals(message)){
	

%>
<h3 class="alert">Product Successfully Updated</h3>
<%} %>
<%

if("wrong".equals(message)){
	

%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection connection = ConnectionProvider.getConnection();
    	   Statement statement = connection.createStatement();
    	   ResultSet result=statement.executeQuery("Select*from product");
    	   while(result.next()){
    		   
    	   
    	   
       
       
       %>
          <tr>
            <td><%=result.getString(1)%></td>
            <td><%=result.getString(2)%></td>
            <td><%=result.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=result.getString(4)%></td>
            <td><%=result.getString(5)%></td>
            <td><a href="editProduct.jsp?id=<%=result.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
         }
       	}
       catch(Exception error){
    	   System.out.println(error);
       }
       		%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>