<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Service</title>
</head>
<body>

<%
String userId = request.getParameter("userId");
String username = request.getParameter("username");
String password = request.getParameter("password");
%>
<h2 align="center">Edit Member Form</h2>

<form action="updateMemberForm.jsp" method="post">
    <table class="center">
        <tr>
            <td>Id:</td>
            <td>
                <input type="text" name="userId" value="<%= userId %>" readonly />
            </td>
        </tr>
        <tr>
            <td>username:</td>
            <td>
                <input type="text" name="username" value="<%= username %>" />
            </td>
        </tr>
        <tr>
            <td>password:</td>
            <td>
                <input type="text" name="password" value="<%= password %>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="Submit" />
            </td>
        </tr>
    </table>
</form>


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
