<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String message=request.getParameter("message");
if("notPossible".equals(message))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("increment".equals(message))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("decrement".equals(message))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%if("removed".equals(message))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%}%>

<table>
<thead>
<%
int total=0;
int serialNumber=0;

try{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet result=statement.executeQuery("Select sum(total) from cart where email='"+email+"' and address is null");
	while(result.next())
	{
		total=result.getInt(1);
		
	}

%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total:<%out.println(total); %> <i class="fa fa-inr"></i> </th>
           <%if(total>0){ %> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet resultset=statement.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(resultset.next())
      {
      %>
          <tr>
			<% serialNumber=serialNumber+1;%>
           <td><%out.println(serialNumber); %></td>
            <td><%=resultset.getString(2)%></td>
            <td><%=resultset.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=resultset.getString(4)%> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=resultset.getString(1)%>&quantity=increment"><i class='fas fa-plus-circle'></i></a><%=resultset.getString(8)%><a href="incDecQuantityAction.jsp?id=<%=resultset.getString(1)%>&quantity=decrement"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=resultset.getString(10)%> </td>
            <td><a href="removeFromCart.jsp?id=<%=resultset.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
	<%
	}
}

catch(Exception error){
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>