<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }

        .input-container {
            width: 100%;
            margin: 0 auto;
            box-sizing: border-box;
            box-shadow: 0 0 10px gray;
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
        }

        form {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
        }
        
        input, select, button {
            background-color: transparent;
            flex: 1;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid rgb(23, 23, 23);
            border-radius: 10px;
            box-sizing: border-box;
        }

        button {
            flex: 0 0 auto;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-left: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        h1, h2 {
            text-align: center;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .icon-button {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 24px;
        }

        .icon-button:hover {
            color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        .download-button {
            background: green;
            border: none;
            cursor: pointer;
        }

        .download-button:hover {
            color: #45a049;
        }

        .backBtn {
            font-weight: bolder;
            cursor: pointer;
        }

        .logout-btn {
            font-weight: bolder;
        }

        .inventory-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }

        .header-title {
            flex-grow: 1;
            text-align: center;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
</head>
<body>
    <div class="header-container">
        <a id="backBtn" class="btn btn-outline-danger backBtn" onclick="goToDashboard()"><i class="bi bi-arrow-left"></i></a>
        <h1>Inventory Management</h1>
        <a href="logout" class="btn btn-outline-danger logout-btn">Logout</a>
    </div>
    <div class="input-container">
        <form action="addinventory" method="POST">
            <input type="text" id="name" name="name" placeholder="Name" required>
            <input type="text" id="apperatus" name="apperatus" placeholder="Apperatus Name" required>
            <input type="text" id="quantity" name="quantity" placeholder="Quantity (e.g., 25L, 20Kg)" required>
            <input type="text" id="supplier" name="supplier" placeholder="Supplier" required>
            <input type="number" id="cost" name="cost" placeholder="Cost" required>
            <input type="date" id="payment_date" name="paymentdate" placeholder="Payment Date" required>
            <button type="submit">Add Item</button>
        </form>
    </div>
    <div class="inventory-header">
        <div class="header-title">
            <h2>Inventory List</h2>
        </div>
        <button id="downloadBtn" class="download-button"><i class="bi bi-download"></i></button>
    </div>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Apperatus</th>
                <th>Quantity</th>
                <th>Supplier</th>
                <th>Cost</th>
                <th>Payment Date</th>
            </tr>
        </thead>
        <tbody id="inventoryList">
           <c:forEach var="obj" items="${list}">
            <tr>
                <td><c:out value="${obj.name}"/></td>
                <td><c:out value="${obj.apperatus}"/></td>
                <td><c:out value="${obj.quantity}"/></td>
                <td><c:out value="${obj.supplier}"/></td>
                <td><c:out value="${obj.cost}"/></td>
                <td><c:out value="${obj.paymentdate}"/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

    <script>
        document.getElementById('downloadBtn').addEventListener('click', function() {
            downloadData();
        });

        function downloadData() {
            fetch('inventoryXLsheet', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (Array.isArray(data) && data.length > 0) {
                    const ws = XLSX.utils.json_to_sheet(data);
                    const wb = XLSX.utils.book_new();
                    XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
                    XLSX.writeFile(wb, "inventory.xlsx");
                } else {
                    console.error("Invalid data format for XLSX export:", data);
                }
            })
            .catch(error => console.error("Error fetching inventory data:", error));
        }

        function goToDashboard() {
            window.location.href = "dashboard";
        }
    </script>
</body>
</html>