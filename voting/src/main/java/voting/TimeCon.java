package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.time.LocalDateTime;

/**
 * Servlet implementation class TimeCon
 */
public class TimeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
	        String action = request.getParameter("action");

	        if ("setTimer".equals(action)) {
	            // Set expiry time for the target page
	            int duration = Integer.parseInt(request.getParameter("duration")); // e.g., 1 minute
	            LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(duration);
	            session.setAttribute("pageExpiryTime", expiryTime);
	            session.setAttribute("pageActive", true);

	            System.out.println("Timer set: Page will expire at " + expiryTime); // Debug
	            response.sendRedirect("NewFile.jsp");
	        } else if ("checkAccess".equals(action)) {
	            // Check access for the target page
	            LocalDateTime expiryTime = (LocalDateTime) session.getAttribute("pageExpiryTime");
	            boolean isActive = expiryTime != null && LocalDateTime.now().isBefore(expiryTime);

	            System.out.println("Current time: " + LocalDateTime.now()); // Debug
	            System.out.println("Expiry time: " + expiryTime); // Debug
	            System.out.println("Is page active? " + isActive); // Debug

	            if (isActive) {
	                response.sendRedirect("targetPage.jsp");
	            } else {
	                response.sendRedirect("inactivePage.jsp");
	            }
	        }
	    }
		
		
		
		
		
		
		
		
		
	}


