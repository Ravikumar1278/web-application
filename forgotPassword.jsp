<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     	<input type="email" name="email" placeholder="Enter Email" required>
     	<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
     	<select name="securityQuestion">
     		<option value="What is the name of ypur pet">What is the name of your pet</option>
     		<option value="What was your first car">What was your first car</option>
     		<option value="What is the name of the town where you were born">What is the name of the town where you were born</option>
     		<option value="what elementary school did you attend">what elementary school did you attend</option>
     	</select>
     	<input type="text" name="answer" placeholder="Enter Answer" required>
     	<input type="password" name="newPassword" placeholder="Enter new password to reset" required>
     	<input type="submit" value="save">
     	
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%
   String message=request.getParameter("message");
   if("done".equals(message)){
	   
   
   %>
<h1>Password Changed Successfully</h1>
<%} %>
<%
if("invalid".equals(message)){
%>
<h1>Some thing Went Wrong! Try Again</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>