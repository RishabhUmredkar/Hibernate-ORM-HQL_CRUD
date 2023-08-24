<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.StudentDao"%>
<%@page import="model.Student"%>
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
String name = request.getParameter("name");
String pass = request.getParameter("pass");

Session s = StudentDao.getSession();
Transaction tx = s.beginTransaction();
Student st=(Student)s.get(Student.class, id);

st.setName(name);
st.setPass(pass);

tx.commit();
s.close();
//Student st = new Student(id, name , pass);
//int  a = new StudentDao().update(st);
if (st!=null)
{
	out.print("value update ");
	response.sendRedirect("show.jsp");
}
else{
out.print("error");
out.print("update page "+id);

}
%>
</body>
</html>