var request;
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
function fusionInfo()
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var fusedimage=document.getElementById("fusedimage");
		fusedimage.innerHTML=response;
	}
}
function fusionCheck()
{
	alert("fusion check");
	request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var ofile=document.form1.ofile.value;
alert(ofile);
	var keyfile=document.form1.keyfile.value;
	var url="check_fusion.jsp?ofile="+ofile+"&&keyfile="+keyfile;
	request.open("GET",url,true)
	request.onreadystatechange=fusionInfo;
	request.send(null);
}

function recoverPasswordInfo()
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var forgotpassword=document.getElementById("forgotpassword");
		forgotpassword.innerHTML=response;
	}
}
function recoverPassword()
{
	//alert("password check");
	request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var email=document.form1.email.value;
	var url="mailpassword.jsp?email="+email;
	request.open("GET",url,true);	
	request.onreadystatechange=recoverPasswordInfo;
	request.send(null);
}
