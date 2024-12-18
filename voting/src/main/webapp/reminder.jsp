<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ward Information</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <script src="https://kit.fontawesome.com/cca3e7e4f3.js" crossorigin="anonymous"></script>
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
            width: 60%;
            margin: 20px auto;
            margin-left:30px;
            max-height: 500px;
            overflow-y: auto; /* Adds vertical scrolling */
            border: 0px solid #ccc;
            border-radius: 3px;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .input-box-outer{
        border:1px solid #0056b3;
        text-align:left;
        margin:30px auto;
        margin-left:10px;
        margin-right:10px;
          padding-left:15px;
        }
        .ward{
      }
        .input-box {
            width: 100%;
            margin: 0px auto;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 2px;
        }
        .input-box input {
            padding: 2px;
            width:85%;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
      
    </style>
</head>

<body>
    <div class="enter-data-box"><div class="box-right">
   
   <form method="get">
   <div class="input-box-outer"><label for="ward">Enter Ward Number:</label>
            <div class="input-box">
                
                <input type="text" id="ward" name="ward" placeholder="Enter Ward Number">
                <button class="btn" type="submit">Search</button>
            </div></div>
        </form>
          
   <div class="input-box-outer"><label for="ward">Make an SMS Trigger To all Pending candidates.</label>
            <div class="input-box">
                <form action="Triggersms" method="POST">
    <button class="btn" type="submit">Trigger</button>
</form>
            
            </div></div>
       
   </div>
   
        

        <!-- Form to input ward number -->
        

        <!-- OK OK button -->
        

        <div class="section2-1">
         <H1 style="text-algin:left;">CANDIDATES CREDENTIALS</H1>
            <table>
                <thead>
                    <tr>
                        <th>Ward</th>
                        <th>Voter ID</th>
                        <th>Name</th>
                        <th>Area</th>
                        <th>Number</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Fetch ward number from the input form
                        String ward = request.getParameter("ward");
                        
                        // SQL query to filter data based on ward or fetch all data
                        String query = "SELECT vord, voterid, name, area, number FROM vinfo";
                        if (ward != null && !ward.trim().isEmpty()) {
                            query += " WHERE vord = ? AND status = 'pending'";
                        } else {
                            query += " WHERE status = 'pending'";
                        }

                        try {
                            // Database connection
                            String jdbcURL = "jdbc:mysql://localhost:3306/web";
                            String dbUser = "root";
                            String dbPassword = "admin";
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                            PreparedStatement preparedStatement = connection.prepareStatement(query);

                            if (ward != null && !ward.trim().isEmpty()) {
                                preparedStatement.setInt(1, Integer.parseInt(ward));
                            }

                            ResultSet resultSet = preparedStatement.executeQuery();

                            // Display data in the table
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
                            resultSet.close();
                            preparedStatement.close();
                            connection.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
            
        </div>
    </div>
</body>
<script>


</script>
</html>
