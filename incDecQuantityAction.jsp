<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String  id=request.getParameter("id").toString();
String incDec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total =0;
try{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement=connection.createStatement();
	ResultSet result=statement.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(result.next()){
		price=result.getInt(4);
		total=result.getInt(5);
		quantity=result.getInt(3);
		
	}
	if(quantity==1 && incDec.equals("decrement"))
	{
		response.sendRedirect("myCart.jsp?message=notPossible");
	}
	else if(quantity!=1 && incDec.equals("decrement"))
	{
		total=total-price;
		quantity=quantity-1;
		statement.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?message=decrement");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		statement.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?message=increment");
	
	}
}
catch(Exception error){
	System.out.println(error);
}
%>