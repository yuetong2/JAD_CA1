<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Our Services</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="../CSS/home.css">
</head>
<body>

	<!-- Navbar -->
	<%@ include file="navbar.jsp"%>

	<!-- Hero Section -->
	<section class="hero bg-primary text-white text-center py-5">
		<div class="container">
			<h1 class="display-4">Welcome to Our World of Services</h1>
			<p class="lead">Discover premium quality services designed just
				for you!</p>
			<a href="#services" class="btn btn-light btn-lg">Explore Our
				Services</a>
		</div>
	</section>

	<!-- Services Section -->
	<section id="services" class="py-5 bg-light">
		<div class="container">
			<h2 class="text-center mb-4">Our Featured Services</h2>
			<div id="servicesCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
						Connection conn = DriverManager.getConnection(connURL);

						// Fetch services from the database
						String sql = "SELECT service_name, service_description, image, price FROM service LIMIT 5";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						boolean isFirstItem = true;

						while (rs.next()) {
							String serviceName = rs.getString("service_name");
							String serviceDescription = rs.getString("service_description");
							String image = rs.getString("image");
							double price = rs.getDouble("price");

							// Set the default image if the image is null or empty
							if (image == null || image.isEmpty()) {
						image = "defaultImage.png"; // Default image path
							}
					%>
					<!-- Service Item -->
					<div class="carousel-item <%=isFirstItem ? "active" : ""%>">
						<div class="row justify-content-center">
							<div class="col-md-6">
								<div class="card shadow">
									<img src="../images/<%=image%>.png" class="card-img-top"
										alt="<%=serviceName%>">
									<div class="card-body">
										<h5 class="card-title"><%=serviceName%></h5>
										<p class="card-text"><%=serviceDescription%></p>
										<p class="card-text">
											<strong>Price: </strong>$<%=price%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					isFirstItem = false; // Set the first item as active and then set the rest to non-active
					}
					rs.close();
					pstmt.close();
					conn.close();
					} catch (Exception e) {
					e.printStackTrace();
					out.println("<p>Error loading services.</p>");
					}
					%>
				</div>
				<!-- Carousel controls -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#servicesCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#servicesCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>

	<!-- Reviews Section -->
	<section id="services" class="py-5 bg-light">
		<div class="container">
			<h2 class="text-center mb-4">Our Featured Services</h2>
			<div id="servicesCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
						Connection conn = DriverManager.getConnection(connURL);

						// Fetch services from the database
						String sql = "SELECT service_name, service_description, image, price FROM service LIMIT 5";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						boolean isFirstItem = true;

						while (rs.next()) {
							String serviceName = rs.getString("service_name");
							String serviceDescription = rs.getString("service_description");
							String image = rs.getString("image");
							double price = rs.getDouble("price");

							// Set the default image if the image is null or empty
							if (image == null || image.isEmpty()) {
						image = "defaultImage.png"; // Default image path
							}
					%>
					<!-- Card Design -->
					<div class="carousel-item <%=isFirstItem ? "active" : ""%>">
						<div class="card">
							<div class="card-inner" style="--clr: #fff;">
								<div class="box">
									<div class="imgBox">
										<img src="../images/<%=image%>" alt="<%=serviceName%>">
									</div>
									<div class="icon">
										<a href="#" class="iconBox"> <span
											class="material-symbols-outlined">arrow_outward</span>
										</a>
									</div>
								</div>
							</div>
							<div class="content">
								<h3><%=serviceName%></h3>
								<p><%=serviceDescription%></p>
								<ul>
									<li style="--clr-tag: #d3b19a;" class="branding">Branding</li>
									<li style="--clr-tag: #70b3b1;" class="pricing">Price: $<%=price%></li>
								</ul>
							</div>
						</div>
					</div>
					<%
					isFirstItem = false;
					}
					rs.close();
					pstmt.close();
					conn.close();
					} catch (Exception e) {
					e.printStackTrace();
					out.println("<p>Error loading services.</p>");
					}
					%>
				</div>
				<!-- Carousel Controls -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#servicesCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#servicesCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>
	<jsp:include page="footer.html" />


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
