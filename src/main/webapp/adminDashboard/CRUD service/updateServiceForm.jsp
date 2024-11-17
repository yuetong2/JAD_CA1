<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>Update Service</title>
</head>
<body>

<%
    String serviceId = request.getParameter("serviceId");
    String serviceName = request.getParameter("serviceName");
    String serviceDescription = request.getParameter("serviceDescription");
    String image = request.getParameter("image");
    String price = request.getParameter("price");
    String serviceCategoryId = request.getParameter("serviceCategoryId");

    if (serviceId != null && serviceName != null) {
        String updateQuery = "UPDATE service SET service_name = ?, service_description = ?, image = ?, price = ?, service_category_id = ? WHERE service_id = ?";
        
        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jad_ca1?user=root&password=gaeturtle696&serverTimezone=UTC");

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, serviceName);
            stmt.setString(2, serviceDescription);
            stmt.setString(3, image);
            stmt.setString(4, price);
            stmt.setString(5, serviceCategoryId);
            stmt.setString(6, serviceId);

            // Execute update
            int count = stmt.executeUpdate();

            if (count > 0) {
                out.println("<h3>Service updated successfully!</h3>");
                out.println("<p>Service ID: " + serviceId + "<br>Service Name: " + serviceName + "</p>");
            } else {
                out.println("<h3>No service was updated. Please check the service ID.</h3>");
            }

            // Close connection
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>Service ID or name parameter missing.</h3>");
    }
%>

<form action="listServiceForCRUD.jsp" method="get">
    <input type="submit" value="Back to List Services" />
</form>

</body>
</html>
