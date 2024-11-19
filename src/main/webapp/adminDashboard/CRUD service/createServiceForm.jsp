<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Service</title>
</head>
<body>

	<%
    // Retrieve form data
    String serviceName = request.getParameter("serviceName");
    String serviceDescription = request.getParameter("serviceDescription");
    String image = "default.jpg";
    String price = request.getParameter("price");
    String serviceCategoryId = request.getParameter("serviceCategoryId");

    if (serviceName != null && serviceDescription != null && price != null && serviceCategoryId != null) {
        String insertQuery = "INSERT INTO service (service_name, service_description, image, price, service_category_id) VALUES (?, ?, ?, ?, ?)";

        try {
            // Step 1: Establish connection using the DatabaseConnection class
            Connection conn = DatabaseConnection.getConnection();

            // Step 2: Prepare statement for inserting service data
            PreparedStatement stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, serviceName);
            stmt.setString(2, serviceDescription);
            stmt.setString(3, image);
            stmt.setString(4, price);
            stmt.setString(5, serviceCategoryId);

            // Step 3: Execute the insert statement
            int count = stmt.executeUpdate();

            // Step 4: Provide feedback to the user
            if (count > 0) {
                out.println("<h3>New Service Created Successfully!</h3>");
                out.println("<p>Service Name: " + serviceName + "<br>Service Description: " + serviceDescription + "</p>");
            } else {
                out.println("<h3>Failed to create new service. Please check the input data.</h3>");
            }

            // Step 5: Close the connection
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>All fields are required to create a new service.</h3>");
    }
%>

	<form action="listServiceForCRUD.jsp" method="get">
		<input type="submit" value="Back to List Services" />
	</form>

</body>
</html>


