<%-- create-event.jsp - CREATE NEW EVENT FORM --%>
<%-- PURPOSE: User fills event details --%>
<%-- Form submits to: EventServlet (action=create) --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card border-0 shadow p-4">
                    <h3 class="fw-bold text-center mb-4">
                        <i class="fas fa-calendar-plus text-primary me-2"></i>Create New Event
                    </h3>

                    <% if (request.getAttribute("errorMsg") != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("errorMsg") %>
                    </div>
                    <% } %>

                    <form action="EventServlet" method="post">
                        <input type="hidden" name="action" value="create">

                        <!-- Event Type Dropdown -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Event Type *</label>
                            <select class="form-select" name="eventType" required>
                                <option value="" disabled selected>-- Select Event Type --</option>
                                <option value="MARRIAGE">💒 Marriage / Wedding</option>
                                <option value="BIRTHDAY">🎂 Birthday Party</option>
                                <option value="ANNIVERSARY">🥂 Anniversary</option>
                                <option value="CORPORATE">💼 Corporate Event</option>
                            </select>
                        </div>

                        <!-- Event Date -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Event Date *</label>
                            <input type="date" class="form-control" name="eventDate" id="eventDate" required>
                        </div>

                        <!-- Venue -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Venue *</label>
                            <input type="text" class="form-control" name="venue"
                                   placeholder="e.g., Grand Ballroom, Hotel Taj" required>
                        </div>

                        <!-- Guest Count -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Guest Count *</label>
                            <input type="number" class="form-control" name="guestCount"
                                   placeholder="Number of guests" required min="1" max="10000">
                        </div>

                        <!-- Info box -->
                        <div class="alert alert-info small">
                            <i class="fas fa-info-circle me-1"></i>
                            After creating, you'll select vendors (catering, DJ, etc.)
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary flex-grow-1 py-2">
                                <i class="fas fa-arrow-right me-2"></i>Continue & Select Vendors
                            </button>
                            <a href="DashboardServlet" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Set minimum date to today -->
<script>
    document.getElementById('eventDate').min = new Date().toISOString().split('T')[0];
</script>

<%@ include file="HNF/footer.jsp" %>