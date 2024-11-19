<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Services</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../CSS/style.css">

    <!-- Bootstrap JS & Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../User/modal.js"></script>
</head>
<body>

    <!-- Navbar -->
    <%@ include file="../Pages/navbar.jsp" %>

    <!-- Hero Section -->
    <section class="hero bg-primary text-white text-center py-5">
        <div class="container">
            <h1 class="display-4">Welcome to Our World of Services</h1>
            <p class="lead">Discover premium quality services designed just for you!</p>
            <a href="#services" class="btn btn-light btn-lg">Explore Our Services</a>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4">Our Featured Services</h2>
            <div class="row">
                <!-- Service 1 -->
                <div class="col-md-4 mb-4">
                    <div class="card shadow">
                        <img src="../images/service1.jpg" class="card-img-top" alt="Service 1">
                        <div class="card-body">
                            <h5 class="card-title">Cleaning Services</h5>
                            <p class="card-text">We offer high-quality cleaning services for your home and office. Let us make your space shine.</p>
                        </div>
                    </div>
                </div>
                <!-- Service 2 -->
                <div class="col-md-4 mb-4">
                    <div class="card shadow">
                        <img src="../images/service2.jpg" class="card-img-top" alt="Service 2">
                        <div class="card-body">
                            <h5 class="card-title">Consulting</h5>
                            <p class="card-text">Professional consulting services tailored to your business needs, driving success and growth.</p>
                        </div>
                    </div>
                </div>
                <!-- Service 3 -->
                <div class="col-md-4 mb-4">
                    <div class="card shadow">
                        <img src="../images/service3.jpg" class="card-img-top" alt="Service 3">
                        <div class="card-body">
                            <h5 class="card-title">Event Planning</h5>
                            <p class="card-text">From corporate events to weddings, our expert planners make your events memorable and seamless.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Reviews Section -->
    <section class="bg-dark text-white py-5">
        <div class="container">
            <h2 class="text-center mb-4">What Our Clients Say</h2>
            <div id="reviewsCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- Review 1 -->
                    <div class="carousel-item active">
                        <blockquote class="blockquote text-center">
                            <p>"Absolutely fantastic service! I am extremely pleased with the work done on my office. Highly recommended!"</p>
                            <footer class="blockquote-footer text-white">John Doe, CEO</footer>
                        </blockquote>
                    </div>
                    <!-- Review 2 -->
                    <div class="carousel-item">
                        <blockquote class="blockquote text-center">
                            <p>"The event was flawlessly executed. I couldn’t have asked for a better team to handle everything."</p>
                            <footer class="blockquote-footer text-white">Jane Smith, Event Coordinator</footer>
                        </blockquote>
                    </div>
                    <!-- Review 3 -->
                    <div class="carousel-item">
                        <blockquote class="blockquote text-center">
                            <p>"Professional, reliable, and thorough. I trust them for all my cleaning needs!"</p>
                            <footer class="blockquote-footer text-white">Michael Brown, Homeowner</footer>
                        </blockquote>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#reviewsCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#reviewsCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4">Contact Us</h2>
            <form>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <input type="text" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <input type="email" class="form-control" placeholder="Your Email" required>
                    </div>
                    <div class="col-12 mb-3">
                        <textarea class="form-control" placeholder="Your Message" rows="4" required></textarea>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-lg">Send Message</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 Your Company. All Rights Reserved.</p>
    </footer>

</body>
</html>
