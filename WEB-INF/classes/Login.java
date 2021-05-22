package com;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;
import java.util.List;
import java.util.Iterator;
public class Login
{
	public static User main(String email,String password)
	{
		User u=null;
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction t=session.beginTransaction();
		Query query=session.createQuery("from User where email=:e and password=:p");
		query.setParameter("e",email);
		query.setParameter("p",password);
		List list=query.list();
		Iterator itr=list.iterator();
		if(itr.hasNext())
		{
			u=(User)itr.next();
		}
		return u;
	}
}