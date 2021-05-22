<!DOCTYPE HTML>
<!-- Website template by freewebsitetemplates.com -->
<html>
<%
String email=request.getParameter("email");
%>
<head>
	<meta charset="UTF-8">
	<title>Login-Secure World</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script type="text/javascript" src="check_ajax.js"></script>
		<script type="text/javascript" src="registration_validation.js"></script>
	
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
				<a href="index.jsp">SecureWorld</a>
			</div>
			<ul id="navigation">
				<li>
					<a href="index.jsp">Home</a>
				</li>
				<li class="active">
					<a href="login.jsp">Login</a>
				</li>
				<li >
					<a href="registration.html">Registration</a>
				</li>
				<li>
					<a href="about.html">About</a>
				</li>
				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="contents">
	<Br><Br>
		<form name="form1" action="change_password.jsp" method="post">
        <div class="d">
		<h1>Update Password</h1>
            <div class="control">
                <div class="lbl">New Password</div>
                <div class="lb1"><input type="password" name="t4" id="t4" size="30" /></div>&nbsp;
            </div>
            <div class="control">
                <div class="lbl">Confirm New Password</div>
                <div class="lb1"><input type="password" name="cpass" size="30""/></div>
            </div>
			<input type="hidden" name="email" value="<%=email%>" size="30""/>
		<div class="control">       
           <input type="submit" value="Update" name="submit" class="submit1" onclick="return recoverComplete()"/>
            <input type="reset" value="Cancel" name="cancel" class="Cancel1"/>
			</div>
            
        </div>
		
        </form>
		
	</div>
	<div id="footer">
		<div class="clearfix">
			<div id="connect">
				<a href="http://www.facebook.com" target="_blank" class="facebook"></a><a href="http://plus.google.com" target="_blank" class="googleplus"></a><a href="http://twitter.com" target="_blank" class="twitter"></a>
			</div>
			<p>
				© 2015 SecureWorld. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>