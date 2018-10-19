<%@page import="com.sjl.joinme.user.UserDTO"%>
<%@page import="com.sjl.joinme.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	


	<%=request.getParameter("first_name")%>
	<%=request.getParameter("last_name")%>
	<%=request.getParameter("password")%>
	<%=request.getParameter("mobile_number")%>
	<%=request.getParameter("unique_id")%>

<%





UserDAO dao=new UserDAO();
UserDTO dto=new UserDTO();
dto.setAbout("Kuch nai");
dto.setCoins(1);
dto.setCreated_datetime("2018-10-13");
dto.setDate_of_birth("1997-10-18");
dto.setEmail("23lokeshsarathe18@gmail.com"); 
dto.setFirst_name("Lokesh");
dto.setLast_name("Sarathe"); 
dto.setGender('m');
dto.setLocation("35131.2, 95464.4");
dto.setMobile_number(77);
dto.setPassword("Kannu"); 
dto.setRating(5);
dto.setUnique_id("sud"); 
dao.addUser(dto);
System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxx");



%>


</body>
</html>