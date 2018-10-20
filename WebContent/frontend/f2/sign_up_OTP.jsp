<%@page import="utility.OTP"%>
<%@page import="com.sjl.joinme.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="udto" class="com.sjl.joinme.user.UserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="udto" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Verification</title>
<link rel="stylesheet" href="css/form.css">
<style>
body {
	background: url('img/bg-01.jpg') no-repeat;
	background-size: cover;
}

</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP</title>
</head>


<%
int otp=0;
if("Confirm OTP".equals(request.getParameter("OTP")))
{
	otp=Integer.parseInt(request.getParameter("generated_otp"));
	if(request.getParameter("generated_otp").equals(request.getParameter("input_otp")))
	{
		if(!new UserDAO().addUser(udto))
		{
		%>
		<jsp:forward page="index.jsp"></jsp:forward>
		<%
		}
		%>
		<jsp:forward page="welcome.jsp"></jsp:forward>
		<% 
		
	}else
	{
		%>
		entered otp is wrong <%="gotp="+request.getParameter("generated_otp")+"iotp="+request.getParameter("input_otp") %>
		<% 
	}
	
}else
{
	otp=OTP.MessageOTP(request.getParameter("mobile_number"), OTP.RandomOTP(), request.getParameter("first_name"));
}
%>

<body>
	<div class="login-wrap">
		<div class="login-html">
			<div class="login-form">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">Verification</label>
				<form action="sign_up_OTP.jsp" method="post">
						<div class="group">
						<label for="user" class="label">Phone number</label> 
						<input id="user" type="text" name="input_otp" class="input">
					</div>
					<div class="group">
						<input type="hidden" name="first_name" value=<%=request.getParameter("first_name") %>>
						<input type="hidden" name="last_name" value=<%=request.getParameter("last_name") %>>
						<input type="hidden" name="password" value=<%=request.getParameter("password") %>>
						<input type="hidden" name="unique_id" value=<%=request.getParameter("unique_id") %>>
						<input type="hidden" name="mobile_number" value=<%=request.getParameter("mobile_number") %>>
						<input type="hidden" name="generated_otp" value=<%=otp%>>
					
						<input type="submit" class="button" name="OTP" value="Confirm OTP">
					</div>
					<br>
					<br>
					<br>
					<a href="sign_up_OTP.jsp">resend OTP</a>

				</form>
			</div>
		</div>
	</div>
</body>
</html>