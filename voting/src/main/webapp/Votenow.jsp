<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
 <link rel="stylesheet" type="text/css" href="Style.css">

    <title>Dynamic Rows Example</title>
    <script>
        function showAlert(message) {
            if (message === 'yes') {
                alert('Thanks for Casting Vote!');
             
               
                window.location.href = 'NewFile.jsp'; 
                
            } else {
                alert('Seems like you trying unfair means!');
                window.location.href = 'NewFile.jsp'; 
            }
        }
    </script>
</head>
<body>
 <div class="enter-data-box">
      
      <div class="box-left">
      
    <div class="evm-box">
        <div class="evm-fram">
            <div class="evm-fram-div">
        

    
        <%
        HttpSession Session=request.getSession();
		
		String Rvord=(String) Session.getAttribute("vord");
		
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/web";
            String user = "root";
            String password = "admin";
            String query = "SELECT party1 FROM candidates where vord='"+Rvord+"';";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);

                // Loop through the result set and create a row for each record
                while (rs.next()) {
                    String name = rs.getString("party1");
        %> 
        <div class="evm-list">
        <tr>
            <td><%= name %></td>
            <td>
                <form action="voteup" method="post">
                    <input type="hidden" name="name" value="<%= name %>" /> 
                    <button class="btn2" onclick="buttonclick" id="colorButton"></button>
                    <button class="btnv" >Click Me</button>
                  
                </form>
             
            </td>
        </tr></div>
        
        <%
          }  String message = (String) request.getAttribute("message");
          if (message != null) {
              out.println("<script>showAlert('" + message + "');</script>");
              
          }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Clean up resources
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
   </div>
    </div>
    </div> </div>
    
    
    
</body>
</html>
