<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String serviceId = request.getParameter("serviceId");

    if (serviceId != null) {
        String deleteQuery = "DELETE FROM service WHERE service_id = ?";

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jad_ca1?user=root&password=gaeturtle696&serverTimezone=UTC");

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(deleteQuery);
            stmt.setString(1, serviceId);

            // Execute delete
            int count = stmt.executeUpdate();

            if (count > 0) {
                out.println("<h3>Service deleted successfully!</h3>");
                out.println("<p>Service ID: " + serviceId + "</p>");
            } else {
                out.println("<h3>No service was deleted. Please check the service ID.</h3>");
            }

            // Close connection
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