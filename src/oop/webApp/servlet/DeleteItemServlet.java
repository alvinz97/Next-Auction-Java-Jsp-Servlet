package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.service.ItemServiceImpl;
import oop.webApp.service.IItemService;


@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1871871796669342804L;

	public DeleteItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String itemID = request.getParameter("itemNo");			
		
		IItemService iItemService = new ItemServiceImpl();
		iItemService.removeItem(itemID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/landPage.jsp");
		dispatcher.forward(request, response);
	}

}
