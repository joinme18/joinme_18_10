<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<body >



<div class="login-form">
  		
  			<div class="sign-up-htm">
  		<form action="test.jsp" method="get">
  				<div class="group">
  					<label for="user" class="label">First Name</label>
  					<input id="user" name="first_name" type="text" class="input">
  				</div>
          <div class="group">
  					<label for="user" class="label">last Name</label>
  					<input id="user" name="last_name" type="text" class="input">
  				</div>
          <div class="group">
            <label for="user" class="label">Phone Number</label>
            <input id="user" type="text"  name="mobile_number"class="input">
          </div>
  				<div class="group">
  					<label for="pass" class="label">Password</label>
  					<input id="pass" type="password" name="password" class="input" data-type="password">
  				</div>
  				<div class="group">
  					<label for="pass" class="label">Confirm Password</label>
  					<input id="pass" type="password" name="password" class="input" data-type="password">
  				</div>
  				
          <div class="group">
  					<label for="user" class="label">User Name</label>
  					<input id="user" type="text"  name="unique_id" class="input">
  				</div>

  				<div class="group">
  					<input type="submit" class="button" value="Sign Up">
  				</div>
  				<div class="hr"></div>
  				<div class="foot-lnk">
  					<label for="tab-1">Already Member?</a>
  				</div>
  				
  		</form>
  				
  				
  				
  				
  				
  			</div>
  		</div>
  	</div>


</body>
</html>