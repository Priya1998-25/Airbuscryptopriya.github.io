
<%

 String pass=request.getParameter("t4");
  String cpass=request.getParameter("cpass");
String email=request.getParameter("email");

%>


<%
		int i=com.Update.main(pass,email);
	if(i<=0)
	{
		out.println("Something Went wrong.");
	}
	else
	{
		out.println("<center>Password Updated Successfully<br>");
		out.println("<a href='login.jsp'>Go to Login Page</a></center>");
	}
%>
