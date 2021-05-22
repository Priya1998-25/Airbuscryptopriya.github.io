<html>
    <head>

        <title>JSP Page</title>
<link type="text/css" rel="stylesheet" media="all" href="css/group_chat.css" />
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
<script type="text/javascript" src="js/group_chat.js">

</script>
<script>
	var interval = setInterval(function() {checkHeartBeat()}, 1000);
</script>
    </head>
	
    <body style="background-color:skyblue">
	
<div id="header">
		<div>
			<div class="logo">
				<a href="index.jsp">SecureWorld</a>
			</div>
			<ul id="navigation">
				<li>
					<a href="index.jsp">Home</a>
				</li>
			<%
				com.User u=(com.User)session.getAttribute("user");
				if(u==null)
				{
					response.sendRedirect("index.jsp");
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
	
	    <table align="center" style="margin-top:20px" width="80%" height="80%">
     <td> 
           

               <div align="center"> 
			  <b>Chat Area :</b>
			  <div class="chatboxcontent"><span id="content">content loading...</span> </div>
           <!--  <textarea cols="70" rows="30" id="content" name="content" style="background-color:#CC99FF " scrolling="yes" readonly="readonly">content loading...</textarea>-->
               <br/>
             
               <br/>
			   				
					  
                   Say Somthing:  <input type="text" id="cbit" name="cbit" size="50" onKeyPress="checkInput(event)"/>  <input type="submit" value="Send" name="inbox" onClick="checkChatBoxInputKey1(event)"/>&nbsp;
               </div>
</td>
		                </table>
						
		
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