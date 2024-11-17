<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Service</title>
</head>
<body>


<h2 align="center">Add Service Form</h2>

<form action="createServiceForm.jsp" method="post">
    <table class="center">
        
        <tr>
            <td>Service Name:</td>
            <td>
                <input type="text" name="serviceName" " />
            </td>
        </tr>
        <tr>
            <td>Service Description:</td>
            <td>
                <textarea name="serviceDescription" rows="4" cols="50"></textarea>
            </td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>
                <input type="text" name="price" value="" />
            </td>
        </tr>
        <tr>
            <td>Service Category Id:</td>
            <td>
                <input type="text" name="serviceCategoryId" value="" />
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