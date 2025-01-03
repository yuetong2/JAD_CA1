<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="../../CSS/styleDashboard.css">

</head>
<body>
	<%
    // Pagination and search parameters
    int recordsPerPage = 5;
    int currentPage = 1;
    String searchTerm = request.getParameter("search") != null ? request.getParameter("search") : "";
    
    // Get current page number
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    
    // Calculate offset
    int offset = (currentPage - 1) * recordsPerPage;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int totalRecords = 0;

    try {
        // Establish connection
        conn = DatabaseConnection.getConnection();
        
        // Count total records with search filter
        String countQuery = "SELECT COUNT(*) AS total FROM service WHERE service_name LIKE ? OR service_description LIKE ?";
        pstmt = conn.prepareStatement(countQuery);
        pstmt.setString(1, "%" + searchTerm + "%");
        pstmt.setString(2, "%" + searchTerm + "%");
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            totalRecords = rs.getInt("total");
        }
        
        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        
        // Prepare query with pagination and search
        String sqlStr = "SELECT * FROM service WHERE service_name LIKE ? OR service_description LIKE ? LIMIT ? OFFSET ?";
        pstmt = conn.prepareStatement(sqlStr);
        pstmt.setString(1, "%" + searchTerm + "%");
        pstmt.setString(2, "%" + searchTerm + "%");
        pstmt.setInt(3, recordsPerPage);
        pstmt.setInt(4, offset);
        
        rs = pstmt.executeQuery();
%>
	<div class="main">
		<div class="add-service-form" style="float: left">
			<form action="addServiceForm.jsp" method="get">
				<input type="submit" class="add-service-btn" value="Add New Service" />
			</form>
		</div>

		<!-- Search Form -->
		<div class="search-container" style="float: left">
			<form action="" method="get">
				<input type="text" name="search" placeholder="Search services"
					value="<%= searchTerm %>" /> <input type="submit" value="Search" />
			</form>
		</div>



		<div class="table-container">
			<table border="1" class="center">
				<tr>
					<th>Service ID</th>
					<th>Service Name</th>
					<th>Service Description</th>
					<th>Image</th>
					<th>Price</th>
					<th>Service Category ID</th>
					<th>Actions</th>
				</tr>
				<% 
        while (rs.next()) {
            int serviceId = rs.getInt("service_id");
            String serviceName = rs.getString("service_name");
            String serviceDescription = rs.getString("service_description");
            String image = rs.getString("image");
            double price = rs.getDouble("price");
            int serviceCategoryId = rs.getInt("service_category_id");
        %>
				<tr>
					<td><%= serviceId %></td>
					<td><%= serviceName %></td>
					<td><%= serviceDescription %></td>
					<td><%= image %></td>
					<td><%= price %></td>
					<td><%= serviceCategoryId %></td>
					<td>
						<form action="editServiceForm.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="serviceId" value="<%= serviceId %>" />
							<input type="hidden" name="serviceName"
								value="<%= serviceName %>" /> <input type="hidden"
								name="serviceDescription" value="<%= serviceDescription %>" />
							<input type="hidden" name="image" value="<%= image %>" /> <input
								type="hidden" name="price" value="<%= price %>" /> <input
								type="hidden" name="serviceCategoryId"
								value="<%= serviceCategoryId %>" /> <input type="submit"
								value="Edit" class="edit-btn" />
						</form>
						<form action="deleteService.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="serviceId" value="<%= serviceId %>" />
							<input type="submit" value="Delete" class="delete-btn" />
						</form>
					</td>
				</tr>
				<% } %>
			</table>
			<!-- Pagination Controls -->
			<div class="pagination">
				<% 
        // Previous page link
        if (currentPage > 1) { 
        %>
				<a href="?page=<%= currentPage - 1 %>&search=<%= searchTerm %>">Previous</a>
				<% 
        } 
        
        // Page numbers
        for (int i = 1; i <= totalPages; i++) { 
        %>
				<a href="?page=<%= i %>&search=<%= searchTerm %>"
					<%= (i == currentPage) ? "style='font-weight: bold;'" : "" %>>
					<%= i %>
				</a>
				<% } 
        
        // Next page link
        if (currentPage < totalPages) { 
        %>
				<a href="?page=<%= currentPage + 1 %>&search=<%= searchTerm %>">Next</a>
				<% } %>
			</div>
		</div>
	</div>
	<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Properly close resources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>