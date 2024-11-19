<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.DatabaseConnection" %> <!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Member</title>
</head>
<body>

<%
    // Retrieve parameters from the request
    String userId = request.getParameter("userId");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (userId != null && username != null) {
        // SQL query to update the member
        String updateQuery = "UPDATE user SET username = ?, password = ?, updated_on = NOW() WHERE user_id = ?";
        
        try {
            // Use the DatabaseConnection class to get the connection
            Connection conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, userId);

            // Execute update
            int count = stmt.executeUpdate();

            if (count > 0) {
                out.println("<h3>Member updated successfully!</h3>");
                out.println("<p>Member ID: " + userId + "<br>Username: " + username + "</p>");
            } else {
                out.println("<h3>No member was updated. Please check the Member ID.</h3>");
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


