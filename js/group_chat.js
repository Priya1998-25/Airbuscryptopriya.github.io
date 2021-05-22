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
function inputResponse(request)
{
	//alert(cbcontent);
	if(request.readyState==4)
	{
		var response=request.responseText;
		var cbc=document.getElementById("content");
		cbc.value=response;
	}
}
function checkChatBoxInputKey1(event)         //cbit is input text field
{
	var inputText=document.getElementById("cbit");
	if(inputText.value!="")
	{
	var request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var url="group_chat.jsp?inputText="+inputText.value;
	inputText.value='';
	request.open("GET",url,true);
	request.onreadystatechange=function(){inputResponse(request)};
	request.send(null);
	inputText.value='';
	}
}
function checkInput(event)
{
	if(event.keyCode == 13 && event.shiftKey == 0 )
	{
		checkChatBoxInputKey1(event);
	}
	
}
function getHeartBeat(request)
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var cbc=document.getElementById("content");
		cbc.innerHTML=response;
		//cbcontent.value=response;
	}
}
function checkHeartBeat()
{
		//alert(cbcontent);
		//var cbc=document.getElementById(cbcontent);
		//cbc.innerText="successfully worked";
	var request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var url="group_chat.jsp?receiveContent='content receiveng request'";
	request.open("GET",url,true);
	request.onreadystatechange=function(){getHeartBeat(request);}
	request.send(null);
}