var request;
function fnameValidation()
{
	var fname=document.form1.t1.value;
	if(fname=="")
	{
		alert("first name can not be blank");
		document.form1.t1.focus;
		return false;
	}
	return true;
}
function lnameValidation()
{
	var lname=document.form1.t2.value;
	if(lname=="")
	{
		alert("last name name can not be blank");
		document.form1.t2.focus;
		return false;
	}
	return true;
}
function emailValidation()
{
	var email=document.form1.t3.value;
	var mail2=document.getElementById("mail2");
	var i1=email.indexOf("@");
	var i2=email.indexOf(".");
	var i3=email.lastIndexOf(".");
	var content="<font color='red'>incorrect email id</font>";
	if(email=="")
	{
		mail2.innerHTML="<font color='red'>please enter this field</font>";
		document.form1.t3.focus;
		return false;		
	}
	else
	{
		mail2.innerHTML="";
		//mail2.innerHTML="";
		document.form1.t3.focus;
	}
	emailDatabaseCheck();
	return true;
}
function passwordValidation()
{
	var pass=document.form1.t4.value;
	if(pass=="")
	{
		alert("password can not be blank");
		document.form1.t4.focus;
		return false;
	}
	return true;
}
function createRequest()
{
	try
	{
		request=new XMLHttpRequest();
	}
	catch(exc)
	{
		try
		{
			request=new ActiveXObject("MSxml2.XMLHTTP");
		}
		catch(exc)
		{
			try
			{
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(exc)
			{
				request=null;
			}
		}
	}
	return request;
}
function emailInfo()
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var mail2=document.getElementById("mail2");
		mail2.innerHTML=response;
	}
}
function emailDatabaseCheck()
{
	request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var email=document.form1.t3.value;
	var url="check_reg.jsp?email="+email;
	request.open("GET",url,true)
	request.onreadystatechange=emailInfo;
	request.send(null);
}
function complete()
{
	var v=fnameValidation();
	if(v==false)
	{
		return false;
	}
	v=lnameValidation();
	if(v==false)
	{
		return false;
	}
	v=emailValidation();
	if(v==false)
	{
		window.alert("Incorrect email id");
		return false;
	}
	v=passwordValidation();
	if(v==false)
	{
		return false;
	}
	v=alternateEmailValidation();
	if(v==false)
	{
		window.alert("Incorrect alternate email id");
		return false;
	}	
	v=mobileValidation();
	if(v==false)
	{
		return false;
	}
	v=answerValidation();
	if(v==false)
	{
		return false;
	}
	v=captchaValidation();
	if(v==false)
	{
		return false;
	}
	return true;	
}


function passwordValidation2()
{
	var pass=document.form1.t4.value;
	var cpass=document.form1.cpass.value;
	if(pass!=cpass)
	{
		alert("password and Confirm Password Must be Same");
		document.form1.t4.focus;
		return false;
	}
	return true;
}
function recoverComplete()
{
	v=passwordValidation();
	if(v==false)
	{
		return false;
	}
	v=passwordValidation2();
	if(v==false)
	{
		return false;
	}
	return true;	
}

