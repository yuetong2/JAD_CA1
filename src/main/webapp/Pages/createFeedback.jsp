<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.DatabaseConnection" %> <!-- Adjust import as necessary -->

<!DOCTYPE html>
<html>
<head>
    <title>Submit Review</title>
</head>
<body>
<%
    // Retrieve form data
    String bookingDetailId = request.getParameter("bookingDetailId");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comment");
    String suggestions = request.getParameter("suggestions");

    // Initialize response message
    String responseMessage = "";

    if (bookingDetailId != null && rating != null && comments != null) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Connect to the database
            conn = DatabaseConnection.getConnection(); // Use your custom connection class

            // Insert query
            String sql = "INSERT INTO feedback (booking_detail_id,  rating, comments, improvement) " +
                         "VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, bookingDetailId);
            stmt.setInt(2, Integer.parseInt(rating));
            stmt.setString(3, comments);
            stmt.setString(4, suggestions);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                responseMessage = "Thank you! Your review has been submitted successfully.";
            } else {
                responseMessage = "Sorry, there was an error submitting your review. Please try again.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            responseMessage = "Error: " + e.getMessage();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    } else {
        responseMessage = "Please fill out all required fields.";
    }
%>

<h1><%= responseMessage %></h1>
<a href="leaveAReview.jsp">Back to Review Page</a>

    <jsp:include page="footer.html" />

</body>
</html>
