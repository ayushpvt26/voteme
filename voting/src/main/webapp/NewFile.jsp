<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.time.LocalDateTime" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <script src="https://kit.fontawesome.com/cca3e7e4f3.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="enter-data-box">
      <div class="box-right">



      </div>
      <div class="box-left">

        <div class="section1">
          
          <H1>ENTER CREDENTIALS</H1>
          <P class="batch-step">Step-1</P>
        </div>
             <form action="Verify" method="POST">
             <div class="section2">
                <div class="sub-section">
                  <i class="fa-solid fa-id-card"> </i>
                  <h3>VOTER ID </h3>
                  <p>yoiuwfe gfir the entering the main</p>
                  <input type="text" placeholder="dataob" name="dob" id="dob">

                </div>
                  <div class="sub-section">
                    <i class="fa-solid fa-lock"></i>
                    <h3>DATE OF BIRTH</h3>
                    <p>yoiuwfe gfir the entering the main</p>
                  
                    <input type="text" placeholder="vid" name="vid" id="vid">
                  </div>


        </div>

        <button class="btn-1">submit</button>
        </form>
        <div class="section1"></div>
      </div>






    </div>
</body>
</html>