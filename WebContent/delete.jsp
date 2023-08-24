<%@page import="org.hibernate.Transaction"%>
<%@page import="model.Student"%>
=<%@page import="org.hibernate.Session"%>
<%@page import="model.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

Session s = StudentDao.getSession();
Transaction tx = s.beginTransaction();

Student st=(Student)s.get(Student.class, id);

s.delete(st);

tx.commit();
s.close();


response.sendRedirect("show.jsp");



%>

<!-- int status = StudentDao.deleteStudent(id);

if(status>0)
{
	response.sendRedirect("show.jsp");
}
-->

%>
</body>
</html>