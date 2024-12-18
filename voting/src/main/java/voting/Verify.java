package voting;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;



@WebServlet("/verify")
public class Verify extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Verify() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dob = request.getParameter("dob");
        String voterid = request.getParameter("vid");
        System.out.print("" + dob + voterid);
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String jdbcUrl = "jdbc:mysql://localhost:3306/web";
        String dbUser = "root";
        String dbPassword = "admin";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Create a statement
            statement = connection.createStatement();

            // SQL query to fetch data from the vinfo table
            String query = "SELECT name, number ,vord ,area ,Dob FROM vinfo WHERE Dob='" + dob + "' AND voterid='" + voterid + "';";
            System.out.print("after q" + dob + voterid);

            // Execute the query
            resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String number = resultSet.getString("number");
                String vord = resultSet.getString("vord");
                String area = resultSet.getString("area");
                String Dob = resultSet.getString("Dob");
               

                System.out.print("yes in success " + name + number);
                
       
                String message="000111";
                // Call the external API
                
                String apiUrl1 = "https://www.fast2sms.com/dev/voice?authorization=b3rYv7n0EMXiKjIoNsojLTUaeLypWSVnSEp5pcqKUJ6oAtwAxSxxyzZ0zGzl&route=otp&variables_values="+message+"&numbers="+number;
                
                String apiurlf="https://www.fast2sms.com/dev/bulkV2?authorization=b3rYv7n0EMXiKjIoNsojLTUaeLypWSVnSEp5pcqKUJ6oAtwAxSxxyzZ0zGzl&route=otp&variables_values="+message+"&flash=0&numbers="+number+"&schedule_time=";
                String apiUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=b3rYv7n0EMXiKjIoNsojLTUaeLypWSVnSEp5pcqKUJ6oAtwAxSxxyzZ0zGzl&route=q&message="+message+"&flash=0&numbers="+number; // replace with your actual API URL
                String apiResponse = callApi(apiurlf);

                // Print the API response to the console
                System.out.println("API Response: " + apiResponse);

                // Forward to the result page
                
                
                HttpSession Session=request.getSession();
                Session.setAttribute("otp", message);
               Session.setAttribute("name", name);
               Session.setAttribute("phn", number);
               Session.setAttribute("voterid", voterid);
               Session.setAttribute("area", area);
               Session.setAttribute("vord", vord);
               Session.setAttribute("dob", dob);
                
                
                request.getRequestDispatcher("result.jsp").forward(request, response);
                
                
                
                
                
                
            } else {
                System.out.print("no");
                // User not found, show error message
                request.setAttribute("errorMessage", "Invalid date of birth or voter ID.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String callApi(String apiUrl) throws IOException {
        try (CloseableHttpClient httpClient = HttpClients.createDefault();
             CloseableHttpResponse httpResponse = httpClient.execute(new HttpGet(apiUrl))) {
            return EntityUtils.toString(httpResponse.getEntity());
        }
    }
}
