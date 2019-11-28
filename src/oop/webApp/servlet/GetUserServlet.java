package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.model.RegisterBean;
import oop.webApp.service.IRegisterService;
import oop.webApp.service.RegisterServiceImpl;

@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		String userID = request.getParameter("uId");
		IRegisterService iRegisterService = new RegisterServiceImpl();
		RegisterBean registerBean = iRegisterService.getUserByID(userID);
		
		request.setAttribute("user", registerBean);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/updateUser.jsp");
		requestDispatcher.forward(request, response);
	}

}
