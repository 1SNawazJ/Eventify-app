<%-- my-events.jsp - MY EVENTS LIST --%>
<%-- PURPOSE: Shows table of all user's events --%>
<%-- Data comes from: MyEventsServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eventify.model.Event" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold mb-0">
                    <i class="fas fa-calendar-check text-primary me-2"></i>My Events
                </h3>
                <p class="text-muted mb-0">All your planned events</p>
            </div>
            <a href="create-event.jsp" class="btn btn-primary">
                <i class="fas fa-plus-circle me-1"></i> New Event
            </a>
        </div>

        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>#</th>
                                <th>Event Type</th>
                                <th>Date</th>
                                <th>Venue</th>
                                <th>Guests</th>
                                <th>Status</th>
                                <th>Payment</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Event> events = (List<Event>) request.getAttribute("events");
                                if (events != null && !events.isEmpty()) {
                                    int count = 1;
                                    for (Event e : events) {
                            %>
                            <tr>
                                <td><%= count++ %></td>
                                <td>
                                    <strong><%= e.getEventType() %></strong>
                                </td>
                                <td><%= e.getEventDate() %></td>
                                <td><%= e.getVenue() %></td>
                                <td><%= e.getGuestCount() %></td>
                                <td>
                                    <%-- Color-coded status badges --%>
                                    <% String status = e.getPaymentStatus();
                                       String badgeColor = "warning";
                                       if ("CONFIRMED".equals(status)) badgeColor = "success";
                                       else if ("CANCELLED".equals(status)) badgeColor = "danger";
                                       else if ("COMPLETED".equals(status)) badgeColor = "info";
                                    %>
                                    <span class="badge bg-<%= badgeColor %>"><%= status %></span>
                                </td>
                                <td>
                                    <% String pStatus = e.getPaymentStatus();
                                       if (pStatus == null) pStatus = "PENDING"; %>
                                    <span class="badge bg-<%= "COMPLETED".equals(pStatus) ? "success" : "warning" %>">
                                        <%= "COMPLETED".equals(pStatus) ? "Paid" : "Pending" %>
                                    </span>
                                </td>
                                <td>
                                    <% if ("PENDING".equals(status)) { %>
                                    <a href="EventServlet?action=cancel&eventId=<%= e.getEventId() %>"
                                       class="btn btn-outline-danger btn-sm"
                                       onclick="return confirm('Cancel this event?')">
                                        <i class="fas fa-times"></i> Cancel
                                    </a>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="8" class="text-center py-5">
                                    <i class="fas fa-calendar-times fa-3x text-muted mb-3 d-block"></i>
                                    <h5 class="text-muted">No events yet</h5>
                                    <a href="create-event.jsp" class="btn btn-primary mt-2">Create First Event</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="HNF/footer.jsp" %>