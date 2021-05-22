<%@ page import="javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.*"%>
<%
  String fn=request.getParameter("t1");
  String ln=request.getParameter("t2");
 String em=request.getParameter("t3");
  String ps=request.getParameter("t4");
   String gn=request.getParameter("t5");
%>
<jsp:useBean id="u1" class="com.User"/>
<jsp:setProperty name="u1" property="fname" value="<%=fn%>"/>
<jsp:setProperty name="u1" property="lname" value="<%=ln%>"/>
<jsp:setProperty name="u1" property="gender" value="<%=gn%>"/>
<jsp:setProperty name="u1" property="email" value="<%=em%>"/>
<jsp:setProperty name="u1" property="password" value="<%=ps%>"/>

<%
	String s=com.UserReg.main(u1);
	if(s!=null)
	{
		out.println("<center>You are registered Successfully. transferring you to login page</center>");
		out.println("<a href='login.jsp'>Go to Login page</a></center>");
	}
	else
		out.println("Registration not done. something went wrong");
%>