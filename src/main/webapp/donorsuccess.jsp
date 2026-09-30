<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Donor Registration Successful</title>

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
            background: linear-gradient(135deg, #fff1f1, #ffe0e0);
        }

        .success-card {
            width: 90%;
            max-width: 520px;
            background: white;
            padding: 45px 35px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .success-icon {
            width: 90px;
            height: 90px;
            margin: 0 auto 25px;
            border-radius: 50%;
            background: #e63946;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 42px;
        }

        h1 {
            color: #b71c1c;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
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
            border-radius: 8px;
            font-weight: bold;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: #d32f2f;
            color: white;
        }

        .btn-secondary {
            background: #f1f1f1;
            color: #333;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<div class="success-card">

    <div class="success-icon">
        <i class="fa-solid fa-check"></i>
    </div>

    <h1>Donor Registered Successfully!</h1>

    <p>
        Thank you for registering as a blood donor.
        Your information has been successfully saved.
        Your contribution can help save lives.
    </p>

    <div class="buttons">

        <a href="donor.jsp" class="btn btn-primary">
            <i class="fa-solid fa-droplet"></i>
            Register Another Donor
        </a>

        <a href="dashboard.jsp" class="btn btn-secondary">
            <i class="fa-solid fa-house"></i>
            Dashboard
        </a>

    </div>

</div>

</body>
</html>