<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
<%

try {
// Step1: Load JDBC Driver – TO BE OMITTED for newer drivers
Class.forName("com.mysql.jdbc.Driver");
// Step 2: Define Connection URL
String connURL =
"jdbc:mysql://localhost/jad_ca1?user=root&password=gaeturtle696&serverTimezone=UTC";
// Step 3: Establish connection to URL
Connection conn =
DriverManager.getConnection(connURL);

// Step 4: Create Statement object
Statement stmt = conn.createStatement();
// Step 5: Execute SQL Command
String sqlStr = "SELECT * FROM service";
ResultSet rs = stmt.executeQuery(sqlStr);
// Step 6: Process Result
%>

<form action="addServiceForm.jsp" method="get">
    <input type="submit" value="Add New Service" />
</form>

<table border="1" class="center">
<tr>
	<th>service_id</th>
	<th>service name</th>
	<th>service description</th>
	<th>image</th>
	<th>price</th>
	<th>service_category_id</th>
	<th>action</th>
</tr>

<%
while (rs.next()) {
int serviceId = rs.getInt("service_id");
String serviceName = rs.getString("service_name");
String serviceDescription = rs.getString("service_description");
String image = rs.getString("image");
double price = rs.getDouble("price");
int serviceCategoryId = rs.getInt("service_category_id");

%>
<tr>
<td><%=serviceId%></td>
<td><%=serviceName%></td>
<td><%= serviceDescription%></td>
<td><%= image%></td>
<td><%= price%></td>
<td><%= serviceCategoryId%></td>
<td>
    <form action="editServiceForm.jsp" method="post" style="display: inline;">
        <input type="hidden" name="serviceId" value="<%= serviceId %>" />
        <input type="hidden" name="serviceName" value="<%= serviceName %>" />
        <input type="hidden" name="serviceDescription" value="<%= serviceDescription %>" />
        <input type="hidden" name="image" value="<%= image %>" />
        <input type="hidden" name="price" value="<%= price %>" />
        <input type="hidden" name="serviceCategoryId" value="<%= serviceCategoryId %>" />
        
        <input type="submit" value="Edit" />
    </form>
     <form action="deleteService.jsp" method="post" style="display: inline;">
        <input type="hidden" name="serviceId" value="<%= serviceId %>" />
        <input type="submit" value="Delete" />
    </form>
</td>
<%
}

// Step 7: Close connection
 rs.close();
stmt.close();
conn.close();
} catch (Exception e) {
out.println("Error :" + e);
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