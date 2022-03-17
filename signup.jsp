<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    	<input id="checkname" type="text" name="name" onchange="validatename()" placeholder="Enter Name" required>
    	<div id="error1" style="color:red"></div> 
    	<input type="email" name="email" placeholder="Enter Email" required>
    	<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
    	<select name="secuityQuestion" required>
    		<option value="What is the name of your pet">What is the name of your pet</option>
    		<option value="What was your first car">What was your first car</option>
    		<option value="What is the name of the town where you were born">What is the name of the town where you were born</option>
    		<option value="what elementaryy school did you attend">what elementary school did you attend</option>
    	</select>
   <input type="text" name="answer" placeholder="Enter answer" required>
   <input type="password" name="password" placeholder="Enter Password" required>
    <input type="submit" value="signup"> 
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
  String message=request.getParameter("message");
  if("valid".equals(message)){
	  
  
  %>
<h1>Register successfully</h1>
<%} %>
<% 
if("invalid".equals(message))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>SHOPHERE</h2>
    <p>Fashion is a trend,<br>Style lives within a person</p>
  </div>
</div>
<script>
function validatename()
{
    var name=document.getElementById("checkname").value;
    if(/^[A-Za-z]{4,}$/.test(name)==true && !(/(.)\1\1+/.test(name))==true)
    {
        document.getElementById("error1").innerHTML="Valid Username";
        
    }
    else
    {
        document.getElementById("error1").innerHTML="Invalid UserName";
        
    }
}
</script>
</body>
</html>