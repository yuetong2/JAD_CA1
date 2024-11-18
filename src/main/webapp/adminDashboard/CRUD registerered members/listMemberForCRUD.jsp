<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.DatabaseConnection" %> <!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
</head>
<body>
<%

try {
    // Step 1: Use the DatabaseConnection class to get a connection
    Connection conn = DatabaseConnection.getConnection(); // Get the connection from DatabaseConnection class

    // Step 2: Create Statement object
    Statement stmt = conn.createStatement();

    // Step 3: Execute SQL Command
    String sqlStr = "SELECT * FROM user where role_id=1";
    ResultSet rs = stmt.executeQuery(sqlStr);

    // Step 4: Display the results
%>

<form action="addMemberForm.jsp" method="get">
    <input type="submit" value="Add New Member" />
</form>

<table border="1" class="center">
<tr>
    <th>user_id</th>
    <th>username</th>
    <th>password</th>
    <th>created_on</th>
    <th>updated_on</th>
    <th>action</th>
</tr>

<%
    while (rs.next()) {
        int userId = rs.getInt("user_id");
        String username = rs.getString("username");
        String password = rs.getString("password");
        String createdOn = rs.getString("created_on");
        String updatedOn = rs.getString("updated_on");
%>

<tr>
    <td><%= userId %></td>
    <td><%= username %></td>
    <td><%= password %></td>
    <td><%= createdOn %></td>
    <td><%= updatedOn %></td>
    <td>
        <form action="editMemberForm.jsp" method="post" style="display: inline;">
            <input type="hidden" name="userId" value="<%= userId %>" />
            <input type="hidden" name="username" value="<%= username %>" />
            <input type="hidden" name="password" value="<%= password %>" />
            <input type="submit" value="Edit" />
        </form>
        <form action="deleteMember.jsp" method="post" style="display: inline;">
            <input type="hidden" name="userId" value="<%= userId %>" />
            <input type="submit" value="Delete" />
        </form>
    </td>
</tr>

<%
    }

    // Step 5: Close connections
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

</table>

</body>
<style>
    .center {
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    table.center {
        border-collapse: collapse;
    }
</style>

</html>
