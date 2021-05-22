<%@page import="java.sql.*,java.util.Date,java.util.Map,java.util.LinkedHashMap,java.text.*,java.util.Set,java.util.Iterator"%>
<%@page errorPage="error.jsp"%>
<%!
  Map map=new LinkedHashMap();
  long noOfMessages=0;
%>
<%!
	String getUsername(String email)
	{
		String user=email.substring(0,email.indexOf("@"));
		user=trimUser(user);
		return user;
	}

String trimUser(String s)
{
	while(true)
		{
		int i=s.indexOf(".");
		if(i==-1)
			break;
		else if(i==0)
		{
			s=s.substring(1,s.length());
		}
		else if(i==s.length()-1)
		{
			s=s.substring(0,s.length()-1);	
		}
		else
		{
			String s1=s.substring(0,i);
			String s2=s.substring(i+1,s.length());
			s=s1+s2;
		}
	}
	return s;
}
String randomColor()
{
	int i=(int)(Math.random()*11);
	if(i==1) return "blue";
	if(i==2) return "red";
	if(i==3) return "#666666";
	if(i==4) return "#00FF00";
	if(i==5) return "#000066";
	if(i==6) return "#0066FF";
	if(i==7) return "cyan";
	if(i==8) return "#FFFF33";
	if(i==9) return "#33CC00";
	if(i==10) return "#CC0066";
	if(i==11) return "#FF0099";
	if(i==0) return "#00CCFF";
	return "green";
}
%>
<%
	String inputText=request.getParameter("inputText");
	String fetchTo=request.getParameter("fetchTo");
	String sendText=request.getParameter("receiveContent");
	com.User u=(com.User)session.getAttribute("user");
	String username=getUsername(u.getEmail());
	username=trimUser(username);
	
	Connection c=(Connection)application.getAttribute("connection");
	if(inputText!=null)
	{
		DateFormat df=new SimpleDateFormat("dd-MMM-yyyy");
		String date=df.format(new Date());
		PreparedStatement ps=c.prepareStatement("insert into GROUP_CHAT values(?,?,?)");
		ps.setString(1,username);
		ps.setString(2,inputText);
		ps.setString(3,date);
		int i=ps.executeUpdate();
		if(i>0)
			System.out.println("input text received");
		noOfMessages++;
		map.put("msg"+noOfMessages,username+":"+inputText);
		//out.println(username+": "+inputText);
	}
	if(sendText!=null) // sending heart beat text
	{	
		int size=map.size();
		//System.out.println("size : "+size);
		String user="";
		String msg="";
		String msgNo="";
		String allTimeMsg="";
		if(size==0)
		{
			PreparedStatement ps=c.prepareStatement("select * from GROUP_CHAT");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				user=rs.getString(1);
				msg=rs.getString(2);
				
				noOfMessages++;
				map.put(randomColor()+":msg"+noOfMessages,user+":"+msg);
				allTimeMsg=allTimeMsg+"<br><font color='red'><b>"+user+"</font> :</b> "+msg;
			}
		}
		else
		{
			Set set=map.entrySet();
			Iterator iterator=set.iterator();
			while(iterator.hasNext())
			{
				
				Map.Entry entry=(Map.Entry)iterator.next();
				msgNo=(String)entry.getKey();
				String color=msgNo.split(":")[0];
				msg=(String)entry.getValue();
				user=msg.split(":")[0];
				msg=msg.substring(msg.indexOf(":")+1,msg.length());
				allTimeMsg=allTimeMsg+"<br><font color='"+color+"'><b>"+user+"</font> :</b> "+msg;
			}
		}
		out.println(allTimeMsg);
	}	
%>