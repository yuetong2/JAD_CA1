<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<!-- Link to the external CSS file -->
<link rel="stylesheet" type="text/css" href="../CSS/userProfile.css">
<script src="../User/modal.js"></script> <!-- Link to external JavaScript file -->

</head>
<body>

<%
    // Set user_id to 1 directly
    session.setAttribute("user_id", 1);
    Integer userId = 1; // Hardcoded user_id for testing
%>

<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="sidebar">
        <h3>Menu</h3>
        <a href="javascript:void(0);" onclick="loadContent('account')">Account Details</a>
        <a href="javascript:void(0);" onclick="loadContent('bookingHistory')">Booking History</a>
    </div>

    <div class="main-content">
        <div class="content-box" id="content-area">
            <!-- Dynamic content will be loaded here -->
        </div>
    </div>
</div>

</body>
<script>
    function loadContent(contentType) {
        const contentArea = document.getElementById('content-area');

        if (contentType === 'account') {
            // Fetch user account details from the server and update content dynamically
            fetch('../User/getUserDetails.jsp')
                .then(response => response.text())
                .then(data => {
                    contentArea.innerHTML = data;
                })
                .catch(error => {
                    contentArea.innerHTML = '<p>Error fetching user details.</p>';
                });
        } else if (contentType === 'bookingHistory') {
            contentArea.innerHTML = '<h2>Booking History</h2><p>Your booking history will be displayed here...</p>';
        } else {
            contentArea.innerHTML = '<h2>Welcome!</h2><p>Select a menu item from the sidebar.</p>';
        }
    }

    window.onload = function() {
        loadContent('account'); // Default to account details on page load
    }
</script>
</html>
