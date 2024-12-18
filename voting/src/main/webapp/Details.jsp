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
</head>
<body>
    <div class="enter-data-box">
      <div class="box-right">



      </div>
      <div class="box-left">

        <div class="section1">
          
          <H1>Hi ${name}</H1>
          <h4>VOTER ID : RMP123-4</h4>
                 
          <P class="batch-step">Step-3</P>
        </div>
        <div class="section2">
                <div class="sub-section-d">
                 
                  <h4>VOTER ID :</h4>
                  <p>RMP123-4</p>
                  
                  <h4>Name :</h4>
                  <p>${name}</p>



                </div>
                  <div class="sub-section-d">
                   
                   
                    <h4>State :</h4>
                    <p>Madhaya Pradesh</p> 
                     <h4>Area :</h4>
                    <p>${phn}</p>
                    <h4>Vord number :</h4>
                    <p> ${vord}</p>
              
                  </div>


        </div>
        <form action="Votenow.jsp" method ="post">

            
        <button class="btn-1">submit</button>
        </form>
      </div>






    </div>
</body>
</html>