<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background: #f8f9fa;
        }

        .centered {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: auto;
        }

        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            max-width: 900px;
            margin-top: -8vh;
        }

        .card {
            width: 350px;
            height: 150px;
            padding: 15px;
            margin: 10px;
            text-align: center;
            box-shadow: 1px 14px 18px rgba(0,0,0,0.1);
            border-radius: 10px;
            box-sizing: border-box;
            background: transparent;
        }

        .logout-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .header {
            display: flex;
            align-items: center;
            margin-top: 10%;
        }

        .header img {
            margin-right: 10px;
            margin-top: -290px;
            height: 100px;
            width: 100px;
        }

        .header h1 {
            font-size: 5.0em;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            margin-top: -290px;
        }

        @media (max-width: 600px) {
            .header {
                flex-direction: column;
                align-items: center;
            }

            .header img {
                margin-bottom: 10px;
            }
        }

        .button-group {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .button-group .btn {
            flex: 1;
            margin: 1px;
        }

        .navbar {
            margin-bottom: 20px;
        }

        .profile-icon,
        .settings-icon {
            cursor: pointer;
            font-size: 1.5rem;
            margin-right: 15px; /* Add space between icons */
        }

        .modal-right {
            position: absolute;
            right: 20px;
            top: 60px;
        }

        .modal-header {
            display: flex;
            justify-content: center;
        }

        .modal-body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
        }

        .edit-icon {
            font-size: 2rem;
            margin-top: 20px;
            color: #007bff;
            cursor: pointer;
        }

        .edit-icon:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="ml-auto d-flex">
            <i class="bi bi-gear-fill settings-icon" data-toggle="modal" data-target="#settingsModal"></i>
            <i class="bi bi-person-circle profile-icon" data-toggle="modal" data-target="#profileModal"></i>
        </div>
    </nav>

    <div class="centered">
        <div class="header">
            <img src="/images/somuIT.png" alt="Logo" height="50" width="55">
            <h1>SOMU DIAGNOSTICS</h1>
        </div>
        <div class="card-container">
            <!-- First row with 3 cards -->
            <div class="card">
                <h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-weight: bolder;">Patient Details</h2>
                <p>Enter patient information.</p>
                <a href="patTab" class="btn btn-primary">Go to Patient Details</a>
            </div>
            <div class="card">
                <h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-weight: bolder;">Reports</h2>
                <p>View reports.</p>
                <a href="Refreshreport" class="btn btn-primary">Go to Reports</a>
            </div>
            <div class="card">
                <h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-weight: bolder;">Payments</h2>
                <p>Manage payments.</p>
                <a href="goPayment" class="btn btn-primary">Go to Payments</a>
            </div>

            <!-- Second row with 2 cards -->
            <div class="card">
                <h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-weight: bolder;">Inventory</h2>
                <p>Manage inventory.</p>
                <div class="button-group">
                    <a href="displayInventory" class="btn btn-primary">Inventory</a>
                    <a href="stockinventoryDetails" class="btn btn-success">Store</a>
                </div>
            </div>
            <div class="card">
                <h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-weight: bolder;">Add New Test</h2>
                <p>Add a new test to system.</p>
                <a href="newtest" class="btn btn-info">Add New Test</a>
            </div>
        </div>
    </div>
    
    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-right" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">Profile Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>Name:</strong> ${name}</p>
                    <p><strong>Employee ID:</strong> ${empid}</p>
                </div>
                <div class="modal-footer">
                    <a href="logout" class="btn btn-outline-danger">Logout</a>
                </div>
            </div>
        </div>
    </div>
   <!-- Settings Modal -->
    <div class="modal fade" id="settingsModal" tabindex="-1" role="dialog" aria-labelledby="settingsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-right" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="settingsModalLabel">Settings</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Settings Icons -->
                    <div class="d-flex flex-column align-items-center">
                        <!-- Patient Details Icon -->
                        <div class="text-center my-2">
                            <i class="bi bi-person-lines-fill" style="font-size: 2rem; cursor: pointer;" onclick="window.location.href='checkpatients'"></i>
                            <p>Patient Details</p>
                        </div>
                        <!-- Tests Icon -->
                        <div class="text-center my-2">
                            <i class="bi bi-clipboard-data" style="font-size: 2rem; cursor: pointer;" onclick="window.location.href='addtesticon'"></i>
                            <p>Tests</p>
                        </div>
                        <!-- Reports Icon -->
                        <!-- <div class="text-center my-2">
                            <i class="bi bi-file-earmark-text" style="font-size: 2rem;"></i>
                            <p>Reports</p>
                        </div> -->
                        <!-- Employees Icon -->
                        <div class="text-center my-2">
                            <i class="bi bi-people-fill" style="font-size: 2rem; cursor: pointer;"  onclick="window.location.href='employees'"></i>
                            <p>Employees</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>