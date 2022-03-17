<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int index=0;
try{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet result=statement.executeQuery("select * from product where id='"+product_id+"'");
	while(result.next())
	{
		product_price=result.getInt(4);
		product_total=product_price;
	}
	ResultSet resultset=statement.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
	while(resultset.next())
	{
		cart_total=resultset.getInt(5);
		cart_total=cart_total+product_total;
		quantity=resultset.getInt(3);
		quantity=quantity+1;
		index=1;
	}
	if(index==1)
	{
		statement.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id="+product_id+" and email='"+email+"' and address is NULL");
		response.sendRedirect("home.jsp?message=exist");
	}
	if(index==0)
	{
		PreparedStatement values=connection.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		values.setString(1,email);
		values.setString(2,product_id);
		values.setInt(3,quantity);
		values.setInt(4,product_price);
		values.setInt(5,product_total);
		values.executeUpdate();
		response.sendRedirect("home.jsp?message=added");
		
	}
}
catch(Exception error){
	System.out.println(error);
	response.sendRedirect("home.jsp?message=invalid");
	
}
%>