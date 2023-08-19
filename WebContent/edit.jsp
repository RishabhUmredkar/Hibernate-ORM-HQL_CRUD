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

Student status = StudentDao.getStudent(id);

if(status>0)
{
	response.sendRedirect("show.jsp");
}
%>
</body>
</html>