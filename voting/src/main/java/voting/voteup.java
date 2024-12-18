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
import java.sql.Statement;



@WebServlet("/voteup1")
public class voteup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.print("\n voteing servelet");
		 HttpSession Session=request.getSession();
			String Rotp=(String) Session.getAttribute("otp");
			String Rvid=(String) Session.getAttribute("voterid");
			String Rname=(String) Session.getAttribute("name");
			String Rvord=(String) Session.getAttribute("vord");
			String Rnumber=(String) Session.getAttribute("phn");
			String area=(String) Session.getAttribute("area");
			String Rdob=(String) Session.getAttribute("dob");
      String candidate_name = request.getParameter("name");
      // Handle the button click logic here
      System.out.print(" candidate name =  "+candidate_name+"voterid"+Rvid);
		try {
			
			
			if(Rvid==null) {
				// response.setHeader("Refresh", "2; URL=NewFile.jsp");
				 String message="no";
		            request.setAttribute("message", message);
		            request.getRequestDispatcher("Votenow.jsp").forward(request, response);
			}
			else {
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","admin");
			

	           
	            String sql = "insert into vdata (block,vote,vord,hashv,hash) values(MD5('"+candidate_name+"')  ,'"+candidate_name+"','"+Rvord+"', '"+Rvid+"','ayush');";
	           
	            Statement s = c.createStatement();
	            
	            // Execute the statement
	            int rowsInserted = s.executeUpdate(sql);
	            if(rowsInserted > 0) {
	            	System.out.print("inserted sucessful");
	            
	            String message="yes";
	            request.setAttribute("message", message);
	            request.getRequestDispatcher("Votenow.jsp").forward(request, response);
	            }
	            else
	            {System.out.print("inserted failed");}
	            String message = (rowsInserted > 0) ? "Employee inserted successfully!" : "Failed to insert employee.";
	            request.setAttribute("message", message);
	            HttpSession session = request.getSession(false);
	            
	            // Invalidate the session if it exists
	            if (session != null) {
	                session.invalidate();
	            }
	            response.setHeader("Refresh", "0; URL=NewFile.jsp");

	            // Alternatively, you could redirect immediately
	            // response.sendRedirect("login.jsp");

	            // Optionally, you can also write a response message to the client
	            response.setContentType("text/html");
	            response.getWriter().println("<html><body><h2>You have been logged out. You will be redirected to the login page in 5 seconds.</h2></body></html>");
	     
			}        
			
	}
		catch(Exception e){
			System.out.print("execptiom"+e);		}
	}

}
