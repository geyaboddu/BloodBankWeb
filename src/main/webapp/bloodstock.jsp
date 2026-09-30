<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Blood Stock | Blood Bank Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f6f8;
            color: #333;
        }


        /* ================= HEADER ================= */

        .header {
            background: linear-gradient(135deg, #8b0000, #d40000);
            color: white;
            padding: 35px 20px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        .header-icon {
            width: 55px;
            height: 70px;
            background: white;
            margin: 0 auto 15px;

            border-radius: 50% 50% 55% 55%;

            transform: rotate(45deg);

            position: relative;
        }

        .header-icon::after {
            content: "";
            position: absolute;

            width: 10px;
            height: 10px;

            background: #d40000;

            border-radius: 50%;

            top: 13px;
            left: 15px;
        }

        .header h1 {
            margin: 10px 0 5px;
            font-size: 32px;
        }

        .header p {
            margin: 0;
            font-size: 15px;
            opacity: 0.9;
        }


        /* ================= MAIN ================= */

        .container {
            width: 90%;
            max-width: 1200px;

            margin: 40px auto;
        }


        /* ================= PAGE TITLE ================= */

        .page-title {
            text-align: center;
            margin-bottom: 35px;
        }

        .page-title h2 {
            margin: 0;

            font-size: 30px;

            color: #8b0000;
        }

        .page-title p {
            color: #777;

            margin-top: 8px;

            font-size: 15px;
        }


        /* ================= SUMMARY CARDS ================= */

        .summary {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

            margin-bottom: 35px;
        }

        .summary-card {
            background: white;

            padding: 22px;

            border-radius: 15px;

            display: flex;

            align-items: center;

            gap: 18px;

            box-shadow:
                0 5px 18px rgba(0,0,0,0.08);

            transition: 0.3s;
        }

        .summary-card:hover {
            transform: translateY(-4px);

            box-shadow:
                0 10px 25px rgba(0,0,0,0.12);
        }


        /* Summary Icons */

        .summary-icon {
            width: 55px;
            height: 55px;

            border-radius: 12px;

            display: flex;
            justify-content: center;
            align-items: center;

            background: #ffe5e5;

            position: relative;
        }

        .summary-icon .mini-drop {
            width: 20px;
            height: 27px;

            background: #c00000;

            border-radius: 50% 50% 55% 55%;

            transform: rotate(45deg);
        }

        .summary-card h3 {
            margin: 0;

            font-size: 14px;

            color: #777;
        }

        .summary-card strong {
            display: block;

            margin-top: 5px;

            font-size: 25px;

            color: #8b0000;
        }


        /* ================= BLOOD GRID ================= */

        .blood-grid {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 22px;
        }


        /* ================= BLOOD CARD ================= */

        .blood-card {

            background: white;

            border-radius: 18px;

            padding: 30px 20px;

            text-align: center;

            border-top: 5px solid #c00000;

            box-shadow:
                0 5px 18px rgba(0,0,0,0.08);

            transition: 0.3s;

            position: relative;

            overflow: hidden;
        }

        .blood-card:hover {

            transform: translateY(-7px);

            box-shadow:
                0 12px 30px rgba(0,0,0,0.14);
        }


        /* Blood Drop */

        .blood-drop {

            width: 55px;
            height: 70px;

            background: linear-gradient(
                145deg,
                #e00000,
                #a00000
            );

            margin: 0 auto 18px;

            border-radius:
                50% 50% 55% 55%;

            transform: rotate(45deg);

            position: relative;

            box-shadow:
                0 6px 12px rgba(180,0,0,0.25);
        }


        /* Drop Highlight */

        .blood-drop::after {

            content: "";

            position: absolute;

            width: 11px;
            height: 11px;

            background: white;

            opacity: 0.65;

            border-radius: 50%;

            top: 13px;
            left: 15px;
        }


        /* Blood Group */

        .blood-card h3 {

            margin: 5px 0;

            font-size: 25px;

            color: #333;
        }


        /* Units */

        .units {

            font-size: 28px;

            font-weight: bold;

            color: #8b0000;

            margin-top: 8px;
        }

        .unit-text {

            font-size: 13px;

            color: #888;

            margin-top: 3px;
        }


        /* ================= STATUS ================= */

        .status {

            display: inline-block;

            margin-top: 15px;

            padding: 7px 15px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: bold;
        }


        .available {

            background: #e4f7ed;

            color: #16834b;
        }


        .low {

            background: #fff3cd;

            color: #9a7600;
        }


        .critical {

            background: #ffe0e0;

            color: #c00000;
        }


        /* ================= FOOTER ================= */

        .footer {

            text-align: center;

            margin: 45px 0 25px;

            color: #888;

            font-size: 13px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .blood-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }

            .summary {

                grid-template-columns:
                    1fr;
            }
        }


        @media (max-width: 500px) {

            .blood-grid {

                grid-template-columns:
                    1fr;
            }

            .header h1 {

                font-size: 25px;
            }

            .container {

                width: 94%;
            }
        }

    </style>

</head>


<body>


    <!-- ================= HEADER ================= -->

    <div class="header">

        <div class="header-icon"></div>

        <h1>Blood Bank Management System</h1>

        <p>Blood Stock Management</p>

    </div>


    <!-- ================= MAIN ================= -->

    <div class="container">


        <!-- PAGE TITLE -->

        <div class="page-title">

            <h2>Blood Stock</h2>

            <p>
                Current availability of blood groups
            </p>

        </div>


        <!-- ================= SUMMARY ================= -->

        <div class="summary">


            <div class="summary-card">

                <div class="summary-icon">
                    <div class="mini-drop"></div>
                </div>

                <div>

                    <h3>Total Blood Units</h3>

                    <strong>127</strong>

                </div>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    <div class="mini-drop"></div>
                </div>

                <div>

                    <h3>Available Groups</h3>

                    <strong>8</strong>

                </div>

            </div>


            <div class="summary-card">

                <div class="summary-icon">
                    <div class="mini-drop"></div>
                </div>

                <div>

                    <h3>Low Stock Groups</h3>

                    <strong>2</strong>

                </div>

            </div>


        </div>


        <!-- ================= BLOOD GROUPS ================= -->

        <div class="blood-grid">


            <!-- A+ -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>A+</h3>

                <div class="units">25</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status available">
                    Available
                </span>

            </div>


            <!-- A- -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>A-</h3>

                <div class="units">12</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status available">
                    Available
                </span>

            </div>


            <!-- B+ -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>B+</h3>

                <div class="units">30</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status available">
                    Available
                </span>

            </div>


            <!-- B- -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>B-</h3>

                <div class="units">8</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status low">
                    Low Stock
                </span>

            </div>


            <!-- AB+ -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>AB+</h3>

                <div class="units">18</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status available">
                    Available
                </span>

            </div>


            <!-- AB- -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>AB-</h3>

                <div class="units">5</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status critical">
                    Critical
                </span>

            </div>


            <!-- O+ -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>O+</h3>

                <div class="units">20</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status available">
                    Available
                </span>

            </div>


            <!-- O- -->

            <div class="blood-card">

                <div class="blood-drop"></div>

                <h3>O-</h3>

                <div class="units">9</div>

                <div class="unit-text">
                    Units Available
                </div>

                <span class="status low">
                    Low Stock
                </span>

            </div>


        </div>


        <!-- ================= FOOTER ================= -->

        <div class="footer">

            Blood Bank Management System

        </div>


    </div>


</body>

</html>