package model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;


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

	public static List<Student> getAllRecord(){
		List<Student> ul = new ArrayList<>();
		Session s1= StudentDao.getSession();
		Query q = s1.createQuery("From Student");
		ul= q.list();
		s1.close();
		
		return ul;
		
	}
	
	public static int deleteStudent(int id){
		Session s1 = StudentDao.getSession();
		Transaction tx = s1.beginTransaction();
		Query q = s1.createQuery("delete From Student where id=:i");
		q.setParameter("i", id);
		int status = q.executeUpdate();
		System.out.println("Object is saved successfully........");
		tx.commit();
		s1.close();
		return status;
		
	}
	
	public static Student getStudent(int id) {
	    Session session = StudentDao.getSession();
	    Transaction tx = session.beginTransaction();

	    Query query = session.createQuery("from Student where id = :i");
	    query.setParameter("i", id);

	    Student student = (Student) query.uniqueResult(); // Assuming 'id' is unique for students

	    tx.commit();
	    session.close();

	    return student;
	}

	
}
