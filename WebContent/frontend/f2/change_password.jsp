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
		<div class="login-wrap">
			<div class="login-html">
				<div class="login-form">
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Forget Password</label>
					<form action="welcome" method="post">
						<div class="group">
							<label for="user" class="label">new password</label> 
							<input id="user" type="text" name="new_password" value="" class="input">
						</div>
						<div class="group">
							<label for="user" class="label">confirm password</label> 
							<input id="user" type="text" name="confirm_password" value="" class="input">
						</div>
						<div class="group">
							<input type="submit" class="button" name="change_password" value="change_password">
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>