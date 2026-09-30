<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Request Submitted</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #fff5f5, #ffe1e1);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            width: 100%;
            max-width: 600px;
            background: white;
            border-radius: 22px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(120, 0, 0, 0.18);
        }

        .success-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #e8f8ee;
            color: #22a447;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 45px;
            font-weight: bold;
        }

        h1 {
            color: #b91c1c;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #666;
            margin-bottom: 28px;
        }

        .details {
            text-align: left;
            background: #fff7f7;
            border-radius: 15px;
            padding: 22px;
            margin-bottom: 28px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .row:last-child {
            border-bottom: none;
        }

        .label {
            color: #777;
            font-weight: bold;
        }

        .value {
            color: #222;
            font-weight: bold;
            text-align: right;
        }

        .status {
            color: #d97706;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            text-decoration: none;
            padding: 13px 22px;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.2s;
        }

        .primary {
            background: #c62828;
            color: white;
        }

        .secondary {
            background: #f3f3f3;
            color: #333;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

    </style>

</head>

<body>

<%
    String patient =
        (String) session.getAttribute("requestPatient");

    String hospital =
        (String) session.getAttribute("requestHospital");

    String bloodGroup =
        (String) session.getAttribute("requestBloodGroup");

    Integer quantity =
        (Integer) session.getAttribute("requestQuantity");

    String phone =
        (String) session.getAttribute("requestPhone");

    String status =
        (String) session.getAttribute("requestStatus");
%>

<div class="card">

    <div class="success-icon">✓</div>

    <h1>Request Submitted Successfully</h1>

    <p class="subtitle">
        Your blood request has been successfully recorded.
    </p>

    <div class="details">

        <div class="row">
            <span class="label">👤 Patient</span>
            <span class="value"><%= patient %></span>
        </div>

        <div class="row">
            <span class="label">🏥 Hospital</span>
            <span class="value"><%= hospital %></span>
        </div>

        <div class="row">
            <span class="label">🩸 Blood Group</span>
            <span class="value"><%= bloodGroup %></span>
        </div>

        <div class="row">
            <span class="label">💉 Required Units</span>
            <span class="value"><%= quantity %></span>
        </div>

        <div class="row">
            <span class="label">📞 Phone</span>
            <span class="value"><%= phone %></span>
        </div>

        <div class="row">
            <span class="label">📋 Status</span>
            <span class="value status">
                <%= status %>
            </span>
        </div>

    </div>

    <div class="buttons">

        <a href="requestblood.jsp" class="btn primary">
            🩸 New Request
        </a>

        <a href="dashboard.jsp" class="btn secondary">
            🏠 Dashboard
        </a>

    </div>

</div>

</body>
</html>