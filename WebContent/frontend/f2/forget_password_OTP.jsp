<%@page import="utility.OTP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forget Password</title>
<link rel="stylesheet" href="css/form.css">
<style>




body {
	background: url('img/bg-01.jpg') no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%
	if("send".equals(request.getParameter("forget_password")))
	{	int otp=request.getParameter("generated_otp")!=null?Integer.parseInt(request.getParameter("generated_otp")):OTP.MessageOTP(request.getParameter("mobile_number"), OTP.RandomOTP()," ");
		if(request.getParameter("otp")==null)
	
		if(request.getParameter("input_otp")!=null&&request.getParameter("generated_otp").equals(request.getParameter("input_otp")))
		{
			System.out.println("entered right otp");
		}
		else if(request.getParameter("input_otp")!=null)
		{
			System.out.println("entered wrong otp");
		%>
		entered wrong otp
		<%
		}
		%>
		
	
		<div class="login-wrap">
		<div class="login-html">
			<div class="login-form">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">OTP</label>
				<form action="forget_password_OTP.jsp" method="post">
					<div class="group">
						<label for="user" class="label">OTP</label> 
						<input id="user" name="input_otp" type="text" class="input">
					</div>
					<div class="group">
						<input type="hidden" name="generated_otp" value=<%=otp%>>
						<input type="submit" name="forget_password" class="button" value="send">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%	
	}
	else
	{
		
	%>
	<div class="login-wrap">
		<div class="login-html">
			<div class="login-form">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">Forget Password</label>
				<form action="forget_password_OTP.jsp" method="post">
					<div class="group">
						<label for="user" class="label">Phone number</label> 
						<input id="user" name="mobile_number" type="text" class="input">
					</div>
					<div class="group">
						<input type="submit" name="forget_password" class="button" value="send">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>