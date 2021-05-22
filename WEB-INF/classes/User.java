package com;
public class User
{
	private String fname;
	private String lname;
	private String gender;
	private String email;
	private String password;
	public void setFname(String fname)
	{
		this.fname=fname;
	}
	public String getFname()
	{
		return fname;
	}
	public void setLname(String lname)
	{
		this.lname=lname;
	}
	public String getLname()
	{
		return lname;
	}
	public void setGender(String gender)
	{
		this.gender=gender;
	}
	public String getGender()
	{
		return gender;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public String getPassword()
	{
		return password;
	}
}