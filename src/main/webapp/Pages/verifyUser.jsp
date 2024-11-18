<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@page import="java.util.*,java.time.*"%>
<%--

  - Author(s): Angie Wu
  - Date: 15/11/2024
  - Copyright Notice:
  - @(#)
  - Description: This is my Practical 5 answers
  --%>
<body>

	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	String userRole = "";
	String username = "";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		//Angie's connection:
		String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
		// Yuetong's connection
		//String connURL = "jdbc:mysql://localhost/jadpract4?user=root&password=password1234&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		// Step 4: Prepare PreparedStatement
		String sql = "select * from User WHERE username = ? AND password =? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, password);

		// Step 5: Execute the query
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			
			session.setAttribute("userRole", userRole);
			session.setAttribute("username", username);

			
		} else {
			// No matching record found, redirect back to login page with error
			response.sendRedirect("home.jsp?errCode=invalidLogin");
		}

		conn.close();

	} catch (Exception e) {

		out.println("Exception occurred");
		System.out.print(e);
	}
	%>
</body>
</html>