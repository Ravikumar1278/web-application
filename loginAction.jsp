<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password))
{
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
	
}
else{
	int index=0;
	try{
		Connection connection=ConnectionProvider.getConnection();
		Statement statement=connection.createStatement();
		ResultSet result=statement.executeQuery("select * from users where email='"+email+"' and passowrd='"+password+"'");
		while(result.next()){
			index=1;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
		if(index==0){
			response.sendRedirect("login.jsp?message=notexist");
		}
		
	}
	catch(Exception error){
		System.out.println(error);
		response.sendRedirect("login.jsp?message=invalid");
	}
}
%>