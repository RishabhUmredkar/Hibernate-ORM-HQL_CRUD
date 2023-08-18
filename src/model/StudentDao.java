package model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class StudentDao {

	public static Session getSession(){
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		return session;
		
	}
	
	public static int SaveStudent(Student s){
		Session s1 = StudentDao.getSession();
		Transaction tx = s1.beginTransaction();
		int status = (Integer)s1.save(s);
		System.out.println("Object is saved successfully........");
		tx.commit();
		s1.close();
		return status;
		
	}

}
