<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.DatabaseConnection"%>
<!-- Import DatabaseConnection class -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link rel="stylesheet" type="text/css" href="../CSS/leaveAReview.css">
</head>
<body>
	<div class=reviewForm>

		<h1>Leave your review</h1>
		<%
		// String bookingDetailId = request.getParameter("bookingDetailId");
		//session.getAttribute("userId")
		String bookingDetailId = "123243";
		String userId = "1";
		%>
		<form action="createFeedback.jsp" method="post">
			<input type="hidden" name="bookingDetailId"
				value="<%=bookingDetailId%>"> <input type="hidden"
				name="userId" value="<%=userId%>">

			<h3>
				You are currently leaving a review for booking service:
				<%=bookingDetailId%></h3>
			<p>How would you rate your experience out of 5 stars?</p>

			<div class="star-rating">
				<input type="radio" id="star5" name="rating" value="5" /> <label
					for="star5" title="5 stars">★</label> <input type="radio"
					id="star4" name="rating" value="4" /> <label for="star4"
					title="4 stars">★</label> <input type="radio" id="star3"
					name="rating" value="3" /> <label for="star3" title="3 stars">★</label>
				<input type="radio" id="star2" name="rating" value="2" /> <label
					for="star2" title="2 stars">★</label> <input type="radio"
					id="star1" name="rating" value="1" /> <label for="star1"
					title="1 star">★</label>
			</div>

			<p>Share details of your own experience with us:</p>
			<textarea name="comment" rows="4" cols="50"></textarea>

			<p>Any suggestions for improvement?</p>
			<textarea name="suggestions" rows="4" cols="50"></textarea>

			<button type="submit">Submit Review</button>
		</form>
	</div>

	<jsp:include page="footer.html" />

</body>
</html>

