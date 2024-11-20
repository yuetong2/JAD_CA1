<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<link rel="stylesheet" type="text/css" href="../CSS/review.css">

</head>
<body>
	<h1>Reviews</h1>

	<%
	try {
		// Step 1: Use the DatabaseConnection class to get a connection
		Connection conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

		// Step 2: Create Statement object
		Statement stmt = conn.createStatement();

		// Step 3: Execute SQL Command
		String sqlStr = "SELECT " + "    u.username, " + "    f.comments, " + "    f.rating, " + "    s.service_name "
		+ "FROM " + "    feedback f " + "JOIN "
		+ "    booking_details bd ON f.booking_detail_id = bd.booking_details_id " + "JOIN "
		+ "    booking b ON bd.booking_id = b.booking_id " + "JOIN " + "    user u ON b.user_id = u.user_id "
		+ "JOIN " + "    service s ON bd.service_id = s.service_id " + "GROUP BY "
		+ "    u.username, f.comments, f.rating, s.service_name;";

		ResultSet rs = stmt.executeQuery(sqlStr);

		// Step 4: Display the results
	%>
	<div class="container">
		<%
		while (rs.next()) {
			String username = rs.getString("username");
			String comments = rs.getString("comments");
			int rating = rs.getInt("rating");
			String serviceName = rs.getString("service_name");

			// Build the star rating (out of 5)
			StringBuilder stars = new StringBuilder();
			for (int i = 0; i < 5; i++) {
				if (i < rating) {
			stars.append("★"); // Filled star
				} else {
			stars.append("☆"); // Empty star
				}
			}
		%>
		<div class="card">
			<p class="rating">
				<span class="star"><%=stars.toString()%></span>
			</p>
			<h3>
				<strong></strong> "<%=comments%>"
			</h3>

			<h2>
				Service:
				<%=serviceName%></h2>
			<p>
				<strong>By:</strong>
				<%=username%></p>
		</div>
		<%
		}

		// Step 5: Close connections
		rs.close();
		stmt.close();
		conn.close();
		} catch (Exception e) {
		out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
		}
		%>
	</div>

	<jsp:include page="footer.html" />

</body>
</html>



