<%-- includes/footer.jsp --%>
<%-- PURPOSE: Common footer shown on ALL pages --%>
<%-- Also includes Bootstrap JS (needed for navbar toggle, modals etc) --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="bg-dark text-light py-5 mt-5">
    <div class="container">
        <div class="row">
            <!-- About -->
            <div class="col-md-4 mb-3">
                <h5><i class="fas fa-calendar-star me-2"></i>Eventify</h5>
                <p class="text-muted">
                    Your trusted partner for planning memorable events.
                    From weddings to corporate gatherings.
                </p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-4 mb-3">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp" class="text-muted text-decoration-none">Home</a></li>
                    <li><a href="login.jsp" class="text-muted text-decoration-none">Login</a></li>
                    <li><a href="register.jsp" class="text-muted text-decoration-none">Register</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="col-md-4 mb-3">
                <h5>Contact Us</h5>
                <ul class="list-unstyled text-muted">
                    <li><i class="fas fa-envelope me-2"></i>info@smartevent.com</li>
                    <li><i class="fas fa-phone me-2"></i>+91 123 456 7890</li>
                    <li><i class="fas fa-map-marker-alt me-2"></i>Mumbai, India</li>
                </ul>
            </div>
        </div>

        <hr class="border-secondary">
        <p class="text-center text-muted mb-0">
            &copy; 2025 Smart Event Management Platform. All Rights Reserved.
        </p>
    </div>
</footer>

<!-- Bootstrap JS (required for dropdown, modal, collapse) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JS (created by Student 3) -->
<script src="js/script.js"></script>

</body>
</html>