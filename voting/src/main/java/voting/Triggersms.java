package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 * Servlet implementation class Triggersms
 */
public class Triggersms extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Triggersms() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("trigger");
		System.out.println("Triggering API calls...");

	    // Database connection variables
	    String jdbcURL = "jdbc:mysql://localhost:3306/web";
	    String dbUser = "root";
	    String dbPassword = "admin";

	    // Query to fetch numbers with 'pending' status
	    String query = "SELECT number FROM vinfo WHERE status = ?";
	    String status = "pending";

	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        // Establish database connection
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

	        // Prepare statement to fetch numbers
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, status);
	        resultSet = preparedStatement.executeQuery();

	        // Loop through each record and trigger API call
	        while (resultSet.next()) {
	            String phoneNumber = resultSet.getString("number");
	            String message = "0000";

	            // Construct API URL
	            String apiUrl = "https://www.fast2sms.com/dev/bulkV2?authorization="
	                    + "b3rYv7n0EMXiKjIoNsojLTUaeLypWSVnSEp5pcqKUJ6oAtwAxSxxyzZ0zGzl"
	                    + "&route=otp&variables_values=" + message
	                    + "&flash=0&numbers=" + phoneNumber
	                    + "&schedule_time=";

	            // Trigger API call
	            String apiResponse = callApi(apiUrl);
	            System.out.println("API Response for number " + phoneNumber + ": " + apiResponse);
	            
	            // Delay before the next iteration
	            Thread.sleep(2000);
	        }
	        response.sendRedirect("reminder.jsp");  } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources
	        try {
	            if (resultSet != null) resultSet.close();
	            if (preparedStatement != null) preparedStatement.close();
	            if (connection != null) connection.close();
	        } catch (Exception e) {
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
