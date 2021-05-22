<%@page import="java.sql.*"%>
<html>
<body>
<%
	String email=request.getParameter("email");
	email=email.trim();
	int i=com.CheckReg.main(email);
	if(i<0)
		out.println("Email Available");
	else
		out.println("Email already Existed");
 %>
</body>
</html>