<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="cart.CartItem"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking</title>
    <link rel="stylesheet" type="text/css" href="../CSS/checkout.css">
</head>
<body>
<%
    // Get userId from session
   // Integer userId = (Integer) session.getAttribute("userId");
    
   // if (userId == null) {
    //    out.println("<p>User is not logged in. Please log in first.</p>");
   //     return;
   // }
   
   Integer userId =1;

    // Retrieve cart items from session
    List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");

    // Establish database connection
    Connection conn = null;
    PreparedStatement pstmtBooking = null;
    PreparedStatement pstmtDetails = null;
    ResultSet rs = null;
    int bookingId = -1;

    try {
        // Get the connection
        conn = DatabaseConnection.getConnection();
        conn.setAutoCommit(false); // Disable auto-commit

        // Step 1: Insert into 'booking' table
        String insertBookingSQL = "INSERT INTO booking (user_id, status_id) VALUES (?, 1)";
        pstmtBooking = conn.prepareStatement(insertBookingSQL, Statement.RETURN_GENERATED_KEYS);
        pstmtBooking.setInt(1, userId);
        pstmtBooking.executeUpdate();

        // Get the generated booking ID
        rs = pstmtBooking.getGeneratedKeys();
        if (rs.next()) {
            bookingId = rs.getInt(1);  // The ID of the newly created booking
        }

        // Step 2: Insert into 'booking_details' table for each service
        if (cartItems != null && !cartItems.isEmpty() && bookingId != -1) {
            String insertDetailsSQL = "INSERT INTO booking_details (address, start_time, special_request, service_id, booking_id) VALUES (?, ?, ?, ?, ?)";
            pstmtDetails = conn.prepareStatement(insertDetailsSQL);

            // Define date and time format patterns
			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // Matches the input
            SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Desired output format

            for (CartItem item : cartItems) {
                // Combine item.getDate() and item.getStartTime() into a datetime string
                String dateTimeString = item.getDate() + " " + item.getStartTime();

                // Parse and format the combined datetime string
                Date dateTime = null;
                try {
                    dateTime = inputDateFormat.parse(dateTimeString);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                String formattedDateTime = dateTime != null ? outputDateFormat.format(dateTime) : null;

                pstmtDetails.setString(1, item.getAddress());  // address
                pstmtDetails.setString(2, formattedDateTime);   // start_time (formatted as datetime)
                pstmtDetails.setString(3, item.getSpecialRequest());  // special_request (assuming it's a field in CartItem)
                pstmtDetails.setInt(4, Integer.parseInt(item.getServiceId()));  // service_id
                pstmtDetails.setInt(5, bookingId);  // booking_id (foreign key)

                pstmtDetails.executeUpdate();  // Insert each service
            }
        }

        // Commit the transaction
        conn.commit();
        out.println("<p>Booking confirmed successfully!</p>");
        session.removeAttribute("cart");
        out.println("<p>Your cart has been cleared.</p>");
        
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        try {
            if (conn != null) {
                conn.rollback();  // Rollback in case of error
            }
        } catch (Exception rollbackEx) {
            rollbackEx.printStackTrace();
        }
        out.println("<p>There was an error confirming the booking. Please try again later.</p>");
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (pstmtBooking != null) pstmtBooking.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (pstmtDetails != null) pstmtDetails.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>

</body>
</html>

