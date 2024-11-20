<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Link to external custom CSS -->
    <link rel="stylesheet" type="text/css" href="../CSS/contactUs.css">
</head>
<body>

    <%@ include file="../Pages/navbar.jsp" %>

    <div class="container d-flex flex-column align-items-center justify-content-center min-vh-100">
        <!-- Social Icons -->
        <div class="social-icons d-flex justify-content-center mb-4">
            <img src="../images/instagram.png" alt="Instagram" class="icon">
            <img src="../images/gmail.png" alt="Gmail" class="icon">
            <img src="../images/facebook.png" alt="Facebook" class="icon">
        </div>

        <!-- Contact Form -->
        <div class="contact-form bg-light p-4 rounded shadow-sm" style="max-width: 500px; width: 100%;">
            <h2 class="mb-4 text-center">Contact Us</h2>
            <form action="../Server/submitContactUsForm.jsp" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="comments" class="form-label">Comments:</label>
                    <textarea id="comments" name="comments" rows="4" class="form-control" required></textarea>
                </div>
                <button type="submit" class="btn btn-success w-100">Submit</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Success message popup -->
    <%
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
    %>
        <script>
            alert("<%= successMessage %>");
        </script>
    <%
        // Clear the success message after displaying it
        session.removeAttribute("successMessage");
        }
    %>

</body>
</html>
