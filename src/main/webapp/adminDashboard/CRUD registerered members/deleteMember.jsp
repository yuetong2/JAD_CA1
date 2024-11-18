<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.DatabaseConnection" %> <!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Member</title>
</head>
<body>

<%
    // Retrieve memberId parameter from the request
    String userId = request.getParameter("userId");

    if (userId != null) {
        // SQL query to delete the member
        String deleteQuery = "DELETE FROM user WHERE user_id = ?";

        try {
            // Use the DatabaseConnection class to get the connection
            Connection conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(deleteQuery);
            stmt.setString(1, userId);

            // Execute delete
            int count = stmt.executeUpdate();

            if (count > 0) {
                out.println("<h3>Member deleted successfully!</h3>");
                out.println("<p>Member ID: " + userId + "</p>");
            } else {
                out.println("<h3>No member was deleted. Please check the Member ID.</h3>");
            }

            // Close connection
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>User ID parameter missing.</h3>");
    }
%>

<form action="listMemberForCRUD.jsp" method="get">
    <input type="submit" value="Back to List Members" />
</form>

</body>
</html>

