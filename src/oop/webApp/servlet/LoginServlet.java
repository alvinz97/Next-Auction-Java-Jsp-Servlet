package oop.webApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oop.webApp.model.LoginBean;
import oop.webApp.service.LoginDea;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginDea loginDea;
	
	public void init() {
		loginDea = new LoginDea();
	} 

    public LoginServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String uName = request.getParameter("your_name");
		String uPass = request.getParameter("your_pass");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setuName(uName);
		loginBean.setuPass(uPass);
		
//		LoginDea loginDea = new LoginDea();
		String unRegistered = null;
//		
//		if (unRegistered.equals("FALSE")) {
//		}
//		
		
		try {
			if (loginDea.validate(loginBean)) {
				//HttpSession session = request.getSession();
                // session.setAttribute("username",username);
				HttpSession session = request.getSession(false);
				if (session !=null) {
					String uName1 = (String)session.getAttribute("uName");
					out.print("Hello " + uName1);
				}
				response.sendRedirect("user.jsp");
			}else {
//				session.setAttribute("user", uName);
//                response.sendRedirect("login.jsp");
				request.setAttribute("errMessage", unRegistered);
				request.getRequestDispatcher("invalidLogin.jsp").forward(request, response);

				out.print("Invalid");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
//		
//		
//		String userLogged = null;
//		
//		if (LoginDea.validate(uName, uPass)) {
//			request.getRequestDispatcher("user.jsp").forward(request, response);
//		}else {
//			String errMessage = "Sorry, Username or Password Error";
//			request.setAttribute(errMessage, userLogged);
//			request.getRequestDispatcher("login.jsp").forward(request, response);
//		}
//		out.close();
	}
}
