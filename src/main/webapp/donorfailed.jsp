<%
    String reason = request.getParameter("reason");

    if (reason == null || reason.trim().isEmpty()) {
        reason = "We could not complete the donor registration.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #fff5f5, #ffe1e1);
        }

        .error-card {
            width: 90%;
            max-width: 520px;
            background: white;
            padding: 45px 35px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .error-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 25px;
            border-radius: 50%;
            background: #d32f2f;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 38px;
        }

        h1 {
            color: #b71c1c;
            margin-bottom: 15px;
        }

        .reason {
            background: #fff4f4;
            border-left: 5px solid #d32f2f;
            padding: 15px;
            text-align: left;
            color: #555;
            margin: 25px 0;
            border-radius: 5px;
        }

        .reason strong {
            color: #b71c1c;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            background: #d32f2f;
            color: white;
            padding: 13px 25px;
            border-radius: 8px;
            font-weight: bold;
        }

        .btn-secondary {
            background: #eeeeee;
            color: #333;
            margin-left: 10px;
        }
    </style>
</head>

<body>

<div class="error-card">

    <div class="error-icon">
        <i class="fa-solid fa-triangle-exclamation"></i>
    </div>

    <h1>Registration Not Completed</h1>

    <p>
        We could not process your donor registration.
    </p>

    <div class="reason">
        <strong>Reason</strong><br><br>
        <%= reason %>
    </div>

    <a href="donor.jsp" class="btn">
        <i class="fa-solid fa-rotate-right"></i>
        Try Again
    </a>

    <a href="dashboard.jsp" class="btn btn-secondary">
        <i class="fa-solid fa-house"></i>
        Dashboard
    </a>

</div>

</body>
</html>