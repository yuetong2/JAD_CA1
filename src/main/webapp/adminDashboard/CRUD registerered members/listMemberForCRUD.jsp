<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<!-- Import DatabaseConnection class -->

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
    int recordsPerPage = 5;  // Adjust this to set the number of records per page
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
        conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class
        
        // Count total records with search filter
    	String countQuery = "SELECT COUNT(*) AS total FROM user WHERE (username LIKE ? OR password LIKE ?) AND role_id = 1";
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
    	String sqlStr = "SELECT * FROM user WHERE (username LIKE ? OR password LIKE ?) AND role_id = 1 LIMIT ? OFFSET ?";
        pstmt = conn.prepareStatement(sqlStr);
        pstmt.setString(1, "%" + searchTerm + "%");
        pstmt.setString(2, "%" + searchTerm + "%");
        pstmt.setInt(3, recordsPerPage);
        pstmt.setInt(4, offset);
        
        rs = pstmt.executeQuery();
%>
	<div class="main">
		<div class="add-service-form" style="float: left">
			<form action="addMemberForm.jsp" method="get">
				<input type="submit" class="add-service-btn" value="Add New Member" />
			</form>
		</div>

		<!-- Search Form -->
		<div class="search-container" style="float: left;">
			<form action="" method="get">
				<input type="text" name="search" placeholder="Search users"
					value="<%= searchTerm %>" /> <input type="submit" value="Search" />
			</form>
		</div>

		<div class="table-container">
			<table border="1" class="center">
				<tr>
					<th>User ID</th>
					<th>Username</th>
					<th>Password</th>
					<th>Created On</th>
					<th>Updated On</th>
					<th>Actions</th>
				</tr>

				<%
        while (rs.next()) {
            int userId = rs.getInt("user_id");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String createdOn = rs.getString("created_on");
            String updatedOn = rs.getString("updated_on");
        %>

				<tr>
					<td><%= userId %></td>
					<td><%= username %></td>
					<td><%= password %></td>
					<td><%= createdOn %></td>
					<td><%= updatedOn %></td>
					<td>
						<form action="editMemberForm.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="userId" value="<%= userId %>" /> <input
								type="hidden" name="username" value="<%= username %>" /> <input
								type="hidden" name="password" value="<%= password %>" /> <input
								type="submit" value="Edit" class="edit-btn" />
						</form>
						<form action="deleteMember.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="userId" value="<%= userId %>" /> <input
								type="submit" value="Delete" class="delete-btn" />
						</form>
					</td>
				</tr>

				<% 
        } 
        %>
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


