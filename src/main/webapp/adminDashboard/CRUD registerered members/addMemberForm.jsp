<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Service</title>
<link rel="stylesheet" type="text/css"
	href="../../CSS/dashboardForm.css">

</head>
<body>

	<h2 align="center">Create Member Form</h2>

	<form action="createMemberForm.jsp" method="post">
		<table class="center">
			<tr>

			</tr>
			<tr>
				<td>username:</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="text" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="Submit" /></td>
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
