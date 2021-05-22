var link_id="link";
var link_id_increament=1;
var fname_increment=1;
var fname="fname1";
function attachLink()
{
	//alert("link clicked");
	//var email=document.form1.email.value;
	var link=document.getElementById(link_id);
	link_id=link_id+link_id_increament;
	fname=fname+fname_increment;
	var content="<input type='file' value='browse...' name='"+fname+"'/><br/><span id='"+link_id+"'></span>";	// here link is incrementing as link1 then link11 then link111 and so on... and fname is as fname11 then fname111 then fname1111 and so on...
	link.innerHTML=content;
	return true;
}
function changeTheme()
{
	var option1=document.getElementById("option1");
	var option2=document.getElementById("option2");
	var option3=document.getElementById("option3");
	var option4=document.getElementById("option4");
	var option5=document.getElementById("option5");
	var content="<a href='change_theme.jsp?theme=1'><font color='red'>Red</font>-<font color='green'>Green</font> theme</a>";
	option1.innerHTML=content;
	content="<a href='change_theme.jsp?theme=2'><font color='#0099CC'>Sky Blue</font>-<font color='pink'>Pink</font> theme</a>";
	option2.innerHTML=content;
	content="<a href='change_theme.jsp?theme=3'><font color='brown'>Brown</font>-<font color='green'>Green</font> theme</a>";
	option3.innerHTML=content;
	content="<a href='change_theme.jsp?theme=4'><font color='yellow'>Yellow</font>-<font color='red'>Red</font> theme</a>";
	option4.innerHTML=content;
	content="<a href='change_theme.jsp?theme=5'><font color='#FF0099'>Violet</font>-<font color='blue'>Blue</font> theme</a>";
	option5.innerHTML=content;
}
function check_email()
{
	var email=document.form1.email.value;
	if(email=="")
		alert("Please Enter an Email to recover Password.");
}
var amail="";
function getAlternateMail()
{
		return amail;
}
function recoverPassword1(alternate_mail)
{
	amail=alternate_mail;
	var s1=alternate_mail.charAt(0);
	var s2=alternate_mail.charAt(alternate_mail.indexOf('@')-1);
	var index1=alternate_mail.indexOf('@');
	var index2=alternate_mail.length;
	var s3=alternate_mail.substring(index1,index2);
	var showMailAgainstTheField=s1+".............."+s2+s3;
	//var r_value=document.getElementById("recovery1");
	var option=document.getElementById("option1");
		var content="Your Alternate Email Address : <input type='text' name='email' id='email' value='"+alternate_mail+"'> ("+showMailAgainstTheField+")<br><br> <input type='submit' value='Get OTP' onClick='return emailVerification()'/><br><br><span id='msg'></span>";
	option.innerHTML=content;
}
function recoverPassword2(mobile)
{
	var showMobileAgainstTheField="*.............."+mobile.substring(8,10);
	//var r_value=document.getElementById("recovery2");
	var option=document.getElementById("option1");
	var content="Your Registered 10 digit Mobile NO : <input type='text' name='mobile' maxlength=10 id='mobile'> ("+showMobileAgainstTheField+")<br><br> <input type='submit' value='Get OTP' onClick='return mobileVerification("+mobile+")'><br><br><span id='msg'></span>";	
	option.innerHTML=content;
}