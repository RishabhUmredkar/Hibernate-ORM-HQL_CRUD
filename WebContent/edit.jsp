<%@page import="model.Student"%>
<%@page import="model.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease, visibility 0.3s ease;
    z-index: 999;
  }

  .modal {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 400px;
    transform: scale(0.8);
    opacity: 0;
    transition: transform 0.3s ease, opacity 0.3s ease;
  }

  .modal.active {
    transform: scale(1);
    opacity: 1;
  }

  .login-form input[type="text"],
  .login-form input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
  }

  .login-form input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
  }

  .login-form input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>
<title>Login Form</title>
</head>
<body>


<%
int id = Integer.parseInt(request.getParameter("id"));

//int status = StudentDao.getStudent(id);
Student st = null; 
 	st= new StudentDao().getStudent(id);
 	
 	if(st!=null)
 	{
 	%>
  <div class="login-container">
    <h2>Login</h2>
    <form class="login-form" action="update.jsp">
      <input type="text" name="id" value =<%=st.getId() %>   placeholder="ID">
      <input type="text" name = "name" value =<%=st.getName() %> placeholder="Name">
      <input type="text" name = "pass" value =<%=st.getPass() %> placeholder="Password">
      <input type="submit" value="Update">
    </form>
    
  </div>
  <%} %>
</body>
</html>

