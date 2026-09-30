<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Request Not Submitted</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #fff5f5, #ffdede);
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

        .error-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 20px;
            border-radius: 50%;
            border: 4px solid #dc2626;
            color: #dc2626;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 45px;
            font-weight: bold;
        }

        h1 {
            color: #b91c1c;
            margin-bottom: 12px;
        }

        .message {
            color: #666;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .reason-box {
            text-align: left;
            background: #fff5f5;
            border-left: 5px solid #dc2626;
            padding: 18px;
            border-radius: 10px;
            margin-bottom: 28px;
        }

        .reason-title {
            color: #b91c1c;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .reason {
            color: #444;
            line-height: 1.6;
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
            background: #f1f1f1;
            color: #333;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

    </style>

</head>

<body>

<%
    String error =
        (String) session.getAttribute("requestError");

    if (error == null || error.trim().isEmpty()) {
        error = "The request could not be submitted. Please try again.";
    }

    session.removeAttribute("requestError");
%>

<div class="card">

    <div class="error-icon">!</div>

    <h1>Request Not Submitted</h1>

    <p class="message">
        We could not process your blood request.
        Please check the reason below.
    </p>

    <div class="reason-box">

        <div class="reason-title">
            ⚠️ Reason
        </div>

        <div class="reason">
            <%= error %>
        </div>

    </div>

    <div class="buttons">

        <a href="requestblood.jsp" class="btn primary">
            🩸 Try Again
        </a>

        <a href="dashboard.jsp" class="btn secondary">
            🏠 Dashboard
        </a>

    </div>

</div>

</body>
</html>