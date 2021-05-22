<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome Secure World</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script type="text/javascript" src="refresh.js"></script>
	

</head>
<body>
	<div id="header">
		<div>
			<div class="logo">
				<a href="index.jsp">SecureWorld</a>
			</div>
			<ul id="navigation">
				<li class="active">
					<a href="index.jsp">Home</a>
				</li>
			<%
				com.User u=(com.User)session.getAttribute("user");
				if(u==null)
				{
			%>
				<li>
					<a href="login.jsp">Login</a>
				</li>
				<li>
					<a href="registration.html">Registration</a>
				</li>
				<li>
					<a href="about.html">About</a>
				</li>
				<li>
					<a href="contact.html">Contact Us</a>
				</li>
				
			<%
				}
				else
				{
			%>
				<li>
					<a href="fusion.jsp">Fusion/Defusion</a>
				</li>
				<li>
					<a href="encryption.jsp">Encryption/Decryption</a>
				</li>
				<li>
					<a href="mail.jsp">Mailing</a>
				</li>
				<li>
					<a href="logout.jsp">Not You? Logout!!</a>
				</li>
			<%
				}
			%>
				
			
			</ul>
		</div>
	</div>
	<div align="right" style="width:80%">
		<%
		if(u!=null)
		{
	%>
			<h3 style="color:#FF0000">Hello <h2 style="color:#009933"> <%=u.getFname()+" "+u.getLname()%></h2></h3>
	<%
		}
	%>
	</div>
	<div id="adbox">
		<div class="clearfix">
			<img src="images/box.png" alt="Img" height="342" width="368">
			<div>
				<h1 style="font-size:45px">Security Ideas?</h1>
				<h2>That's what we live for.</h2>
				<p>
					We propose the encryption of color images using Blowfish,DES and AES. The image to be encrypted is first segregated into three color channels: red, green, and blue. Each of these channels is encrypted independently using double random phase encoding in the Blowfish algorithm. <span>
	<%
		if(u!=null)
		{
	%>	
		<a href="#" class="btn" style="font-size:15px">
			Desktop Version Soon
	<%
		}
		else
		{
	%>			
				<a href="login.jsp" class="btn">
				Login to Try!
	<%
		}
	%>
	</a><b style="color:#0033FF">Don’t worry it’s for free</b></span>
The different fractional orders and random phase masks used during the process of encryption and decryption are the keys to enhance the security of the proposed system.The algorithms to implement the proposed encryption and decryption scheme are discussed, and results of digital simulation are presented.				</p>
			</div>
		</div>
	</div>
	<div class="forum"><a href="group_chat_frame.jsp">Forum Chat</a></div>
	<div id="footer">
		<div class="clearfix">
			<div id="connect">
				<a href="http://www.facebook.com" target="_blank" class="facebook"></a><a href="http://plus.google.com" target="_blank" class="googleplus"></a><a href="http://twitter.com" target="_blank" class="twitter"></a>
			</div>
			<p>
				© 2020 SecureWorld. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>