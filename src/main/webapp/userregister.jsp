<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account | Blood Bank</title>

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

        .container {
            width: 450px;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        }

        .logo {
            text-align: center;
            color: #c62828;
            font-size: 45px;
        }

        h1 {
            text-align: center;
            color: #b71c1c;
            margin: 10px 0 5px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
        }

        .input-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #444;
        }

        label i {
            color: #c62828;
            margin-right: 7px;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 9px;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #d32f2f;
            box-shadow: 0 0 5px rgba(211,47,47,.25);
        }

        button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 9px;
            background: #d32f2f;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #b71c1c;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #c62828;
            text-decoration: none;
            font-weight: bold;
        }

        .error {
            background: #ffebee;
            color: #c62828;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 18px;
        }

        .success {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 18px;
        }

        .footer {
            text-align: center;
            color: #999;
            font-size: 12px;
            margin-top: 25px;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="logo">
        <i class="fa-solid fa-droplet"></i>
    </div>

    <h1>Create Account</h1>

    <div class="subtitle">
        Join the Blood Bank Management System
    </div>

    <% String error = request.getParameter("error"); %>

    <% if (error != null) { %>
        <div class="error">
            <i class="fa-solid fa-circle-exclamation"></i>
            <%= error %>
        </div>
    <% } %>

    <form action="userregister" method="post">

        <div class="input-group">
            <label>
                <i class="fa-solid fa-user"></i>
                Full Name
            </label>
            <input type="text"
                   name="full_name"
                   placeholder="Enter your full name"
                   required>
        </div>

        <div class="input-group">
            <label>
                <i class="fa-solid fa-user-tag"></i>
                Username
            </label>
            <input type="text"
                   name="username"
                   placeholder="Choose a username"
                   required>
        </div>

        <div class="input-group">
            <label>
                <i class="fa-solid fa-envelope"></i>
                Email
            </label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>
        </div>

        <div class="input-group">
            <label>
                <i class="fa-solid fa-phone"></i>
                Phone Number
            </label>
            <input type="tel"
                   name="phone"
                   placeholder="Enter phone number"
                   required>
        </div>

        <div class="input-group">
            <label>
                <i class="fa-solid fa-lock"></i>
                Password
            </label>
            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   minlength="6"
                   required>
        </div>

        <div class="input-group">
            <label>
                <i class="fa-solid fa-lock"></i>
                Confirm Password
            </label>
            <input type="password"
                   name="confirm_password"
                   placeholder="Confirm your password"
                   minlength="6"
                   required>
        </div>

        <button type="submit">
            <i class="fa-solid fa-user-plus"></i>
            Create Account
        </button>

    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login here</a>
    </div>

    <div class="footer">
        Secure Blood Bank Management System
    </div>

</div>

</body>
</html>