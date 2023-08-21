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

Student st = new Student(name , pass);
int  a = new StudentDao().update(st);
if (a>0)
{
	out.print("value update ");
	response.sendRedirect("show.jsp");
}
else{
	out.print("error");
	response.sendRedirect("show.jsp");

}
%>
</body>
</html>