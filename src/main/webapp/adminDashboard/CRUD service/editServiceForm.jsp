<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Service</title>
<link rel="stylesheet" type="text/css" href="../../CSS/dashboardForm.css">

</head>
<body>

<%
String serviceId = request.getParameter("serviceId");
String serviceName = request.getParameter("serviceName");
String serviceDescription =request.getParameter("serviceDescription");
String image = request.getParameter("image");
String price = request.getParameter("price");
String serviceCategoryId = request.getParameter("serviceCategoryId");

%>
<h2 align="center">Edit Service Form</h2>

<form action="updateServiceForm.jsp" method="post">
    <table class="center">
        <tr>
            <td>Id:</td>
            <td>
                <input type="text" name="serviceId" value="<%= serviceId %>" readonly />
            </td>
        </tr>
        <tr>
            <td>Service Name:</td>
            <td>
                <input type="text" name="serviceName" value="<%= serviceName %>" />
            </td>
        </tr>
        <tr>
            <td>Service Description:</td>
            <td>
                <textarea name="serviceDescription" rows="4" cols="50"><%= serviceDescription %></textarea>
            </td>
        </tr>
        <tr>
            <td>Image URL:</td>
            <td>
                <input type="text" name="image" value="<%= image %>" />
            </td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>
                <input type="text" name="price" value="<%= price %>" />
            </td>
        </tr>
        <tr>
            <td>Service Category Id:</td>
            <td>
                <input type="text" name="serviceCategoryId" value="<%= serviceCategoryId %>" />
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
