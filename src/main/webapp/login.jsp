<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<%--

  - Author(s): Angie Wu
  - Date: 21/10/2024
  - Copyright Notice:
  - @(#)
  - Description: This is my Practical 2 answers
  --%>
<body>

<!-- Login Form -->
<form action="./verifyUser.jsp" method="post">
    <label for="loginid">Login ID:</label>
    <input type="text" name="loginid" id="loginid">
    <br>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password">
    <br>
    <input type="submit" name="btnSubmit" value="Login">
    <input type="reset" name="btnReset" value="Reset">
</form>

</body>
</html>
