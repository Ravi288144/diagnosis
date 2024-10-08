<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
        <style>
            body {
                background: #c5cfd2;
            }
    
            #card {
                background: #D3CCE3;
                box-shadow: 0 0 10px gray;
                border-radius: 10px;
                padding: 20px;
                margin-top: -18px;
                width: 800px; /* Example width */
                height: auto; /* Example height */
            }
            
            .form-control {
                background: transparent;
                border: none;
                border-bottom: 2px solid black;
                border-radius: 0;
                box-shadow: none;
            }
    
            .form-control:focus {
                background-color: transparent; /* Ensure transparency on focus */
                border-bottom-color: black;
                box-shadow: none;
            }
    
            .form-control::placeholder {
                color: #999;
            }
    
            .custom-select {
                background: transparent;
                border: none;
                border-bottom: 2px solid black;
                border-radius: 0;
                box-shadow: none;
            }
    
            .custom-select:focus {
                background-color: transparent; /* Ensure transparency on focus */
                border-bottom-color: black;
                box-shadow: none;
            }
    
            .custom-select option {
                color: #000;
            }
    
            .header {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
    
            .header img {
                margin-right: 10px;
            }
    
            .header h1 {
                font-size: 3.0em;
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
                margin-top: -2px;
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
    
            .container {
                margin-top: 1px;
            }
    
            .backBtn {
                position: absolute;
                top: 10px;
                left: 10px;
            }
    
            .logout-btn {
                position: absolute;
                top: 10px;
                right: 10px;
            }
    
            form {
                margin-top: -8px;
                width: auto;
            }
    
            .input-group {
                margin-bottom: 20px;
            }
    
            .input-group .input-group-prepend .input-group-text {
                background: transparent;
                border: none;
                border-bottom: 2px solid black;
                border-radius: 0;
                box-shadow: none;
            }
            </style>
    </head>
    <body>
        <a id="backBtn" class="btn btn-outline-danger backBtn" onclick="goToDashboard()"><i class="bi bi-arrow-left"></i></a>
        <a href="logout" class="btn btn-outline-danger logout-btn" style="font-weight: bolder;">Logout</a>
        <div class="container">
            <div class="row justify-content-center mt-3">
                <div class="col-sm-10">
                    <div class="header">
                        <img src="/images/somuIT.png" alt="Logo" height="50" width="55">
                        <h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Patient Registration</h1><br>
                    </div>
                    <div id="card" class="card">
                        <form onsubmit="submitForm(event)">
                            <!-- 1st line: name, phone number -->
                            <div class="form-row">
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                    </div>
                                    <input type="text" id="patientName" name="patientName" class="form-control" placeholder="Patient Name" required>
                                </div>
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                    </div>
                                    <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Phone Number" required>
                                </div>
                            </div>
    
                            <!-- 2nd line: age, sex -->
                            <div class="form-row">
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                                    </div>
                                    <input type="number" id="age" name="age" class="form-control" placeholder="Age" required>
                                </div>
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>
                                    </div>
                                    <select id="sex" name="sex" class="custom-select" required>
                                        <option value="" disabled selected>Select Sex</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="others">Others</option>
                                    </select>
                                </div>
                            </div>
    
                            <!-- 3rd line: ref by -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                                    </div>
                                    <input type="text" id="refBy" name="refBy" class="form-control" placeholder="Ref. By" required>
                                </div>
                            </div>
    
                            <!-- 4th line: test, sample type, date -->
                            <div class="form-row">
                                <div class="input-group col-md-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-clipboard-data"></i></span>
                                    </div>
                                    <select id="test" name="test" class="custom-select" onchange="checkOtherTest()" required>
                                        <option value="" disabled selected>Select Test</option>
                                        <c:forEach var="t" items="${test}">
                                        <option value="${t.testName}"><c:out value="${t.testName}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-group col-md-4">
                                    <input type="text" id="otherTest" name="otherTest" class="form-control" placeholder="Enter Other Test" style="display:none; margin-top: 10px;">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="input-group col-md-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-droplet"></i></span>
                                    </div>
                                    <select id="sampleType" name="sampleType" class="custom-select" required>
                                        <option value="" disabled selected>Select Sample Type</option>
                                        <option value="Blood">Blood</option>
                                        <option value="Semen">Semen</option>
                                        <option value="Sputum">Sputum</option>
                                        <option value="Stool">Stool</option>
                                        <option value="Urine">Urine</option>
                                        <option value="Saliva">Saliva</option>
                                        <option value="Tissue Biopsy">Tissue Biopsy</option>
                                        <option value="Cerebrospinal fluid (CSF)">Cerebrospinal fluid (CSF)</option>
                                        <option value="Bone marrow">Bone marrow</option>
                                        <option value="Amniotic fluid">Amniotic fluid</option>
                                    </select>
                                </div>
                                <div class="input-group col-md-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-calendar3"></i></span>
                                    </div>
                                    <input type="date" id="date" name="date" class="form-control" placeholder="Date" required>
                                </div>
                            </div>
    
                            <!-- 5th line: cost, payment -->
                            <div class="form-row">
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                                    </div>
                                    <input type="number" id="cost" name="cost" class="form-control" placeholder="Cost" required>
                                </div>
                                <div class="input-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-wallet"></i></span>
                                    </div>
                                    <select id="modeOfPayment" name="modeOfPayment" class="custom-select" required>
                                        <option value="" disabled selected>Select Mode of Payment</option>
                                        <option value="cash">Cash</option>
                                        <option value="card">Card</option>
                                        <option value="upi">UPI</option>
                                    </select>
                                </div>
                            </div>
    
                            <div class="form-group d-flex justify-content-between mt-5">
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                                <button type="button" class="btn btn-outline-secondary" onclick="navigateTotests()">Details</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <script>
    	
	    function navigateTotests()
	    {
		window.location.href='navigateTotests';
	   }
        document.addEventListener('DOMContentLoaded', function () {
        	
        	fetch('getTestData',{
        		method:'GET',
        		headers:{
        			'Content-Type':'application/json'
        		}
        	}).then(res=>{return res.json()})
        	.then(data=>{
        		console.log(data)
        		const tests = data;
        	    const testSelect = document.getElementById('test');
        	    const costInput = document.getElementById('cost');
        	    testSelect.innerHTML='';
        	    const option = document.createElement('option');
        	    option.text='Select Test';
        	    testSelect.add(option);
        	    tests.forEach(function(test) {
        	      const option = document.createElement('option');
        	      option.value = test.testName;
        	      option.text = test.testName;
        	      testSelect.add(option);
        	    });

        	    testSelect.addEventListener('change', function() {
        	      const selectedTest = testSelect.value;
        	      const test = tests.find(t => t.testName === selectedTest);
        	      console.log(test.cost);
        	      if (test) {
        	        costInput.value = test.cost;
        	      } else {
        	        costInput.value = '';
        	      }
        	    });
        	  }).catch(err=>console.log(err))
        });


        async function submitForm(event) {
            event.preventDefault();
            
            const patientName = document.getElementById('patientName').value;
            const phoneNumber = document.getElementById('phoneNumber').value;
            const age = document.getElementById('age').value;
            const sex = document.getElementById('sex').value;
            const refBy = document.getElementById('refBy').value;
            const test = document.getElementById('test').value;
            const otherTest = document.getElementById('otherTest').value;
            const sampleType = document.getElementById('sampleType').value;
            const date = document.getElementById('date').value;
            const cost = document.getElementById('cost').value;
            const modeOfPayment = document.getElementById('modeOfPayment').value;

            const response = await fetch('addPatient', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    patientName,
                    phoneNumber,
                    age,
                    sex,
                    refBy,
                    test,
                    otherTest,
                    sampleType,
                    date,
                    cost,
                    modeOfPayment
                }),
            });

            if (response.ok) {
                window.location.href = 'sendFormData';
            } else {
                alert('Failed to submit patient details.');
            }
        }

        function checkOtherTest() {
            const testSelect = document.getElementById('test');
            const otherTestInput = document.getElementById('otherTest');
            if (testSelect.value === 'Others') {
                otherTestInput.style.display = 'block';
                otherTestInput.required = true;
            } else {
                otherTestInput.style.display = 'none';
                otherTestInput.required = false;
            }
        }

        function goToDashboard() {
            window.location.href = "dashboard";
        }
    </script>
</body>
</html>