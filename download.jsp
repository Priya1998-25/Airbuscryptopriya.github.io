<%@page import="java.io.*"%>
<%    
	String filename =request.getParameter("imagename");   
  String filepath = application.getRealPath("/")+"/files";
String at=filepath+"/"+filename;		
  	//response.setContentType("APPLICATION/OCTET-STREAM");   
	//response.setContentType("image/jpg");
	response.setHeader("Content-Disposition","attachment; filename="+filename); 
  
java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath+"/"+filename); 
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    response.getWriter().write(i);   
  }   
  fileInputStream.close(); 
%>
<%=filename%>