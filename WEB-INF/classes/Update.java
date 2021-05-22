package com;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;
import java.util.List;
import java.util.Iterator;
public class Update
{
	public static int main(String pass,String email)
	{
		int i=-1;
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction t=session.beginTransaction();
		Query query=session.createQuery("update User set password=:p where email=:e");
		query.setParameter("p",pass);
		query.setParameter("e",email);		
		i=query.executeUpdate();
		t.commit();
		return i;
	}
}