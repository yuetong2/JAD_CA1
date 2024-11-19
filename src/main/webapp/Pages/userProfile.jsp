<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../CSS/userProfile.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
    <div class="sidebar">
        <h3>Menu</h3>
        <a href="javascript:void(0);" onclick="loadContent('account')">Account Details</a>
        <a href="javascript:void(0);" onclick="loadContent('bookingHistory')">Booking History</a>
    </div>
    <div class="main-content">
        <div class="content-box" id="content-area"></div>
    </div>
</div>

<script>
    function loadContent(contentType) {
        const contentArea = document.getElementById('content-area');

        if (contentType === 'account') {
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
        loadContent('account');
    };

    function updateField(field, newValue) {
        fetch('../User/updateUser.jsp', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'field=' + encodeURIComponent(field) + '&value=' + encodeURIComponent(newValue)
        })
        .then(response => response.text())
        .then(message => {
            alert(message);
        })
        .catch(error => {
            alert('Error updating ' + field);
        });
    }

    function toggleEdit(field) {
        const displaySpan = document.getElementById(field + '-display');
        const editSpan = document.getElementById(field + '-edit');
        const editButton = document.getElementById(field + '-edit-btn');

        if (editSpan.style.display === 'none') {
            // Switch to edit mode
            displaySpan.style.display = 'none';
            editSpan.style.display = 'inline';
            editButton.textContent = 'Save';
        } else {
            // Save changes and switch back to display mode
            const newValue = document.getElementById(field + '-input').value;
            updateField(field, newValue);

            displaySpan.textContent = newValue; // Update display with new value
            displaySpan.style.display = 'inline';
            editSpan.style.display = 'none';
            editButton.textContent = 'Edit';
        }
    }

</script>
</body>
</html>
