<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register User</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
        out.println("<p>All fields are required. Please fill out the form completely.</p>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name
            // Database connection URL
            String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";

            // Establish connection
            Connection conn = DriverManager.getConnection(connURL);

            // Check if the username already exists
            String checkUserSql = "SELECT * FROM User WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkUserSql);
            checkStmt.setString(1, username);

            ResultSet checkRs = checkStmt.executeQuery();

            if (checkRs.next()) {
                // Username already exists
                out.println("<p>Username already exists. Please choose a different username.</p>");
            } else {
                // Insert new user into the database with default role_id = 1
                String insertSql = "INSERT INTO User (username, password, role_id, created_on, updated_on) VALUES (?, ?, 1, NOW(), NOW())";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);

                int rowsInserted = insertStmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<p>User registered successfully with default role!</p>");
                } else {
                    out.println("<p>Failed to register user. Please try again.</p>");
                }
            }

            // Close connections
            conn.close();

        } catch (Exception e) {
            out.println("<p>Exception occurred during registration.</p>");
            e.printStackTrace(out);
        }
    }
%>
</body>
</html>
