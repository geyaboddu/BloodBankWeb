<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Blood Request | Blood Bank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #8b0000,
                    #d40000,
                    #ff6b6b
                );

            padding: 35px 15px;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 25px;
        }

        .blood-drop {
            width: 58px;
            height: 72px;
            background: white;
            margin: 0 auto 15px;
            border-radius: 55% 55% 60% 60%;
            transform: rotate(45deg);
            position: relative;
        }

        .blood-drop::after {
            content: "";
            position: absolute;
            width: 30px;
            height: 30px;
            background: #d40000;
            border-radius: 50%;
            top: 21px;
            left: 14px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            margin-top: 8px;
            font-size: 15px;
        }

        .request-card {
            width: 100%;
            max-width: 650px;
            margin: auto;

            background: white;
            border-radius: 22px;
            padding: 38px 42px;

            box-shadow:
                0 18px 45px rgba(0,0,0,0.30);
        }

        .title {
            text-align: center;
            margin-bottom: 30px;
        }

        .title h2 {
            margin: 0;
            color: #b00000;
            font-size: 28px;
        }

        .title p {
            color: #777;
            font-size: 14px;
            margin-top: 8px;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;

            color: #b00000;
            font-size: 18px;
            font-weight: bold;

            margin: 25px 0 18px;
            padding-bottom: 9px;

            border-bottom: 2px solid #f0d0d0;
        }

        /* CSS PERSON ICON */

        .person-icon,
        .blood-icon,
        .phone-icon {
            width: 32px;
            height: 32px;
            background: #ffe5e5;
            border-radius: 50%;
            position: relative;
            flex-shrink: 0;
        }

        .person-icon::before {
            content: "";
            position: absolute;
            width: 9px;
            height: 9px;
            background: #c40000;
            border-radius: 50%;
            top: 6px;
            left: 11px;
        }

        .person-icon::after {
            content: "";
            position: absolute;
            width: 17px;
            height: 9px;
            background: #c40000;
            border-radius: 10px 10px 5px 5px;
            bottom: 6px;
            left: 8px;
        }

        .blood-icon::after {
            content: "";
            position: absolute;
            width: 12px;
            height: 17px;
            background: #c40000;
            border-radius: 50% 50% 55% 55%;
            transform: rotate(45deg);
            left: 9px;
            top: 7px;
        }

        .phone-icon::before {
            content: "";
            position: absolute;
            width: 9px;
            height: 17px;
            border: 3px solid #c40000;
            border-radius: 5px;
            left: 9px;
            top: 6px;
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

            border: 1px solid #ccc;
            border-radius: 9px;

            font-size: 15px;
            outline: none;
            background: white;
        }

        .input-group input:focus,
        .input-group select:focus {
            border-color: #c40000;

            box-shadow:
                0 0 7px rgba(196,0,0,0.18);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .blood-select {
            border-left: 5px solid #c40000 !important;
        }

        .request-button {
            width: 100%;

            padding: 15px;
            margin-top: 18px;

            border: none;
            border-radius: 10px;

            background: #c40000;
            color: white;

            font-size: 17px;
            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;
        }

        .request-button:hover {
            background: #8f0000;
            transform: translateY(-2px);

            box-shadow:
                0 7px 18px rgba(143,0,0,0.25);
        }

        .back {
            text-align: center;
            margin-top: 22px;
        }

        .back a {
            color: #b00000;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .back a:hover {
            text-decoration: underline;
        }

        .footer {
            text-align: center;
            margin-top: 25px;
            color: #999;
            font-size: 12px;
        }

        @media (max-width: 600px) {

            .request-card {
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

    <div class="header">

        <div class="blood-drop"></div>

        <h1>Blood Bank Management System</h1>

        <p>Request the blood you need</p>

    </div>


    <div class="request-card">

        <div class="title">

            <h2>Blood Request</h2>

            <p>
                Please provide the details required for your blood request
            </p>

        </div>


        <form action="bloodrequest" method="post">

    <label>👤 Patient Name</label>
    <input type="text"
           name="patient_name"
           placeholder="Enter patient name"
           required>

    <label>🏥 Hospital / Location</label>
    <input type="text"
           name="hospital"
           placeholder="Enter hospital or location"
           required>

    <label>🩸 Required Blood Group</label>
    <select name="blood_group" required>
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

    <label>💉 Required Units</label>
    <input type="number"
           name="quantity"
           placeholder="Enter number of units"
           min="1"
           required>

    <label>📞 Phone Number</label>
    <input type="tel"
           name="phone"
           placeholder="Enter phone number"
           maxlength="15"
           required>

    <button type="submit">
        🩸 Submit Blood Request
    </button>

</form>
        <div class="back">

            <a href="dashboard.jsp">
                Back to Dashboard
            </a>

        </div>


        <div class="footer">

            Secure Blood Bank Management System

        </div>

    </div>

</body>

</html>-