<%-- vendor-list.jsp - SELECT VENDORS PAGE --%>
<%-- PURPOSE: Display vendor cards with checkboxes for selection --%>
<%-- Data comes from: VendorServlet --%>
<%-- Form submits to: BookingServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eventify.model.Vendor" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <div class="container py-4">
        <h3 class="fw-bold mb-1">
            <i class="fas fa-store text-primary me-2"></i>Select Vendors
        </h3>
        <p class="text-muted mb-4">Choose vendors for your event (check the boxes)</p>

        <% if (request.getAttribute("errorMsg") != null) { %>
        <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("errorMsg") %>
        </div>
        <% } %>

        <%-- FORM: wraps all vendor cards so checkboxes submit together --%>
        <form action="BookingServlet" method="post">
            <input type="hidden" name="action" value="selectVendors">
            <input type="hidden" name="eventId" value="<%= session.getAttribute("currentEventId") %>">

            <div class="row g-4">
                <%
                    List<Vendor> vendors = (List<Vendor>) request.getAttribute("vendors");
                    if (vendors != null && !vendors.isEmpty()) {
                        for (Vendor v : vendors) {
                %>
                <div class="col-lg-4 col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <%-- Checkbox in top-right corner --%>
                            <div class="form-check float-end">
                                <input class="form-check-input vendor-checkbox" type="checkbox"
                                       name="vendorIds" value="<%= v.getVendorId() %>"
                                       data-price="<%= v.getPrice() %>"
                                       style="width: 20px; height: 20px;">
                            </div>

                            <%-- Category badge --%>
                            <span class="badge bg-info text-dark mb-2"><%= v.getCategory() %></span>

                            <%-- Vendor name --%>
                            <h5 class="fw-bold"><%= v.getVendorName() %></h5>

                            <%-- Description --%>
                            <p class="text-muted small">
                                <%= v.getDescription() != null ? v.getDescription() : "Professional service" %>
                            </p>

                            <%-- Rating stars --%>
                            <div class="mb-2">
                                <%
                                    for (int i = 1; i <= 5; i++) {
                                        if (i <= v.getRating()) {
                                %>
                                    <i class="fas fa-star text-warning"></i>
                                <%      } else { %>
                                    <i class="far fa-star text-warning"></i>
                                <%      }
                                    }
                                %>
                                <small class="text-muted">(<%= v.getRating() %>)</small>
                            </div>

                            <%-- Price --%>
                            <h4 class="text-primary fw-bold">
                                ₹<%= String.format("%,.0f", v.getPrice()) %>
                            </h4>
                            <small class="text-muted">per event</small>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="col-12 text-center py-5">
                    <i class="fas fa-store-slash fa-3x text-muted mb-3"></i>
                    <p class="text-muted">No vendors available</p>
                </div>
                <% } %>
            </div>

            <%-- Total and Submit --%>
            <% if (vendors != null && !vendors.isEmpty()) { %>
            <div class="card border-0 shadow-sm mt-4">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        Total: <span id="totalPrice" class="text-primary fw-bold">₹0</span>
                    </h4>
                    <button type="submit" class="btn btn-success btn-lg">
                        <i class="fas fa-check-circle me-2"></i>View Summary
                    </button>
                </div>
            </div>
            <% } %>
        </form>
    </div>
</main>

<%-- Script to calculate total when checkboxes change --%>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.vendor-checkbox');
    checkboxes.forEach(function(cb) {
        cb.addEventListener('change', function() {
            var total = 0;
            document.querySelectorAll('.vendor-checkbox:checked').forEach(function(checked) {
                total += parseFloat(checked.getAttribute('data-price'));
            });
            document.getElementById('totalPrice').textContent = '₹' + total.toLocaleString('en-IN');
        });
    });
});
</script>

<%@ include file="HNF/footer.jsp" %>