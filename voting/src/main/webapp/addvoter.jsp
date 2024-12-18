<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <script src="https://kit.fontawesome.com/cca3e7e4f3.js" crossorigin="anonymous"></script>
    <script>
       
    </script>
</head>

<body>
    <div class="enter-data-box">
        <div class="box-right"></div>
        <div class="box-left"> <H1 style=" text-align: left; padding-left:5px;">  ENTER CREDENTIALS</H1>
            <form method="post" id="myForm" action="Addvoter">
                <div class="section2">  
                    <div class="sub-section">
                        <h3>Full Name</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="John Doe" name="fname" id="fname" value="">
                    </div>
                    <div class="sub-section">
                        <h3>Date of Birth</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="DD/MM/YYYY" name="dob" id="dob" value="">
                    </div>
                    <div class="sub-section">
                        <h3>Mobile Number</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="9826XXXXXX" name="phn" id="phn" value="">
                    </div>
                </div>
                <div class="section2">
                    <div class="sub-section">
                        <h3>State</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="Odisha" name="State" id="State" value="">
                    </div>
                    <div class="sub-section">
                        <h3>Area</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="Indore" name="Area" id="Area" value="">
                    </div>
                    <div class="sub-section">
                        <h3>Vord Number</h3>
                        <p>Enter the main information</p>
                        <input type="text" placeholder="11" name="vord" id="vord" value="">
                    </div>
                </div>
                <button class="btn-1" type="submit">Submit</button>
            </form>
            
           
        </div>
    </div>
</body>
</html>
