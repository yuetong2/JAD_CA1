<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%
    String field = request.getParameter("field");
    String value = request.getParameter("value");
    Integer userId = (Integer) session.getAttribute("user_id");

    if (field == null || value == null || userId == null) {
        out.println("Invalid request.");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
        Connection conn = DriverManager.getConnection(connURL);

        String sql = "UPDATE User SET " + field + " = ? WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, value);
        pstmt.setInt(2, userId);

        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println(field + " updated successfully!");
        } else {
            out.println("No changes were made.");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred while updating the user.");
    }
%>
