<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patients List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .backBtn {
            position: absolute;
            left: 10px;
        }

        .logout-btn {
            position: absolute;
            right: 10px;
        }

        .table-container {
            height: 85vh; 
            overflow-y: auto;
            margin-top: 20px;
        }
    </style>
    <script>
        function goToDashboard() {
            window.location.href = "dashboard";
        }
    </script>
</head>
<body>
    <a id="backBtn" class="btn btn-outline-danger backBtn" onclick="goToDashboard()"><i class="bi bi-arrow-left"></i></a>
    <a href="logout" class="btn btn-outline-danger logout-btn" style="font-weight: bolder;">Logout</a>
    <h1 class="text-center">Patient Details</h1>
    
    <div class="container mt-5 table-container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Test</th>
                    <th>DOB</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${patientdetails}" varStatus="loop">
                <tr>
                    <form action="updatePatient" method="POST">
                        <input type="hidden" name="patient_id" value="${p.id}">
                        <td><c:out value="${loop.index+1}"/></td>
                        <td><input type="text" name="patient_name" value="${p.patientName}" class="form-control"></td>
                        <td><input type="number" name="age" value="${p.age}" class="form-control"></td>
                        <td><input type="text" name="test" value="${p.test}" class="form-control"></td>
                        <td><input type="date" name="dob" value="${p.date}" class="form-control"></td>
                        <td><button type="submit" class="btn btn-success">Submit</button></td>
                    </form>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>