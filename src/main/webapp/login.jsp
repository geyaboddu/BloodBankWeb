<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Blood Bank Login</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;

            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            background:
                linear-gradient(
                    135deg,
                    #8b0000,
                    #d40000,
                    #ff5c5c
                );
        }

        /* Login Card */

        .login-card {
            width: 420px;

            background: white;

            padding: 45px 40px;

            border-radius: 20px;

            text-align: center;

            box-shadow:
                0 15px 40px rgba(0, 0, 0, 0.30);
        }


        /* Blood Icon */

        .blood-icon {
            font-size: 70px;

            margin-bottom: 5px;

            line-height: 1;
        }


        /* Heading */

        .login-card h1 {
            margin: 10px 0 5px;

            color: #b00000;

            font-size: 32px;
        }

        .subtitle {
            color: #777;

            font-size: 15px;

            margin-bottom: 30px;
        }


        /* Input */

        .input-box {
            text-align: left;

            margin-bottom: 20px;
        }

        .input-box label {
            display: block;

            font-size: 15px;

            font-weight: bold;

            color: #444;

            margin-bottom: 8px;
        }

        .input-box input {
            width: 100%;

            padding: 14px;

            border: 1px solid #ccc;

            border-radius: 8px;

            font-size: 16px;

            outline: none;

            transition: 0.3s;
        }

        .input-box input:focus {
            border-color: #d00000;

            box-shadow:
                0 0 6px rgba(208, 0, 0, 0.25);
        }


        /* Login Button */

        .login-button {
            width: 100%;

            padding: 14px;

            margin-top: 5px;

            border: none;

            border-radius: 8px;

            background: #c40000;

            color: white;

            font-size: 17px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;
        }

        .login-button:hover {
            background: #8f0000;

            transform: translateY(-2px);
        }


        /* Footer */

        .footer {
            margin-top: 25px;

            font-size: 13px;

            color: #888;
        }


        /* Mobile */

        @media (max-width: 500px) {

            .login-card {
                width: 90%;

                padding: 35px 25px;
            }

            .login-card h1 {
                font-size: 27px;
            }

        }

    </style>

</head>


<body>

    <div class="login-card">

        <!-- Blood Icon -->
        <!-- Using HTML code instead of directly typing the emoji -->
        <div class="blood-icon">
            &#128137;
        </div>


        <!-- Title -->

        <h1>Blood Bank</h1>

        <div class="subtitle">
            Management System
        </div>


        <!-- Login Form -->

        <form action="login" method="post">


            <!-- Username -->

            <div class="input-box">

                <label for="username">
                    Username
                </label>

                <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    required
                >

            </div>


            <!-- Password -->

            <div class="input-box">

                <label for="password">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required
                >

            </div>


            <!-- Login Button -->

            <input
                type="submit"
                value="Login"
                class="login-button"
            >


        </form>

<div class="register-link">
    Don't have an account?
    <a href="userregister.jsp">Create Account</a>
</div>
        <div class="footer">
            Secure Blood Bank Management System
        </div>


    </div>

</body>
</html>