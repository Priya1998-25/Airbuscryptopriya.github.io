<%@ page import="com.oreilly.servlet.MultipartRequest,java.sql.*,java.io.*" %> 
<%@page errorPage="error.jsp"%> 
<%  
String path=application.getRealPath("/");
MultipartRequest m = new MultipartRequest(request, path+"/files",8200000);
String fname=m.getOriginalFileName("ofile");
String kfname=m.getOriginalFileName("keyfile");
String actionType=m.getParameter("fuse");

File ofile=new File(path+"/files/"+fname);
File keyfile=new File(path+"/files/"+kfname);
File fusedFile=new File(path+"/files/combined.jpg");
File defusedFile=new File(path+"/files/img1.jpg");

if(actionType.equals("Fuse"))
{
String st=fuse(ofile,keyfile,fusedFile);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+fusedFile.getName()+">download the fused image here</a>");
}
else if(actionType.equals("Defuse"))
{
String st=defuse(ofile,keyfile,defusedFile);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+defusedFile.getName()+">download the defused image here</a>");
}
%>
<br>

<%!public String fuse(File oFile,File keyFile,File fusedFile)
{

try
{
			FileInputStream fis1=new FileInputStream(keyFile);
			FileInputStream fis2=new FileInputStream(oFile);
			FileOutputStream fos=new FileOutputStream(fusedFile);
			byte b1[]=new byte[fis1.available()];
			byte b2[]=new byte[fis2.available()];
			byte b[]=new byte[b1.length+b2.length];
			fis1.read(b1);
			fis2.read(b2);
			int i=0;
			for(; i<b1.length; i++)
			{
				b[i]=b1[i];
			}
			for(int j=0; j<b2.length; j++)
			{
				b[i]=b2[j];
				i++;
			}
			fos.write(b);
			fos.close();
			fis1.close();
			fis2.close();
return "Successfully combined";
}
catch(Exception e)
{
	return e.toString();
}
}
%>

<%!
public String defuse(File oFile,File keyFile,File defusedFile)
{
     try
     {

      		FileInputStream fis1=new FileInputStream(oFile);
			FileInputStream fis2=new FileInputStream(keyFile);
			FileOutputStream fos=new FileOutputStream(defusedFile);
			byte b1[]=new byte[fis1.available()];
			byte b2[]=new byte[fis2.available()];
			byte b[]=new byte[b1.length-b2.length];
			fis1.read(b1);
			fis2.read(b2);
			int i=0;
			for(int j=b2.length; j<b1.length; j++)
			{
				b[i]=b1[j];
				i++;
			}
			fos.write(b);
			fos.close();
			fis1.close();
			fis2.close();
        return "Defusion Done. image created";
     }
     catch(Exception e)
     {
         return e.toString();
     }
}
%>