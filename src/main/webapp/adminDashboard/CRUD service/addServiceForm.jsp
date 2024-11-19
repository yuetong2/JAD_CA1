<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="dbConnection.DatabaseConnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Service</title>
    <link rel="stylesheet" type="text/css" href="../../CSS/dashboardForm.css">
</head>
<style>
.dropdown {
    width: 100%; /* Full-width for better alignment */
    padding: 10px; /* Add padding for better touch targets */
    border: 1px solid #ccc; /* Border around the dropdown */
    border-radius: 5px; /* Rounded corners */
    background-color: #f9f9f9; /* Light background */
    font-size: 16px; /* Adjust font size for readability */
    color: #333; /* Text color */
    cursor: pointer; /* Change cursor to pointer for interactivity */
}

.dropdown option {
    padding: 10px; /* Padding inside dropdown options */
    color: #333; /* Option text color */
    background-color: #fff; /* Option background color */
}

.dropdown:focus {
    outline: none; /* Remove default outline on focus */
    border-color: #007bff; /* Highlight border on focus */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Add shadow for focus effect */
}
</style>

<body>

    <h2 align="center">Add Service Form</h2>

    <form action="createServiceForm.jsp" method="post">
        <table class="center">
            <tr>
                <td>Service Name:</td>
                <td><input type="text" name="serviceName" /></td>
            </tr>
            <tr>
                <td>Service Description:</td>
                <td><textarea name="serviceDescription" rows="4" cols="50"></textarea></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" value="" /></td>
            </tr>
            <tr>
                <td>Service Category:</td>
                <td>
                    <select name="serviceCategoryId" class="dropdown">
                        <option value="" disabled selected>-- Select Category --</option>
                        <% 
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            try {
                                // Establish database connection
                                conn = DatabaseConnection.getConnection();
                                String query = "SELECT service_category_id, service_category_name FROM servicecategory";
                                pstmt = conn.prepareStatement(query);
                                rs = pstmt.executeQuery();

                                // Populate dropdown with categories
                                while (rs.next()) {
                                    int categoryId = rs.getInt("service_category_id");
                                    String categoryName = rs.getString("service_category_name");
                        %>
                                    <option value="<%= categoryId %>"><%= categoryName %></option>
                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                // Close resources
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form>

</body>
<style>
.center {
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}

table.center {
    border-collapse: collapse;
}
</style>
</html>
