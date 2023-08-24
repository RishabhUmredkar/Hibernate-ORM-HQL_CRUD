<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="model.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background: linear-gradient(45deg, #FF6B6B, #FFD166, #06D6A0, #118AB2);
  background-size: 600% 600%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

table {
  border-collapse: collapse;
  width: 90%;
  max-width: 800px;
  margin: 50px auto;
  background-color: rgba(255, 255, 255, 0.8);
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

th, td {
  text-align: left;
  padding: 12px;
}

th {
  background-color: #34495E;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

.button {
  display: inline-block;
  border: none;
  background-color: #007bff;
  color: white;
  padding: 6px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 2px;
  cursor: pointer;
  border-radius: 4px;
}

.button-edit {
  background-color: #28a745;
}

.button-delete {
  background-color: #dc3545;
}

@media (max-width: 600px) {
  table {
    width: 95%;
  }
}
</style>
</head>
<body>

<%
Session s = StudentDao.getSession();
Query q = s.createQuery("from Student");

List<Student> list = q.list();
request.setAttribute("list", list);
%>

<table>
  <tr>
    <th>User ID</th>
    <th>First Name</th>
    <th>Password</th>
    <th>Action</th>
  </tr>
  <c:forEach items="${list}" var="u">
    <tr>
      <td>${u.getId()}</td>
      <td>${u.getName()}</td>
      <td>${u.getPass()}</td>
      <td>
        <a href="edit.jsp?id=${u.getId()}" class="button button-edit">Edit</a>
        <a href="delete.jsp?id=${u.getId()}" class="button button-delete">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
