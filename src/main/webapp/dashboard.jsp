<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Blood Bank Management System</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }

        /* Header */
        .header {
            background: #c40000;
            color: white;
            text-align: center;
            padding: 35px 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 36px;
        }

        .header p {
            font-size: 20px;
            margin: 12px 0 0;
        }

        /* Main container */
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        /* Cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .card {
            background: white;
            min-height: 300px;
            text-align: center;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.20);
        }

        /* Images */
        .card img {
            width: 110px;
            height: 110px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .card h2 {
            color: #b00000;
            margin: 10px 0;
            font-size: 25px;
        }

        .card p {
            color: #666;
            font-size: 16px;
            margin-bottom: 25px;
        }

        /* Buttons */
        .button {
            display: inline-block;
            background: #c40000;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .button:hover {
            background: #8f0000;
        }

        /* Logout */
        .logout {
            text-align: center;
            margin-top: 40px;
        }

        .logout a {
            display: inline-block;
            background: #333;
            color: white;
            padding: 12px 35px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .logout a:hover {
            background: #111;
        }

        /* Mobile */
        @media (max-width: 700px) {

            .cards {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 28px;
            }

            .container {
                width: 94%;
            }
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <div class="header">

        <h1>🩸 Blood Bank Management System</h1>

        <p>Admin Dashboard</p>

    </div>


    <!-- DASHBOARD -->
    <div class="container">

        <div class="cards">


            <!-- BLOOD STOCK -->
            <div class="card">

                <img src="images/blood.png"
                     alt="Blood Stock">

                <h2>Blood Stock</h2>

                <p>
                    View and manage available blood stock
                </p>

                <a class="button"
                   href="bloodstock.jsp">
                    View Blood Stock
                </a>

            </div>


            <!-- DONOR REGISTRATION -->
            <div class="card">

                <img src="images/donor.png"
                     alt="Donor Registration">

                <h2>Donor Registration</h2>

                <p>
                    Register new blood donors
                </p>

                <a class="button"
                   href="donor.jsp">
                    Register Donor
                </a>

            </div>


            <!-- SEARCH BLOOD -->
            <div class="card">

                <img src="images/search.png"
                     alt="Search Blood">

                <h2>Search Blood</h2>

                <p>
                    Search available blood groups
                </p>

                <a class="button"
                   href="searchblood.jsp">
                    Search Blood
                </a>

            </div>


            <!-- BLOOD REQUEST -->
            <div class="card">

                <img src="images/request.png"
                     alt="Blood Request">

                <h2>Blood Request</h2>

                <p>
                    Request blood for patients
                </p>

                <a class="button"
                   href="requestblood.jsp">
                    Request Blood
                </a>

            </div>


        </div>


        <!-- LOGOUT -->
        <div class="logout">

            <a href="Logout">
                Logout
            </a>

        </div>

    </div>

</body>
</html>