<%@page import="com.sjl.joinme.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="udto" class="com.sjl.joinme.user.UserDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="udto"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index</title>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" href="css/form.css">
  <style>
    body{
      background: url('img/bg-01.jpg') no-repeat;
      background-size: cover;
    }
  </style>
</head>
<body>
 <div class="login-wrap">
  	<div class="login-html">
  		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
  		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
  		<div class="login-form">
  			<form action="index.jsp" method="get">
  				<%
			    if("sign_in".equalsIgnoreCase(request.getParameter("submit"))&&request.getMethod().equalsIgnoreCase("get"))
			    {
			    
			    	
			    	if(new UserDAO().checkUserPassword(request.getParameter("unique_id"), request.getParameter("password"))){
			    	%>
			    	<jsp:forward page="welcome.jsp"></jsp:forward>
			    	<% 
			    	}else{
			    	%>
			    	
			    	<div class="group">Fill the form correctly</div>
			    	<% 
			    	}
			    }
		    %>
  			
  			
  			<div class="sign-in-htm">
  				<div class="group">
  					<label for="user" class="label">Username</label>
  					<input id="user" type="text" name="unique_id"class="input">
  				</div>
  				<div class="group">
  					<label for="pass" class="label">Password</label>
  					<input id="pass" type="password" name="password" class="input" data-type="password">
  				</div>
  				<div class="group">
  					<input id="check" type="checkbox" class="check" checked>
  					<label for="check"><span class="icon"></span> Keep me Signed in</label>
  				</div>
  				<div class="group">
  					<input type="submit" name="submit" class="button" value="sign_in">
  				</div>
  				<div class="hr"></div>
  				<div class="foot-lnk">
  					<a href="#forgot">Forgot Password?</a>
  				</div>
  			</div>
  			</form>
			<form action="index.jsp" method="post">

			<%
			    if("sign_up".equalsIgnoreCase(request.getParameter("submit"))&&request.getMethod().equalsIgnoreCase("post"))
			    {
			    
			    	
			    	if(new UserDAO().addUser(udto)){
			    	%>
			    	<jsp:forward page="welcome.jsp"></jsp:forward>
			    	<% 
			    	}else{
			    	%>
			    	
			    	<div class="group">Fill the form correctly</div>
			    	<% 
			    	}
			    }
		    %>

	  			<div class="sign-up-htm">
	  				<div class="group">
	  					<label for="user" class="label">First Name</label>
	  					<input id="user" name="first_name" type="text" class="input">
	  				</div>
	          <div class="group">
	  					<label for="user" class="label">Last Name</label>
	  					<input id="user" name="last_name" type="text" class="input">
	  				</div>
	          <div class="group">
	            <label for="user" class="label">Phone Number</label>
	            <input id="user" type="text" name="mobile_number" class="input">
	          </div>
	  				<div class="group">
	  					<label for="pass" class="label">Password</label>
	  					<input id="pass" type="password" name="password" class="input" data-type="password">
	  				</div>
	  				<div class="group">
	  					<label for="pass" class="label">Confirm Password</label>
	  					<input id="pass" type="password" class="input" data-type="password">
	  				</div>
	  				
	          <div class="group">
	  					<label for="user" class="label">User Name</label>
	  					<input id="user" type="text" name="unique_id" class="input">
	  				</div>
	
	  				<div class="group">
	  					<input type="submit" name="submit" class="button" value="sign_up">
	  				</div>
	  				<div class="hr"></div>
	  				<div class="foot-lnk">
	  					<label for="tab-1">Already Member?</a>
	  				</div>
	  			</div>
		</form>
  		</div>
  	</div>
  </div>
</body>
</html>