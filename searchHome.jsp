<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
int index=0;
try{
	String search=request.getParameter("search");
	Connection connection=ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet result = statement.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
	while(result.next())
	{
		index=1;
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
     catch(Exception error){
    	 System.out.println(error);
     }
     %>    
        </tbody>
      </table>
      	<% 
      	if(index==0)
      	{
      	%>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>