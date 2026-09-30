 <!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Search Blood | Blood Bank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #8b0000, #d40000, #ff6b6b);
            padding: 40px 20px;
        }

        /* Header */

        .header {
            text-align: center;
            color: white;
            margin-bottom: 25px;
        }

        .blood-icon {
            width: 55px;
            height: 68px;
            background: white;
            margin: 0 auto 12px;
            border-radius: 50% 50% 55% 55%;
            position: relative;
            transform: rotate(45deg);
        }

        .blood-icon::after {
            content: "";
            position: absolute;
            width: 34px;
            height: 34px;
            background: #c40000;
            border-radius: 50%;
            top: 17px;
            left: 10px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            margin-top: 8px;
            font-size: 15px;
            opacity: 0.9;
        }

        /* Main Card */

        .search-card {
            width: 100%;
            max-width: 620px;
            margin: auto;
            background: white;
            border-radius: 22px;
            padding: 38px 42px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.28);
        }

        /* Title */

        .card-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .card-title h2 {
            margin: 0;
            color: #b00000;
            font-size: 27px;
        }

        .card-title p {
            color: #777;
            margin-top: 9px;
            font-size: 14px;
        }

        /* Search Icon */

        .search-icon {
            width: 70px;
            height: 70px;
            margin: 0 auto 18px;
            background: #ffe5e5;
            border-radius: 50%;
            position: relative;
        }

        .search-icon::before {
            content: "";
            position: absolute;
            width: 25px;
            height: 25px;
            border: 5px solid #c40000;
            border-radius: 50%;
            top: 16px;
            left: 16px;
        }

        .search-icon::after {
            content: "";
            position: absolute;
            width: 22px;
            height: 5px;
            background: #c40000;
            transform: rotate(45deg);
            left: 40px;
            top: 45px;
            border-radius: 5px;
        }

        /* Information Section */

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #b00000;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 18px;
            padding-bottom: 9px;
            border-bottom: 2px solid #f0d0d0;
        }

        .small-blood-icon {
            width: 30px;
            height: 30px;
            background: #ffe5e5;
            border-radius: 50%;
            position: relative;
        }

        .small-blood-icon::after {
            content: "";
            width: 13px;
            height: 17px;
            background: #c40000;
            position: absolute;
            top: 6px;
            left: 8px;
            border-radius: 50% 50% 55% 55%;
            transform: rotate(45deg);
        }

        /* Input */

        .input-group {
            margin-bottom: 22px;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            color: #444;
            margin-bottom: 9px;
            font-size: 14px;
        }

        .input-group select {
            width: 100%;
            padding: 14px;
            border: 1px solid #d5d5d5;
            border-radius: 10px;
            font-size: 16px;
            outline: none;
            background: white;
            cursor: pointer;
            border-left: 5px solid #c40000;
        }

        .input-group select:focus {
            border-color: #c40000;
            box-shadow: 0 0 7px rgba(196, 0, 0, 0.18);
        }

        /* Search Button */

        .search-button {
            width: 100%;
            padding: 15px;
            margin-top: 5px;
            border: none;
            border-radius: 10px;
            background: #c40000;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .search-button:hover {
            background: #8f0000;
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(143, 0, 0, 0.25);
        }

        /* Back */

        .back-area {
            text-align: center;
            margin-top: 22px;
        }

        .back-area a {
            text-decoration: none;
            color: #b00000;
            font-weight: bold;
            font-size: 14px;
        }

        .back-area a:hover {
            text-decoration: underline;
        }

        /* Footer */

        .footer {
            text-align: center;
            margin-top: 25px;
            color: #888;
            font-size: 12px;
        }

        /* Mobile */

        @media (max-width: 600px) {

            body {
                padding: 25px 12px;
            }

            .search-card {
                padding: 30px 22px;
            }

            .header h1 {
                font-size: 24px;
            }

        }

    </style>

</head>

<body>


    <!-- Header -->

    <div class="header">

        <div class="blood-icon"></div>

        <h1>Blood Bank Management System</h1>

        <p>Find the blood group you need</p>

    </div>


    <!-- Search Card -->

    <div class="search-card">


        <div class="card-title">

            <div class="search-icon"></div>

            <h2>Search Blood</h2>

            <p>Search for available blood by blood group</p>

        </div>


        <form action="searchblood" method="post">


            <div class="section-title">

                <span class="small-blood-icon"></span>

                Select Blood Group

            </div>


            <div class="input-group">

                <label for="blood_group">
                    Blood Group
                </label>

                <select
                    id="blood_group"
                    name="blood_group"
                    required
                >

                    <option value="">Select Blood Group</option>

                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>

                </select>

            </div>


            <input
                type="submit"
                value="Search Blood"
                class="search-button"
            >

        </form>


        <div class="back-area">

            <a href="dashboard.jsp">
                Back to Dashboard
            </a>

        </div>


        <div class="footer">

            Secure Blood Bank Management System

        </div>


    </div>

</body>
</html>