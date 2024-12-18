<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
       <style>
         table {
            width: 100%;
            margin: 10px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .section2-1 {
            width: 90%;
          
            margin: 50px auto;
            max-height: 500px;
            overflow-y: auto; /* Adds vertical scrolling */
            border: 1px solid #ccc;
            border-radius:3px; /* Optional: Border for the scrollable area */
        }
    </style>
</head>

<body>
    <div class="enter-data-box">
        <div class="box-right"></div>
        <div class="box-left"> <H1 style=" text-align: left; padding-left:5px;">  ENTER CREDENTIALS</H1>
            <form method="post" id="myForm" action="Addvoter">
                <div class="section22"> 
                <div class="section2-1">  
                <table>
        <thead>
            <tr>
                <th>vord</th>
                <th>Voterid</th>
                <th>Name </th>
                <th>Area</th>
                <th>number</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                // Database credentials
                 String jdbcURL = "jdbc:mysql://localhost:3306/web";
             String dbUser = "root";
             String dbPassword = "admin";
                String query = "SELECT vord,voterid,name,area,number  FROM vinfo WHERE status = 'pending'";

                try {
                    // Connect to database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    // Iterate through the result set and display data
                    while (resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getInt("vord") %></td>
                            <td><%= resultSet.getString("voterid") %></td>
                            <td><%= resultSet.getString("name") %></td>
                            <td><%= resultSet.getString("area") %></td>
                            <td><%= resultSet.getString("number") %></td>
                        </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
    </div>
         </div>
                <button class="btn-1" type="submit">Submit</button>
            </form>
            
           
        </div>
    </div>
</body>
</html>

