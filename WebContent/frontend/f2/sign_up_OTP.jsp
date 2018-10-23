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
<%
if(request.getMethod().equalsIgnoreCase("post")){
	if("sign_up".equals(request.getParameter("submit"))&&session.getAttribute("otp")==null)
	{
		session.setAttribute("mobile_number", request.getParameter("mobile_number"));
		session.setAttribute("otp",/*(OTP.MessageOTP(session.setAttribute("mobile_number", null);,*/ OTP.RandomOTP()/*, ""))*/);
	}
	try{
		if("resend_otp".equals(request.getParameter("otp_form")))
		{
			session.setAttribute("otp",/*(OTP.MessageOTP(session.getAttribute("mobile_number").toString(),*/ OTP.RandomOTP()/*, ""))*/);
		}
	}catch(Exception e){
		
	}
	try{
		if("confirm_otp".equals(request.getParameter("otp_form"))&&((session.getAttribute("otp")).toString()).equals(request.getParameter("input_otp")))
		{
			
		}
	}catch(Exception e)
	{
		System.out.println("+++Exception at forget_password_otp ->confirm_otp"+e);
	}
}
%>
<%=session.getAttribute("mobile_number") %><br>
<%=session.getAttribute("otp") %>

















body {
	background: url('img/bg-01.jpg') no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
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
						<input type="submit" name="otp_form" class="button" value="confirm_otp">
					</div>
					<div class="group">
						<input type="submit" name="otp_form" class="button" value="resend_otp"><br>
						<a href="index.jsp?sign_up_checked=checked">create new account</a>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>