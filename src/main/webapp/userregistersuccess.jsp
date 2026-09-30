<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Created | Blood Bank</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #b71c1c, #ff5252);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: white;
            width: 430px;
            padding: 45px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(0,0,0,.25);
        }

        .icon {
            font-size: 65px;
            color: #2e7d32;
            margin-bottom: 15px;
        }

        h1 {
            color: #2e7d32;
        }

        p {
            color: #666;
            line-height: 1.6;
        }

        a {
            display: block;
            margin-top: 25px;
            padding: 14px;
            background: #d32f2f;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-weight: bold;
        }

        a:hover {
            background: #b71c1c;
        }
    </style>
</head>

<body>

<div class="card">

    <div class="icon">
        <i class="fa-solid fa-circle-check"></i>
    </div>

    <h1>Account Created!</h1>

    <p>
        Your Blood Bank account has been created successfully.
        You can now login and access your dashboard.
    </p>

    <a href="login.jsp">
        <i class="fa-solid fa-right-to-bracket"></i>
        Login to Your Account
    </a>

</div>

</body>
</html>