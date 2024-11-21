<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Contact Us Form</title>
</head>
<body>
    <%
        // Retrieve form data from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String comment = request.getParameter("comments");

        try {
            // Database connection details
            Class.forName("com.mysql.cj.jdbc.Driver");
            String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
            Connection conn = DriverManager.getConnection(connURL);

            // SQL query to insert data into contactus table
            String sql = "INSERT INTO contactus (contactUs_name, contactUs_email, contactUs_comment) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);     
            pstmt.setString(2, email);    
            pstmt.setString(3, comment);  

            // Execute the insertion
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Set the success message in the session
                session.setAttribute("successMessage", "Your message has been successfully submitted!");
                // Redirect to the contactUs.jsp page
                response.sendRedirect("../Pages/contactUs.jsp");
            } else {
                out.println("An error occurred while submitting your message.");
            }

            // Close the connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while submitting your message.");
        }
    %>
</body>
</html>
