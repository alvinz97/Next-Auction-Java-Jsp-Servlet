package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.service.IRegisterService;
import oop.webApp.service.RegisterServiceImpl;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		String userID = request.getParameter("uId");
		IRegisterService iRegisterService = new RegisterServiceImpl();
		iRegisterService.removeUser(userID);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user.jsp");
		dispatcher.forward(request, response);
	}

}
