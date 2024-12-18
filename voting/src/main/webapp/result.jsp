<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <script src="https://kit.fontawesome.com/cca3e7e4f3.js" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <div class="enter-data-box">
      <div class="box-right">



      </div>
      <div class="box-left">

        <div class="section1">
          
          <H1>AUTHENTIFICATION</H1>
          <P class="batch-step">Step-2</P>
        </div>
        <form action="VerifyOtp" method="POST">
        <div class="section2">
                <div class="sub-section">
                    <i class="fa-regular fa-comment-dots"></i>
                  <h3>One Time Password </h3>
                  <p>yoiuwfe gfir the entering the main</p>
                  <input type="text" maxlength="6" name="otpDisplay" placeholder="ENTER OTP">

                </div>
                  <div class="sub-section">
                    <i class="fa-solid fa-robot"></i>
                    <br><br>
                    
                  </div>


        </div>

        <button class="btn-1">Next</button>
      </form>
        <div class="section1"></div>
      </div>






    </div>
    <script>
        function onSubmit(token) {
          document.getElementById("demo-form").submit();
        }
      </script>
</body>
</html>