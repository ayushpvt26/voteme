<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ward Votes</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Ward Votes Table</h2>
    <table>
        <thead>
            <tr>
                <th>Ward Number</th>
                <th>Candidate Name</th>
                <th>Total Votes</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://localhost:3306/web"; // Replace with your database URL
                String username = "root"; // Replace with your database username
                String password = "admin"; // Replace with your database password
                
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    // Establish connection
                    conn = DriverManager.getConnection(url, username, password);
                    
                    // SQL query
                    String sql = "SELECT vord AS Ward_Number, vote AS Candidate_Name, COUNT(*) AS Total_Votes " +
                                 "FROM vdata WHERE vord GROUP BY vord, vote ORDER BY vord, Total_Votes DESC";
                    
                    // Execute query
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    
                    // Display data in table
                    while (rs.next()) {
                        int wardNumber = rs.getInt("Ward_Number");
                        String candidateName = rs.getString("Candidate_Name");
                        int totalVotes = rs.getInt("Total_Votes");
            %>
            <tr>
                <td><%= wardNumber %></td>
                <td><%= candidateName %></td>
                <td><%= totalVotes %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Close resources
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </tbody>
    </table>
</body>
</html>
