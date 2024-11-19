<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Member</title>
</head>
<body>

	<%
    // Retrieve parameters from the request
    String username = request.getParameter("username");
	String password = request.getParameter("password");
	String role = "1";

    if (username != null && password!=null) {
        // SQL query to update the member
        String updateQuery = "INSERT INTO user (username, password, role_id) VALUES (?,?,?)";
        
        try {
            // Use the DatabaseConnection class to get the connection
            Connection conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);

            // Execute update
            int count = stmt.executeUpdate();

            if (count > 0) {
                out.println("<h3>Member created successfully!</h3>");
                out.println("<p>Username: " + username + "</p>");
            } else {
                out.println("<h3>No member was created. Please check the Member ID.</h3>");
            }

            // Close connection
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>Member ID or username parameter missing.</h3>");
    }
%>

	<form action="listMemberForCRUD.jsp" method="get">
		<input type="submit" value="Back to List Members" />
	</form>

</body>
</html>


