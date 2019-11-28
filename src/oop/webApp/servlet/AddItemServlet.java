package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.model.Item;
import oop.webApp.service.ItemServiceImpl;
import oop.webApp.service.IItemService;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AddItemServlet")
public class AddItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddItemServlet() {
		super();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		Item item = new Item();
		
		item.setTitle(request.getParameter("title"));
		item.setCategory(request.getParameter("category"));
		item.setCondition(request.getParameter("condition"));
		item.setBrand(request.getParameter("brand"));
		item.setColor(request.getParameter("color"));
		item.setStartDate(request.getParameter("startDate"));
		item.setEndDate(request.getParameter("endDate"));
		item.setStartPrice(request.getParameter("startingPrice"));
		item.setBuyPrice(request.getParameter("buyPrice"));
		item.setReservePrice(request.getParameter("reservePrice"));
		item.setDesc(request.getParameter("desc"));

		IItemService iItemService = new ItemServiceImpl();
		iItemService.addItem(item);

		request.setAttribute("item", item);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/landPage.jsp");
		dispatcher.forward(request, response);
	}
}
