<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome Secure World</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
		<script type="text/javascript" src="check_ajax.js"></script>
		<script type="text/javascript" src="refresh.js"></script>
		<style type="text/css" >
        .d
        {
            border: 1px solid black;
            width: 400px;
            height:auto;
            margin-left: 30%;
            background-color: #81BEF7;
            
}
  .control
  {
      width: 380px;
      height: 50px;
      padding: 5px;
      margin: 5px;
     
      
}
.captcha
  {
      width: 400px;
      height: 100px;
      padding: 5px;
      margin: 5px;
    

}
.captcha1
{
    height: 100px;
    width: 100px;
    background-image:  url("captcha.jpg");
    margin-left: 150px;
    text-align: center;
 padding-top: 40px;
}
.submit1
{
    height: 40px;
    width: 80px;
    
    margin-left: 100px;
 
}
.Cancel1
{
    height: 40px;
    width: 80px;
    margin-right:20px;
    
 
    margin-left: 20px;
            
 
}
    .lbl
    {
        width: 100px;
        height: 17px;
        padding: 7px;
        font-family: Tahoma;
        font-size: 15px;
        float: left;
        margin-left: 15px;

            
    }
    .txt
    {
        width: 240px;
        height: 17px;
        padding: 7px;
        margin-left: 120px;

            
       
}
.link
</style>

</head>
<body>
	<div id="header">
		<div>
			<div class="logo">
				<a href="index.html">SecureWorld</a>
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
				<li class="active">
					<a href="fusion.jsp">Fusion/Defusion</a>
				</li>
				<li>
					<a href="encryption.jsp">Encryption/Decryption</a>
				</li>
				<li>
					<a href="mail.jsp">Mailing</a>
				</li>
			<%
				}
			%>
				
				<li>
					<a href="logout.jsp">Not You? Logout!!</a>
				</li>
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
			<div>
				
				<form name="form1" action="check_fusion.jsp" method="post" enctype="multipart/form-data">
        <div class="d">
		<h2>Fusion/Defusion</h2><br>
            <div class="control">
                <div class="lbl">Original Image</div>
                <div class="lb1"><input type="file" name="ofile" id="ofile" size="30" required/></div>&nbsp;
            </div>
   	        <div class="control">
                <div class="lbl">Key Image</div>
               <div class="lb1"><input type="file" name="keyfile" id="keyfile" size="30" required/></div>&nbsp;
            </div>
		<div class="control">	                    
           <input type="submit" value="Fuse" name="fuse" class="submit1""/>
            <input type="submit" value="Defuse" name="fuse" class="Cancel1"/>
			</div>
        </div>
        </form>
			</div>
	  </div>
	  <Br><br>
	  				<center>				<span id="fusedimage">Fused Image Here</span></center>
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