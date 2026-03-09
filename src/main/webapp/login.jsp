<%-- login.jsp - LOGIN PAGE --%>
<%-- PURPOSE: Form for existing users to sign in --%>
<%-- Form submits to: LoginServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <div class="card border-0 shadow p-4">
                        <div class="text-center mb-3">
                            <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center"
                                 style="width: 60px; height: 60px;">
                                <i class="fas fa-sign-in-alt fa-xl text-primary"></i>
                            </div>
                        </div>

                        <h3 class="text-center fw-bold">Welcome Back</h3>
                        <p class="text-center text-muted mb-4">Sign in to your account</p>

                        <%-- Show registration success message --%>
                        <% if ("true".equals(request.getParameter("registered"))) { %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fas fa-check-circle me-2"></i>
                            Registration successful! Please login.
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <% } %>

                        <%-- Show error message --%>
                        <% if (request.getAttribute("errorMsg") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            <%= request.getAttribute("errorMsg") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <% } %>

                        <%-- LOGIN FORM --%>
                        <form action="Login" method="post">

                            <div class="mb-3">
                                <label for="email" class="form-label fw-semibold">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="Enter your email" required>
                            </div>

                            <div class="mb-4">
                                <label for="password" class="form-label fw-semibold">Password</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Enter your password" required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-2">
                                <i class="fas fa-sign-in-alt me-2"></i>Sign In
                            </button>
                        </form>

                        <%-- Demo credentials for testing --%>
                        <div class="alert alert-warning mt-3 small">
                            <strong>Demo Admin:</strong> admin@smartevent.com / admin123
                        </div>

                        <p class="text-center mt-3 text-muted">
                            Don't have an account?
                            <a href="register.jsp" class="text-primary fw-bold">Register here</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<%@ include file="HNF/footer.jsp" %>