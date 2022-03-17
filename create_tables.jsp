<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
try{
	Connection connection=ConnectionProvider.getConnection();
	Statement statement=connection.createStatement();
	String query="create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),passowrd varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String sqlquery="create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
	String sqltable="create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	System.out.println(query);
	System.out.println(sqlquery);
	System.out.println(sqltable);
	//statement.execute(query);
	//statement.execute(sqlquery);
	statement.execute(sqltable);
	System.out.println("Table created");
	connection.close();
	
}
catch(Exception error){
	System.out.println(error);
}
%>