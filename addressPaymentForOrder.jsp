<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
	if(window.history.forwart(1) != null)
		{
			window.history.forward(1);
		}
</script>
</head>
<body>
<br>
<table>
<thead>
<%String email=session.getAttribute("email").toString();
int total=0;
int serialNumber=0;
try
{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet result=statement.executeQuery("Select sum(total) from cart where email='"+email+"' and address is null");
	while(result.next())
	{
		total=result.getInt(1);
		
	}
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %></th>
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
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet resultset=statement.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(resultset.next())
      {
      %>   
          <tr>
          <%serialNumber=serialNumber+1; %>
           <td><%out.println(serialNumber); %></td>
            <td><%=resultset.getString(2) %></td>
            <td><%=resultset.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=resultset.getString(4) %></td>
            <td><%=resultset.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=resultset.getString(10) %> </td>
            </tr>
         <%}
      ResultSet finalresult=statement.executeQuery("select * from users where email='"+email+"'");
      while(finalresult.next())
      {
    	  
      %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3 style="color:black">Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=finalresult.getString(7)%>" placeholder="Enter Address" required>

 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=finalresult.getString(8)%>" placeholder="Enter City" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=finalresult.getString(9)%>" placeholder="Enter State" required>

</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=finalresult.getString(10)%>" placeholder="Enter Country" required>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentMethod">
 	<option value="Cash on delivery">Cash on delivery</option>
 	<option value="Online Payment">Online Payment</option>
 	
 </select>
</div>

<div class="right-div">
<h3>Pay online on this shophere@pay.com</h3>
<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%=finalresult.getString(3)%>" placeholder="Enter Moile Number" required>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button">Proceed to Generate Bill & Save<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
      }
}
catch(Exception error){
	System.out.println(error);
}
%>

      <br>
      <br>
      <br>

</body>
</html>