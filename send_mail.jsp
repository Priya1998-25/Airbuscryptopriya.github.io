<%@ page import="com.oreilly.servlet.MultipartRequest,java.io.*" %> 
<%@ page import="javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.*"%>

<%@page errorPage="error.jsp"%>
<%
com.User u=(com.User)session.getAttribute("user");
%> 
<%  
String path=application.getRealPath("/");
MultipartRequest m = new MultipartRequest(request, path+"/files",5200000);
String fname=m.getOriginalFileName("ofile");
String email=m.getParameter("email");
String msg=m.getParameter("msg");

String image=path+"/files/"+fname;


String st=sendMail(image,email,msg,u.getEmail());
out.println("<center>"+st+"</center><br><br>");
out.println("<center><a href='#' onclick='javascript:history.back()'>Go Back</a></center><br>");
%>
<br>

<%!
    public String sendMail(String image,String email,String mesg,String defaultEmail)
	{
		try
		{
		Properties p=new Properties();
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtps.auth","true");
		
		Session session=Session.getDefaultInstance(p);

		MimeMessage msg=new MimeMessage(session);
		
		InternetAddress from=new InternetAddress("publicpatra@gmail.com");
                InternetAddress to;
                if(email.equals(""))
                    to=new InternetAddress(defaultEmail);
                else
                    to=new InternetAddress(email);
		msg.setFrom(from);
		msg.setRecipient(Message.RecipientType.TO,to);
		msg.setSubject("Decrypt It");
		msg.setSentDate(new Date());

		Multipart body=new MimeMultipart();
		MimeBodyPart part1=new MimeBodyPart();
		part1.setText("The Image is Encrypted using Blowfish Algorithm.");
		body.addBodyPart(part1);

		MimeBodyPart part2=new MimeBodyPart();
		part2.setText(mesg);
		body.addBodyPart(part2);

		MimeBodyPart part3=new MimeBodyPart();
		FileDataSource fds=new FileDataSource(image);
		part3.setDataHandler(new DataHandler(fds));
		part3.setFileName(fds.getName());
		body.addBodyPart(part3);

		msg.setContent(body);
		
		Transport t=session.getTransport("smtps");
		System.out.println("connecting to server...");
		t.connect("smtp.gmail.com","publicpatra@gmail.com","12345678");
		System.out.println("sending message pls wait...");
		t.sendMessage(msg,msg.getAllRecipients());
		return "Mail sent";
		}	
		catch(com.sun.mail.smtp.SMTPSendFailedException e)
		{
			e.printStackTrace();
			return "smtps authentication failed check smtps property in the Properties.";
		}
		catch(javax.mail.MessagingException e)
		{
			e.printStackTrace();
			return "internet not connected. or unknown host "+e;
		}
		catch(Exception e)
		{
			e.printStackTrace();
                       return "Something Went Wrong.";
		}
	}
%>