<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Donor Registration | Blood Bank</title>

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
            width: 58px;
            height: 72px;
            background: white;
            margin: 0 auto 12px;
            border-radius: 50% 50% 55% 55%;
            position: relative;
            transform: rotate(45deg);
        }

        .blood-icon::after {
            content: "";
            position: absolute;
            width: 36px;
            height: 36px;
            background: #c40000;
            border-radius: 50%;
            top: 18px;
            left: 11px;
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

        .registration-card {
            width: 100%;
            max-width: 650px;
            margin: auto;
            background: white;
            border-radius: 22px;
            padding: 35px 40px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.28);
        }

        .card-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .card-title h2 {
            margin: 0;
            color: #b00000;
            font-size: 26px;
        }

        .card-title p {
            color: #777;
            margin-top: 8px;
        }

        /* Section */

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #b00000;
            font-size: 18px;
            font-weight: bold;
            margin: 25px 0 18px;
            padding-bottom: 8px;
            border-bottom: 2px solid #f0d0d0;
        }

        /* CSS Icons */

        .icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #ffe5e5;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .person-icon::before {
            content: "";
            width: 9px;
            height: 9px;
            background: #c40000;
            border-radius: 50%;
            position: absolute;
            top: 6px;
        }

        .person-icon::after {
            content: "";
            width: 17px;
            height: 9px;
            background: #c40000;
            border-radius: 10px 10px 5px 5px;
            position: absolute;
            bottom: 6px;
        }

        .phone-icon::before {
            content: "";
            width: 9px;
            height: 17px;
            border: 3px solid #c40000;
            border-radius: 5px;
        }

        .blood-small::before {
            content: "";
            width: 13px;
            height: 17px;
            background: #c40000;
            border-radius: 50% 50% 55% 55%;
            transform: rotate(45deg);
        }

        /* Form */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            color: #444;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d5d5d5;
            border-radius: 9px;
            font-size: 15px;
            outline: none;
            background: #fff;
            transition: 0.3s;
        }

        .input-group input:focus,
        .input-group select:focus {
            border-color: #c40000;
            box-shadow: 0 0 7px rgba(196, 0, 0, 0.18);
        }

        /* Blood Group */

        .blood-select {
            border-left: 5px solid #c40000 !important;
        }

        /* Register Button */

        .register-button {
            width: 100%;
            padding: 15px;
            margin-top: 12px;
            border: none;
            border-radius: 10px;
            background: #c40000;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .register-button:hover {
            background: #8f0000;
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(143, 0, 0, 0.25);
        }

        /* Back Button */

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

            .registration-card {
                padding: 28px 22px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
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

        <p>Helping save lives through blood donation</p>

    </div>


    <!-- Registration Card -->

    <div class="registration-card">

        <div class="card-title">

            <h2>Donor Registration</h2>

            <p>Please enter the donor details below</p>

        </div>


        <form action="donor" method="post">


            <!-- Personal Information -->

            <div class="section-title">

                <span class="icon person-icon"></span>

                Personal Information

            </div>


            <div class="form-row">

                <div class="input-group">

                    <label for="name">Full Name</label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter donor name"
                        required
                    >

                </div>


                <div class="input-group">

                    <label for="age">Age</label>

                    <input
                        type="number"
                        id="age"
                        name="age"
                        placeholder="Enter age"
                        min="18"
                        required
                    >
<div class="form-group">
    <label>
        <i class="fa-solid fa-venus-mars"></i>
        Gender
    </label>

    <select name="gender" required>
        <option value="">Select Gender</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
</div>
                </div>

            </div>


            <!-- Blood Information -->

            <div class="section-title">

                <span class="icon blood-small"></span>

                Blood Information

            </div>


            <div class="input-group">

                <label for="blood_group">Blood Group</label>

                <select
                    id="blood_group"
                    name="blood_group"
                    class="blood-select"
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


            <!-- Contact Information -->

            <div class="section-title">

                <span class="icon phone-icon"></span>

                Contact Information

            </div>


            <div class="input-group">

                <label for="phone">Phone Number</label>

                <input
                    type="text"
                    id="phone"
                    name="phone"
                    placeholder="Enter phone number"
                    required
                >

            </div>


            <!-- Register -->

            <input
                type="submit"
                value="Register Donor"
                class="register-button"
            >


        </form>


        <!-- Back -->

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