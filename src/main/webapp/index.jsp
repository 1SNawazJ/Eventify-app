<%-- index.jsp - HOME PAGE --%>
<%-- PURPOSE: Landing page that visitors see first --%>
<%-- Shows event types and encourages users to register --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <!-- HERO SECTION - Big banner at top -->
    <section class="bg-primary text-white py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <span class="badge bg-light text-primary mb-3 px-3 py-2">
                        <i class="fas fa-star me-1"></i> #1 Event Platform
                    </span>
                    <h1 class="display-4 fw-bold">Plan Your Dream Event</h1>
                    <p class="lead mt-3">
                        From elegant weddings to corporate conferences, we bring
                        your vision to life. Choose top vendors and create memories.
                    </p>
                    <div class="mt-4">
                        <a href="register.jsp" class="btn btn-light btn-lg me-2">
                            <i class="fas fa-rocket me-2"></i>Get Started
                        </a>
                        <a href="#event-types" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-arrow-down me-2"></i>Explore
                        </a>
                    </div>

                    <!-- Stats -->
                    <div class="row mt-5">
                        <div class="col-3 text-center">
                            <h3 class="fw-bold">2500+</h3>
                            <small>Events</small>
                        </div>
                        <div class="col-3 text-center">
                            <h3 class="fw-bold">150+</h3>
                            <small>Vendors</small>
                        </div>
                        <div class="col-3 text-center">
                            <h3 class="fw-bold">98%</h3>
                            <small>Happy Clients</small>
                        </div>
                        <div class="col-3 text-center">
                            <h3 class="fw-bold">50+</h3>
                            <small>Cities</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 text-center d-none d-lg-block">
                    <i class="fas fa-champagne-glasses" style="font-size: 12rem; opacity: 0.2;"></i>
                </div>
            </div>
        </div>
    </section>

    <!-- EVENT TYPES SECTION -->
    <section id="event-types" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center fw-bold mb-2">Our Event Services</h2>
            <p class="text-center text-muted mb-5">Choose from our wide range of events</p>

            <div class="row g-4">
                <!-- Marriage Card -->
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4">
                        <div class="card-body">
                            <div class="bg-danger bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                 style="width: 70px; height: 70px;">
                                <i class="fas fa-heart fa-2x text-danger"></i>
                            </div>
                            <h5 class="fw-bold">Marriage</h5>
                            <p class="text-muted small">Create the wedding of your dreams</p>
                            <p class="text-primary fw-bold">From ₹50,000</p>
                            <a href="login.jsp" class="btn btn-outline-primary btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>

                <!-- Birthday Card -->
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4">
                        <div class="card-body">
                            <div class="bg-warning bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                 style="width: 70px; height: 70px;">
                                <i class="fas fa-birthday-cake fa-2x text-warning"></i>
                            </div>
                            <h5 class="fw-bold">Birthday</h5>
                            <p class="text-muted small">Make every birthday special</p>
                            <p class="text-primary fw-bold">From ₹15,000</p>
                            <a href="login.jsp" class="btn btn-outline-primary btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>

                <!-- Anniversary Card -->
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4">
                        <div class="card-body">
                            <div class="bg-info bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                 style="width: 70px; height: 70px;">
                                <i class="fas fa-glass-cheers fa-2x text-info"></i>
                            </div>
                            <h5 class="fw-bold">Anniversary</h5>
                            <p class="text-muted small">Celebrate your milestones</p>
                            <p class="text-primary fw-bold">From ₹25,000</p>
                            <a href="login.jsp" class="btn btn-outline-primary btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>

                <!-- Corporate Card -->
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4">
                        <div class="card-body">
                            <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                 style="width: 70px; height: 70px;">
                                <i class="fas fa-briefcase fa-2x text-primary"></i>
                            </div>
                            <h5 class="fw-bold">Corporate</h5>
                            <p class="text-muted small">Professional event management</p>
                            <p class="text-primary fw-bold">From ₹75,000</p>
                            <a href="login.jsp" class="btn btn-outline-primary btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-5 bg-primary text-white text-center">
        <div class="container">
            <h2 class="fw-bold mb-3">Ready to Plan Your Event?</h2>
            <p class="mb-4">Join thousands of happy customers</p>
            <a href="register.jsp" class="btn btn-light btn-lg">
                <i class="fas fa-rocket me-2"></i>Get Started Free
            </a>
        </div>
    </section>
</main>

<%@ include file="HNF/footer.jsp" %>