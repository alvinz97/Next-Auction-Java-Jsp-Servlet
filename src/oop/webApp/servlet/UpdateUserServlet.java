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

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		RegisterBean registerBean = new RegisterBean();
		String userID = request.getParameter("uId");
		registerBean.setuId(userID);
		registerBean.setuName(request.getParameter("name"));
		registerBean.setuMail(request.getParameter("email"));
		registerBean.setuPass(request.getParameter("pass"));
		registerBean.setuR_Pass(request.getParameter("re_pass"));
		
		IRegisterService iRegisterService = new RegisterServiceImpl();
		iRegisterService.updateUser(userID, registerBean);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user.jsp");
		dispatcher.forward(request, response);
	}

}
