<%@page isErrorPage="true"%>

some error...

<%=exception%>
<%
exception.printStackTrace(new java.io.PrintWriter(out));

%>