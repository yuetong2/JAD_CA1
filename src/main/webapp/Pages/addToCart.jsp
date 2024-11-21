<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dbConnection.DatabaseConnection" %>
<%@ page import="cart.CartItem" %> <!-- Import the CartItem class -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kitchen Cleaning Service</title>
    <link rel="stylesheet" type="text/css" href="../CSS/addToCart.css">
</head>
<body>
<%
    // Mock data for service name and service ID
    String serviceName = "Kitchen Cleaning";
    String serviceId = "1";

    String userId = "1"; // Placeholder for user ID (retrieve dynamically in a real application)

    double price = 0.0; // Default price in case of no result

    try {
        // Establish connection
        Connection conn = DatabaseConnection.getConnection();

        // SQL query to get the price for the service with the given serviceId
        String sqlStr = "SELECT price FROM service WHERE service_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sqlStr);
        pstmt.setString(1, serviceId);
        ResultSet rs = pstmt.executeQuery();

        // If result exists, retrieve the price
        if (rs.next()) {
            price = rs.getDouble("price");
        }

        // Close resources
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (request.getMethod().equalsIgnoreCase("POST")) {
        // Retrieve form data
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String specialRequest = request.getParameter("specialRequest");

        // Create a new CartItem object
        CartItem cartItem = new CartItem(serviceName, serviceId, price, date, startTime, address, contact, specialRequest);

        // Retrieve the cart from session, or initialize a new cart
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Add the new item to the cart
        cart.add(cartItem);

        // Store the updated cart in the session
        session.setAttribute("cart", cart);

        // Provide feedback to the user
        out.println("<script>alert('Item added to cart!');</script>");
    }
%>

<div class="form-container">
    <h2>You have selected our <strong><%= serviceName %></strong> service</h2>
    <form action="addToCart.jsp" method="post">
        <label for="date">Enter Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="startTime">Enter Start Time:</label>
        <input type="time" id="startTime" name="startTime" required>

        <label for="address">Enter Address:</label>
        <input type="text" id="address" name="address" placeholder="Enter your address" required>

        <label for="contact">Contact Number:</label>
        <input type="text" id="contact" name="contact" placeholder="Enter your contact number" required>

        <label for="specialRequest">Special Request (if any):</label>
        <input type="text" id="specialRequest" name="specialRequest" placeholder="Enter any special requests">

        <p class="price">Price: $<%= price %></p>

        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
    </form>
</div>
</body>
</html>


