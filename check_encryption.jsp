<%@ page import="com.oreilly.servlet.MultipartRequest,java.sql.*,java.io.*" %> 
<%@ page import="javax.imageio.ImageIO,javax.crypto.Cipher,javax.crypto.CipherOutputStream,javax.crypto.spec.SecretKeySpec"%>

<%@page errorPage="error.jsp"%> 
<%  
String path=application.getRealPath("/");
MultipartRequest m = new MultipartRequest(request, path+"/files",8200000);
String fname=m.getOriginalFileName("ofile");
String encryptionKey=m.getParameter("key");
String actionType=m.getParameter("encryption");

File ofile=new File(path+"/files/"+fname);
File encryptedFile=new File(path+"/files/Encrypt.jpg");
File decryptedFile=new File(path+"/files/Decrypt.jpg");

if(actionType.equals("Encrypt"))
{
String st=fuse(ofile,encryptedFile,encryptionKey);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+encryptedFile.getName()+">download the encrypted image here</a>");
}
else if(actionType.equals("Decrypt"))
{
String st=defuse(ofile,decryptedFile,encryptionKey);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+decryptedFile.getName()+">download the decrypted image here</a>");
}
%>
<br>

<%!public String fuse(File oFile,File encryptedFile,String encryptionKey)
{

try
    {
        FileInputStream file=new FileInputStream(oFile);
        FileOutputStream outStream=new FileOutputStream(encryptedFile);
        byte k[]=encryptionKey.getBytes();//"HbTi1722".getBytes();
        SecretKeySpec key=new SecretKeySpec(k,"Blowfish");
        Cipher enc=Cipher.getInstance("Blowfish");
        enc.init(Cipher.ENCRYPT_MODE, key);
        CipherOutputStream cos=new CipherOutputStream(outStream,enc);
        byte buf[]=new byte[1024];
        int read;
        while((read=file.read(buf))!=-1)
        {
            cos.write(buf, 0, read);
            cos.flush();
        }
        file.close();
        outStream.flush();
        outStream.close();
        cos.flush();
        return "Image Encrypted Successfully";
    }
    catch(Exception e)
    {
    	return e.toString();
    }
}
%>

<%!
public String defuse(File oFile,File decryptedFile,String decryptionKey)
{
try
    {
        FileInputStream file=new FileInputStream(oFile);
        FileOutputStream outStream=new FileOutputStream(decryptedFile);
        byte k[]=decryptionKey.getBytes();//"HbTi1722".getBytes();
        SecretKeySpec key=new SecretKeySpec(k,"Blowfish");
        Cipher enc=Cipher.getInstance("Blowfish");
        enc.init(Cipher.DECRYPT_MODE, key);
        CipherOutputStream cos=new CipherOutputStream(outStream,enc);
        byte buf[]=new byte[1024];
        int read;
        while((read=file.read(buf))!=-1)
        {
            cos.write(buf, 0, read);
            cos.flush();
        }
        file.close();
        outStream.flush();
        outStream.close();
        cos.flush();
        return "Image Decrypted Successfully";
    }
    catch(Exception e)
    {
    	return e.toString();
    } 
}
%>