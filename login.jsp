<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<title>Login-Secure World</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script type="text/javascript" src="check_ajax.js"></script>
	<script type="text/javascript" src="refresh.js"></script>
	<script>
		function check_otp()
		{
			var otp=document.otpform.otp.value;
			var ootp=document.otpform.ootp.value;
			if(otp!=ootp)
			{
				alert("Please Enter Correct OTP");
				return false;
			}
			return true;
		}
	</script>
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
<%
				com.User u=(com.User)session.getAttribute("user");
				if(u!=null)
				{
		response.sendRedirect("index.jsp");
				}
%>
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
		<form name="form1" action="login_validation.jsp" method="post">
        <div class="d">
		<h1>Login</h1>
            <div class="control">
                <div class="lbl">Email id</div>
                <div class="lb1"><input type="text" name="email" id="email" size="30" /></div>&nbsp;
            </div>
            <div class="control">
                <div class="lbl">Password</div>
                <div class="lb1"><input type="password" name="password" size="30" onBlur="passwordValidation()"/></div>
            </div>
		<div class="control">       
           <input type="submit" value="Login" name="submit" class="submit1"/>
            <input type="reset" value="Cancel" name="cancel" class="Cancel1"/>
			</div>
			<div class="control">
                <div class="lbl"><a href="javascript:void(0)" onClick="return recoverPassword()">Help_to_recover_Password??</a></div>
            </div>
			 </form>
		 </div>
		 
		 <div class="d">
             
        <span id="forgotpassword"></span>    
        
		</div>
		
		
	</div>
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
