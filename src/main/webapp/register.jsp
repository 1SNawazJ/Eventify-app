<%-- register.jsp - REGISTRATION PAGE --%>
<%-- PURPOSE: Form for new users to create account --%>
<%-- Form submits to: RegisterServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <div class="card border-0 shadow p-4">
                        <!-- Icon -->
                        <div class="text-center mb-3">
                            <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center"
                                 style="width: 60px; height: 60px;">
                                <i class="fas fa-user-plus fa-xl text-primary"></i>
                            </div>
                        </div>

                        <h3 class="text-center fw-bold">Create Account</h3>
                        <p class="text-center text-muted mb-4">Join SmartEvent today</p>

                        <%-- Show error message if any --%>
                        <% if (request.getAttribute("errorMsg") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            <%= request.getAttribute("errorMsg") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <% } %>

                        <%-- REGISTRATION FORM --%>
                        <form action="Register" method="post" id="registerForm">

                            <div class="mb-3">
                                <label for="fullName" class="form-label fw-semibold">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName"
                                       placeholder="Enter your full name" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label fw-semibold">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="Enter your email" required>
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label fw-semibold">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="phone"
                                       placeholder="10-digit number" required pattern="[0-9]{10}" maxlength="10">
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label fw-semibold">Password</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Min 6 characters" required minlength="6">
                            </div>

                            <div class="mb-4">
                                <label for="confirmPassword" class="form-label fw-semibold">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword"
                                       name="confirmPassword" placeholder="Re-enter password" required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-2">
                                <i class="fas fa-user-plus me-2"></i>Create Account
                            </button>
                        </form>

                        <p class="text-center mt-3 text-muted">
                            Already have an account?
                            <a href="login.jsp" class="text-primary fw-bold">Login here</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<%@ include file="HNF/footer.jsp" %>