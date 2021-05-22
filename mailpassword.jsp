<%@ page import="javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.*"%>
<%!
	String otp;
%>
<%
String email=request.getParameter("email");
if(email.equals(""))
	out.println("<font color='red'>Please enter Your Mail id to recover password</font>");
	else
	{
		int i=(int)(Math.random()*100000);
        String otp=Integer.toString(i);
        this.otp=otp;
       String msg=sendMail(email,otp);
%>
		<form name="otpform" action="change_password_form.jsp" method="post">
				One Time Password : <input type="text" name="otp"/><input type="hidden" name="email" value="<%=email%>" /><input type="hidden" name="ootp" value="<%=otp%>" />
				<input type="submit" value="Go" onclick="return check_otp()"/>
		</form>
<%
	}
%>


<%!
    public String sendMail(String email,String password)
	{
		try
		{
		Properties p=new Properties();
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtps.auth","true");
		
		Session session=Session.getDefaultInstance(p);

		MimeMessage msg=new MimeMessage(session);
		
		InternetAddress from=new InternetAddress("publicpatra@gmail.com");
                InternetAddress to=new InternetAddress(email);
		msg.setFrom(from);
		msg.setRecipient(Message.RecipientType.TO,to);
		msg.setSubject("One Time Password");
		msg.setSentDate(new Date());

                Multipart body=new MimeMultipart();
		MimeBodyPart part=new MimeBodyPart();
		part.setText("One Time Password");
		body.addBodyPart(part);
               
                
                MimeBodyPart part2=new MimeBodyPart();
		part2.setText("One Time Password. Use it to recover Password: "+otp);
		body.addBodyPart(part2);

		msg.setContent(body);
		
		Transport t=session.getTransport("smtps");
		System.out.println("connecting to server...");
		t.connect("smtp.gmail.com","publicpatra@gmail.com","12345678");
		System.out.println("sending message pls wait...");
		t.sendMessage(msg,msg.getAllRecipients());
		return "A One Time password sent to Your mail. Please check your mail.";
		}	
		catch(com.sun.mail.smtp.SMTPSendFailedException e)
		{
			return "smtps authentication failed check smtps property in the Properties.";
		}
		catch(javax.mail.MessagingException e)
		{
			return "internet not connected. or unknown host";
		}
		catch(Exception e)
		{
            return "Something Went Wrong.";
		}
  }

%>