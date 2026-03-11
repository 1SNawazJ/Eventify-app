<%-- dashboard.jsp - CUSTOMER DASHBOARD --%>
<%-- PURPOSE: Shows welcome message and quick stats after login --%>
<%-- Data comes from: DashboardServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // SECURITY CHECK: redirect to login if not logged in
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
    if ("ADMIN".equals(role)) { response.sendRedirect("AdminDashboardServlet"); return; }
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <!-- Welcome Banner -->
    <div class="container mt-4">
        <div class="bg-primary text-white rounded-3 p-4 mb-4">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h2 class="fw-bold">
                        <i class="fas fa-hand-sparkles me-2"></i>
                        Welcome, <%= session.getAttribute("userName") %>!
                    </h2>
                    <p class="mb-3">Manage your events, vendors, and payments here.</p>
                    <a href="create-event.jsp" class="btn btn-light me-2">
                        <i class="fas fa-plus-circle me-1"></i> Create Event
                    </a>
                    <a href="MyEventsServlet" class="btn btn-outline-light">
                        <i class="fas fa-calendar me-1"></i> My Events
                    </a>
                </div>
                <div class="col-md-4 text-center d-none d-md-block">
                    <i class="fas fa-calendar-check" style="font-size: 5rem; opacity: 0.3;"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="container mb-4">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm bg-primary text-white">
                    <div class="card-body p-4">
                        <i class="fas fa-calendar-alt fa-2x mb-2 opacity-75"></i>
                        <h2 class="fw-bold">
                            <%= request.getAttribute("totalEvents") != null ? request.getAttribute("totalEvents") : "0" %>
                        </h2>
                        <p class="mb-0">Total Events</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm bg-success text-white">
                    <div class="card-body p-4">
                        <i class="fas fa-clock fa-2x mb-2 opacity-75"></i>
                        <h2 class="fw-bold">
                            <%= request.getAttribute("upcomingEvents") != null ? request.getAttribute("upcomingEvents") : "0" %>
                        </h2>
                        <p class="mb-0">Upcoming Events</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm bg-warning text-dark">
                    <div class="card-body p-4">
                        <i class="fas fa-indian-rupee-sign fa-2x mb-2 opacity-75"></i>
                        <h2 class="fw-bold">
                            ₹<%= request.getAttribute("totalSpent") != null ? request.getAttribute("totalSpent") : "0" %>
                        </h2>
                        <p class="mb-0">Total Spent</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Action Cards -->
    <div class="container mb-5">
        <h4 class="fw-bold mb-3">Quick Actions</h4>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card border-0 shadow-sm text-center p-3 h-100">
                    <div class="card-body">
                        <i class="fas fa-plus fa-2x text-primary mb-3"></i>
                        <h6 class="fw-bold">Create Event</h6>
                        <a href="create-event.jsp" class="btn btn-outline-primary btn-sm mt-2">Start</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow-sm text-center p-3 h-100">
                    <div class="card-body">
                        <i class="fas fa-store fa-2x text-success mb-3"></i>
                        <h6 class="fw-bold">Browse Vendors</h6>
                        <a href="VendorServlet?action=list" class="btn btn-outline-success btn-sm mt-2">View</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow-sm text-center p-3 h-100">
                    <div class="card-body">
                        <i class="fas fa-calendar-check fa-2x text-info mb-3"></i>
                        <h6 class="fw-bold">My Events</h6>
                        <a href="MyEventsServlet" class="btn btn-outline-info btn-sm mt-2">View</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow-sm text-center p-3 h-100">
                    <div class="card-body">
                        <i class="fas fa-credit-card fa-2x text-warning mb-3"></i>
                        <h6 class="fw-bold">Payments</h6>
                        <a href="MyEventsServlet" class="btn btn-outline-warning btn-sm mt-2">View</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="HNF/footer.jsp" %>