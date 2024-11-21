<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="cart.CartItem"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="../CSS/checkout.css">
</head>
<body>
<%
    // Retrieve the cart items from the session
    List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");

    // Calculate total price
    double totalPrice = 0.0;
    if (cartItems != null && !cartItems.isEmpty()) {
        for (CartItem item : cartItems) {
            totalPrice += item.getPrice();
        }
    }
%>

<div class="checkout-container">
    <h1>Checkout</h1>
    <% if (cartItems == null || cartItems.isEmpty()) { %>
        <p>Your cart is empty. Please add items to the cart before checking out.</p>
    <% } else { %>
        <% for (CartItem item : cartItems) { %>
            <div class="cart-item">
            <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String image = "";

            try {
                // Establish connection
                conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

                // Prepare the query to retrieve the image for the service
                String sqlStr = "SELECT image FROM service WHERE service_id = ?";
                pstmt = conn.prepareStatement(sqlStr);
                pstmt.setString(1, item.getServiceId()); // Corrected method call
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    image = rs.getString("image");
                }
            } catch (Exception e) {
                e.printStackTrace(); // Add error handling if needed
            } finally {
                // Close resources in finally block to prevent resource leaks
                try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
            %>
                <img src="../images/<%= image %>" alt="<%= item.getServiceName() %>" class="item-image">
                <div class="item-details">
                    <h3><%= item.getServiceName() %></h3>
                    <p><%= item.getDate() %> <%= item.getStartTime() %></p>
                    <p><%= item.getAddress() %></p>
                </div>
                <div class="item-price">
                    <p>$<%= item.getPrice() %></p>
                </div>
            </div>
        <% } %>

        <div class="total-section">
            <h2>Total: $<%= totalPrice %></h2>
        </div>

        <form action="confirmBooking.jsp" method="post">
            <button type="submit" class="confirm-booking-btn">Confirm booking</button>
        </form>
    <% } %>
</div>

</body>
</html>

