<%-- payment.jsp - PAYMENT PAGE --%>
<%-- PURPOSE: User selects payment method and pays --%>
<%-- Form submits to: PaymentServlet --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) { response.sendRedirect("login.jsp"); return; }
    String eventId = request.getParameter("eventId");
    String totalAmount = request.getParameter("totalAmount");
    if (eventId == null) eventId = (String) session.getAttribute("currentEventId");
    if (totalAmount == null) totalAmount = "0";
%>
<%@ include file="HNF/header.jsp" %>
<%@ include file="HNF/navbar.jsp" %>

<main>
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card border-0 shadow p-4">
                    <h3 class="fw-bold text-center mb-3">
                        <i class="fas fa-credit-card text-primary me-2"></i>Payment
                    </h3>

                    <%-- Show amount --%>
                    <div class="text-center bg-light rounded p-3 mb-4">
                        <small class="text-muted">Amount to Pay</small>
                        <h2 class="text-primary fw-bold">₹<%= totalAmount %></h2>
                    </div>

                    <% if (request.getAttribute("errorMsg") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("errorMsg") %>
                    </div>
                    <% } %>

                    <form action="PaymentServlet" method="post">
                        <input type="hidden" name="eventId" value="<%= eventId %>">
                        <input type="hidden" name="amount" value="<%= totalAmount %>">

                        <%-- Payment Method Dropdown --%>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Payment Method *</label>
                            <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                                <option value="" disabled selected>-- Choose Method --</option>
                                <option value="CARD">💳 Credit/Debit Card</option>
                                <option value="UPI">📱 UPI</option>
                                <option value="NETBANKING">🏦 Net Banking</option>
                            </select>
                        </div>

                        <%-- Card Details (shown only when CARD selected) --%>
                        <div id="cardDetails" style="display: none;" class="bg-light rounded p-3 mb-3">
                            <h6 class="fw-bold mb-3">Card Details</h6>
                            <div class="mb-2">
                                <label class="form-label">Card Number</label>
                                <input type="text" class="form-control" placeholder="1234 5678 9012 3456" maxlength="19">
                            </div>
                            <div class="row g-2">
                                <div class="col-6">
                                    <label class="form-label">Expiry</label>
                                    <input type="text" class="form-control" placeholder="MM/YY">
                                </div>
                                <div class="col-6">
                                    <label class="form-label">CVV</label>
                                    <input type="password" class="form-control" placeholder="***" maxlength="3">
                                </div>
                            </div>
                        </div>

                        <%-- UPI Details --%>
                        <div id="upiDetails" style="display: none;" class="bg-light rounded p-3 mb-3">
                            <label class="form-label fw-bold">UPI ID</label>
                            <input type="text" class="form-control" placeholder="yourname@upi">
                        </div>

                        <%-- Net Banking --%>
                        <div id="netbankingDetails" style="display: none;" class="bg-light rounded p-3 mb-3">
                            <label class="form-label fw-bold">Select Bank</label>
                            <select class="form-select">
                                <option>State Bank of India</option>
                                <option>HDFC Bank</option>
                                <option>ICICI Bank</option>
                                <option>Axis Bank</option>
                            </select>
                        </div>

                        <p class="text-center text-muted small">
                            <i class="fas fa-shield-alt text-success me-1"></i>
                            Secured with 256-bit encryption
                        </p>

                        <button type="submit" class="btn btn-success w-100 py-2 btn-lg"
                                onclick="return confirm('Confirm payment of ₹<%= totalAmount %>?')">
                            <i class="fas fa-lock me-2"></i>Pay ₹<%= totalAmount %>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%-- Show/hide payment details based on selection --%>
<script>
document.getElementById('paymentMethod').addEventListener('change', function() {
    document.getElementById('cardDetails').style.display = 'none';
    document.getElementById('upiDetails').style.display = 'none';
    document.getElementById('netbankingDetails').style.display = 'none';

    if (this.value === 'CARD') document.getElementById('cardDetails').style.display = 'block';
    if (this.value === 'UPI') document.getElementById('upiDetails').style.display = 'block';
    if (this.value === 'NETBANKING') document.getElementById('netbankingDetails').style.display = 'block';
});
</script>

<%@ include file="HNF/footer.jsp" %>