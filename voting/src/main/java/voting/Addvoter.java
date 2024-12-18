package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Pattern;
import java.util.regex.Matcher;




/**
 * Servlet implementation class Addvoter
 */
public class Addvoter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 String n = request.getParameter("fname");
         String dob = request.getParameter("dob");
         String number = request.getParameter("phn");
         String vord = request.getParameter("vord");
         String area = request.getParameter("Area");
         String state = request.getParameter("State");
         
         if (n != null && dob != null && number != null && vord != null && area != null && state != null) {
             System.out.print("" + n + dob + number + vord + area + state);
             
             String jdbcUrl = "jdbc:mysql://localhost:3306/web";
             String dbUser = "root";
             String dbPassword = "admin";

             try {
                 // Load the MySQL JDBC driver
                 Class.forName("com.mysql.cj.jdbc.Driver");

                 // Establish the connection
                 Connection c = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                 Statement s = c.createStatement();
                 String getLastVoterIdQuery = "SELECT id FROM vinfo ORDER BY voterid DESC LIMIT 1";
                 ResultSet rs = s.executeQuery(getLastVoterIdQuery);
                 String lastVoterId = null;
                 if (rs.next()) {
                     lastVoterId = rs.getString("id");
                 }
                 // Assuming the voter ID is numeric and you want to increment it
                 // Modify as needed if voter ID is not purely numeric
                 
                
                 String input = lastVoterId;
                 Pattern pattern = Pattern.compile("\\d+");
                 Matcher matcher = pattern.matcher(input);
                 int in=0;
                 while (matcher.find()) {
                	
                	 int ns = Integer.parseInt(matcher.group());
                    in = ns + 1;
                     System.out.println("Found number: " + in);
                 }
                 String newVoterId ="RMP"+in;
                 // Insert the new record
                 String sql = "INSERT INTO vinfo (Dob, number, area, name, vord, voterid, status,pincode) VALUES ('" + dob + "', '" + number + "', '" + area + "', '" + n + "', '" + vord + "', '"+newVoterId+"', 'pending','"+state+"');";
                 int rowsInserted = s.executeUpdate(sql);
                 if (rowsInserted > 0) {
                     response.setContentType("text/html");

                     // Get the response writer
                     PrintWriter out = response.getWriter();

                     out.println("<h1>Inserted successfully</h1>");
           
                 } else {
                     System.out.print("Insertion failed");
                 }
                 
                 // Close resources
                 s.close();
                 c.close();
             } catch (Exception e) {
                 e.printStackTrace();
             }
         }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
