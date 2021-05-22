
<%

 String em=request.getParameter("email");
  String ps=request.getParameter("password");

%>


<%
		com.User u=com.Login.main(em,ps);
	if(u==null)
	{
		out.println("Something Went wrong. Please Check your Email or Password");
	}
	else
	{
		session.setAttribute("user",u);
		response.sendRedirect("index.jsp");
	}
%>
