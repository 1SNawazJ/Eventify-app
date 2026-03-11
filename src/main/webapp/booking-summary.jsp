<%-- booking-summary.jsp - BOOKING SUMMARY --%>
<%-- PURPOSE: Shows event details + selected vendors + total price --%>
<%-- Data comes from: BookingServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eventify.model.Event" %>
<%@ page import="com.eventify.model.Vendor" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <div class="container py-4">
        <h3 class="fw-bold mb-4">
            <i class="fas fa-file-invoice text-primary me-2"></i>Booking Summary
        </h3>

        <div class="row g-4">
            <!-- Left: Details -->
            <div class="col-lg-8">
                <!-- Event Details Card -->
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-body">
                        <h5 class="fw-bold border-bottom pb-2 mb-3">
                            <i class="fas fa-calendar-alt text-primary me-2"></i>Event Details
                        </h5>

                        <%
                            Event event = (Event) request.getAttribute("event");
                            if (event != null) {
                        %>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="bg-light rounded p-3">
                                    <small class="text-muted">Event Type</small>
                                    <div class="fw-bold"><%= event.getEventType() %></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-light rounded p-3">
                                    <small class="text-muted">Date</small>
                                    <div class="fw-bold"><%= event.getEventDate() %></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-light rounded p-3">
                                    <small class="text-muted">Venue</small>
                                    <div class="fw-bold"><%= event.getVenue() %></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-light rounded p-3">
                                    <small class="text-muted">Guests</small>
                                    <div class="fw-bold"><%= event.getGuestCount() %> people</div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

                <!-- Selected Vendors Table -->
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold border-bottom pb-2 mb-3">
                            <i class="fas fa-store text-primary me-2"></i>Selected Vendors
                        </h5>

                        <%
                            List<Vendor> selectedVendors = (List<Vendor>) request.getAttribute("selectedVendors");
                            double totalPrice = 0;
                            if (selectedVendors != null && !selectedVendors.isEmpty()) {
                        %>
                        <table class="table">
                            <thead class="table-primary">
                                <tr>
                                    <th>#</th><th>Vendor</th><th>Category</th><th>Rating</th><th class="text-end">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% int count = 1;
                                   for (Vendor v : selectedVendors) {
                                       totalPrice += v.getPrice(); %>
                                <tr>
                                    <td><%= count++ %></td>
                                    <td class="fw-bold"><%= v.getVendorName() %></td>
                                    <td><span class="badge bg-info text-dark"><%= v.getCategory() %></span></td>
                                    <td><i class="fas fa-star text-warning"></i> <%= v.getRating() %></td>
                                    <td class="text-end fw-bold">₹<%= String.format("%,.0f", v.getPrice()) %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <% } else { %>
                        <p class="text-muted text-center py-3">No vendors selected</p>
                        <% } %>
                    </div>
                </div>
            </div>

            <!-- Right: Price Summary -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold border-bottom pb-2 mb-3">
                            <i class="fas fa-receipt text-primary me-2"></i>Price
                        </h5>

                        <%-- List each vendor price --%>
                        <% if (selectedVendors != null) {
                               for (Vendor v : selectedVendors) { %>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted"><%= v.getCategory() %></span>
                            <span>₹<%= String.format("%,.0f", v.getPrice()) %></span>
                        </div>
                        <%     }
                           } %>

                        <hr>
                        <div class="d-flex justify-content-between mb-1">
                            <span>Subtotal</span>
                            <span class="fw-bold">₹<%= String.format("%,.0f", totalPrice) %></span>
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <span class="text-muted">GST (18%)</span>
                            <span>₹<%= String.format("%,.0f", totalPrice * 0.18) %></span>
                        </div>
                        <hr>

                        <% double grandTotal = totalPrice + (totalPrice * 0.18); %>
                        <div class="text-center bg-light rounded p-3 mb-3">
                            <small class="text-muted">Total Amount</small>
                            <h2 class="text-primary fw-bold mb-0">₹<%= String.format("%,.0f", grandTotal) %></h2>
                        </div>

                        <%-- Link to payment page with amount --%>
                        <a href="payment.jsp?eventId=<%= event != null ? event.getEventId() : "" %>&totalAmount=<%= String.format("%.0f", grandTotal) %>"
                           class="btn btn-success w-100 py-2">
                            <i class="fas fa-credit-card me-2"></i>Proceed to Payment
                        </a>
                        <a href="VendorServlet?action=list" class="btn btn-outline-secondary w-100 mt-2">
                            <i class="fas fa-arrow-left me-1"></i> Change Vendors
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="HNF/footer.jsp" %>