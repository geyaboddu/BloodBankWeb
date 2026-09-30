<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Blood Search Result | Blood Bank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;

            font-family: Arial, sans-serif;

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 30px 15px;

            background:
                linear-gradient(
                    135deg,
                    #8b0000,
                    #d40000,
                    #ff6b6b
                );
        }


        /* MAIN CARD */

        .result-card {
            width: 100%;
            max-width: 520px;

            background: white;

            padding: 40px;

            border-radius: 24px;

            text-align: center;

            box-shadow:
                0 18px 50px rgba(0, 0, 0, 0.30);
        }


        /* CSS BLOOD DROP */

        .blood-drop {
            width: 65px;
            height: 82px;

            background: #c40000;

            margin: 0 auto 25px;

            border-radius:
                55% 55% 65% 65%;

            transform: rotate(45deg);

            position: relative;

            box-shadow:
                0 8px 20px rgba(196, 0, 0, 0.30);
        }


        .blood-drop::after {
            content: "";

            position: absolute;

            width: 17px;
            height: 17px;

            background: rgba(255,255,255,0.35);

            border-radius: 50%;

            top: 17px;
            left: 15px;
        }


        /* TITLE */

        h1 {
            margin: 0;

            color: #b00000;

            font-size: 30px;
        }


        .subtitle {
            color: #777;

            font-size: 14px;

            margin-top: 8px;

            margin-bottom: 30px;
        }


        /* RESULT BOX */

        .result-box {

            background: #fff6f6;

            border: 1px solid #f0cccc;

            border-radius: 18px;

            padding: 28px 20px;

            margin-bottom: 25px;
        }


        /* SMALL SEARCH ICON */

        .search-icon {

            width: 52px;
            height: 52px;

            margin: 0 auto 18px;

            background: #ffe5e5;

            border-radius: 50%;

            position: relative;
        }


        .search-icon::before {

            content: "";

            position: absolute;

            width: 20px;
            height: 20px;

            border: 4px solid #c40000;

            border-radius: 50%;

            left: 12px;
            top: 11px;
        }


        .search-icon::after {

            content: "";

            position: absolute;

            width: 18px;
            height: 4px;

            background: #c40000;

            border-radius: 4px;

            transform: rotate(45deg);

            left: 30px;
            top: 32px;
        }


        /* LABEL */

        .label {

            color: #777;

            font-size: 14px;

            margin-bottom: 5px;
        }


        /* BLOOD GROUP */

        .blood-group {

            color: #b00000;

            font-size: 44px;

            font-weight: bold;

            margin-bottom: 20px;
        }


        /* UNITS */

        .units {

            color: #222;

            font-size: 38px;

            font-weight: bold;

            margin: 5px 0;
        }


        .units-label {

            color: #777;

            font-size: 14px;

            margin-bottom: 15px;
        }


        /* AVAILABLE */

        .available {

            display: inline-block;

            padding: 8px 20px;

            border-radius: 25px;

            background: #e2f6e9;

            color: #18753a;

            font-size: 14px;

            font-weight: bold;
        }


        /* NOT AVAILABLE */

        .not-available {

            display: inline-block;

            padding: 8px 20px;

            border-radius: 25px;

            background: #ffe5e5;

            color: #b00000;

            font-size: 14px;

            font-weight: bold;
        }


        /* ERROR */

        .error-box {

            background: #fff0f0;

            border: 1px solid #ffb5b5;

            color: #b00000;

            padding: 18px;

            border-radius: 12px;

            font-weight: bold;

            margin-bottom: 20px;
        }


        /* BUTTONS */

        .buttons {

            display: flex;

            justify-content: center;

            gap: 12px;

            flex-wrap: wrap;
        }


        .button {

            text-decoration: none;

            padding: 13px 22px;

            border-radius: 9px;

            font-size: 14px;

            font-weight: bold;

            transition: 0.3s;
        }


        .search-again {

            background: #c40000;

            color: white;
        }


        .dashboard {

            background: #333;

            color: white;
        }


        .button:hover {

            transform: translateY(-2px);

            opacity: 0.9;
        }


        /* FOOTER */

        .footer {

            margin-top: 25px;

            color: #999;

            font-size: 12px;
        }


        /* MOBILE */

        @media (max-width: 600px) {

            .result-card {

                padding: 30px 20px;
            }

            h1 {

                font-size: 25px;
            }

            .blood-group {

                font-size: 38px;
            }

            .units {

                font-size: 32px;
            }

            .buttons {

                flex-direction: column;
            }

            .button {

                width: 100%;
            }
        }

    </style>

</head>


<body>


    <div class="result-card">


        <!-- CSS BLOOD DROP ICON -->

        <div class="blood-drop"></div>


        <h1>Blood Search Result</h1>

        <div class="subtitle">
            Blood Bank Management System
        </div>


        <%
            String error =
                (String) request.getAttribute("error");

            String bloodGroup =
                (String) request.getAttribute("bloodGroup");

            Integer units =
                (Integer) request.getAttribute("units");

            Boolean found =
                (Boolean) request.getAttribute("found");
        %>


        <% if (error != null) { %>


            <div class="error-box">

                <%= error %>

            </div>


        <% } else if (bloodGroup != null) { %>


            <div class="result-box">


                <!-- SEARCH ICON -->

                <div class="search-icon"></div>


                <div class="label">
                    Blood Group
                </div>


                <div class="blood-group">
                    <%= bloodGroup %>
                </div>


                <% if (Boolean.TRUE.equals(found)) { %>


                    <div class="label">
                        Available Units
                    </div>


                    <div class="units">
                        <%= units %>
                    </div>


                    <div class="units-label">
                        Units of blood currently available
                    </div>


                    <div class="available">
                        Available
                    </div>


                <% } else { %>


                    <div class="units">
                        0
                    </div>


                    <div class="units-label">
                        No units currently available
                    </div>


                    <div class="not-available">
                        Not Available
                    </div>


                <% } %>


            </div>


        <% } %>


        <!-- BUTTONS -->

        <div class="buttons">


            <a
                href="searchblood.jsp"
                class="button search-again">

                Search Again

            </a>


            <a
                href="dashboard.jsp"
                class="button dashboard">

                Back to Dashboard

            </a>


        </div>


        <div class="footer">

            Secure Blood Bank Management System

        </div>


    </div>


</body>

</html>