<%-- includes/navbar.jsp --%>
<%-- PURPOSE: Navigation bar shown on ALL pages --%>
<%-- Shows different links based on login status and role --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Read session data to check if user is logged in
    String loggedInUser = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("role");
    boolean isLoggedIn = (loggedInUser != null);
    boolean isAdmin = "ADMIN".equals(userRole);
%>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <!-- Brand/Logo -->
        <a class="navbar-brand fw-bold text-primary" href="index.jsp">
            <i class="fas fa-calendar-star me-2"></i>SmartEvent
        </a>

        <!-- Mobile menu button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Left side links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-home me-1"></i> Home
                    </a>
                </li>

                <%-- Show these only for logged-in CUSTOMERS --%>
                <% if (isLoggedIn && !isAdmin) { %>
                <li class="nav-item">
                    <a class="nav-link" href="DashboardServlet">
                        <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="create-event.jsp">
                        <i class="fas fa-plus-circle me-1"></i> Create Event
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="MyEventsServlet">
                        <i class="fas fa-calendar-check me-1"></i> My Events
                    </a>
                </li>
                <% } %>

                <%-- Show these only for ADMIN --%>
                <% if (isAdmin) { %>
                <li class="nav-item">
                    <a class="nav-link" href="AdminDashboardServlet">
                        <i class="fas fa-shield-alt me-1"></i> Admin Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AdminVendorServlet?action=list">
                        <i class="fas fa-store me-1"></i> Manage Vendors
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AdminEventServlet?action=list">
                        <i class="fas fa-calendar-alt me-1"></i> Manage Events
                    </a>
                </li>
                <% } %>
            </ul>

            <!-- Right side links -->
            <ul class="navbar-nav">
                <% if (isLoggedIn) { %>
                <li class="nav-item d-flex align-items-center me-3">
                    <span class="navbar-text">
                        <i class="fas fa-user-circle me-1"></i>
                        <strong><%= loggedInUser %></strong>
                        <% if (isAdmin) { %>
                        <span class="badge bg-danger ms-1">ADMIN</span>
                        <% } %>
                    </span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-danger btn-sm" href="Logout">
                        <i class="fas fa-sign-out-alt me-1"></i> Logout
                    </a>
                </li>
                <% } else { %>
                <li class="nav-item me-2">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-primary btn-sm" href="register.jsp">
                        <i class="fas fa-user-plus me-1"></i> Register
                    </a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>