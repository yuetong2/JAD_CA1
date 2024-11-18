<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.DatabaseConnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Service</title>
    <link rel="stylesheet" type="text/css" href="../../CSS/dashboardForm.css">
    
</head>
<body>

<%
    String serviceId = request.getParameter("serviceId");

    if (serviceId != null) {
        String deleteQuery = "DELETE FROM service WHERE service_id = ?";

        try {
            // Step 1: Establish connection using the DatabaseConnection class
            Connection conn = DatabaseConnection.getConnection();

            // Step 2: Prepare the delete statement
            PreparedStatement stmt = conn.prepareStatement(deleteQuery);
            stmt.setString(1, serviceId);

            // Step 3: Execute the delete statement
            int count = stmt.executeUpdate();

            // Step 4: Provide feedback to the user
            if (count > 0) {
                out.println("<h3>Service deleted successfully!</h3>");
                out.println("<p>Service ID: " + serviceId + "</p>");
            } else {
                out.println("<h3>No service was deleted. Please check the service ID.</h3>");
            }

            // Step 5: Close the connection
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>Service ID parameter missing.</h3>");
    }
%>

<form action="listServiceForCRUD.jsp" method="get">
    <input type="submit" value="Back to List Services" />
</form>

</body>
</html>
