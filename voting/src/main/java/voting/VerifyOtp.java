package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class VerifyOtp
 */
@WebServlet("/verifyOtp")
public class VerifyOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	String EnterOtp=request.getParameter("otp");
		String EnterOtp = request.getParameter("otpDisplay");

		HttpSession Session=request.getSession();
		String Rotp=(String) Session.getAttribute("otp");
		String Rvid=(String) Session.getAttribute("voterid");
		String Rname=(String) Session.getAttribute("name");
		String Rvord=(String) Session.getAttribute("vord");
		String Rnumber=(String) Session.getAttribute("phn");
		String area=(String) Session.getAttribute("area");
		String Rdob=(String) Session.getAttribute("dob");

		System.out.print(Rotp+EnterOtp+Rvid);
		if(Rotp.equals(EnterOtp)) {
			System.out.print("user is Authentified!");
			 request.getRequestDispatcher("Details.jsp").forward(request, response);
		}
		else {
			System.out.print("user is not Authentified?");
		}
		
	}

}
