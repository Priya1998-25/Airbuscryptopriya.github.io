package com;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;
import java.util.List;
import java.util.Iterator;
public class CheckReg
{
	public static int main(String email)
	{
		int i=-1;
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction t=session.beginTransaction();
		Query query=session.createQuery("from User where email=:e");
		query.setParameter("e",email);
		List list=query.list();
		Iterator itr=list.iterator();
		if(itr.hasNext())
			i=1;
		return i;
	}
}