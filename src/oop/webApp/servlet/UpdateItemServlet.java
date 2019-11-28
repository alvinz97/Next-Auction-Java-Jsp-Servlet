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

@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UpdateItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		Item item = new Item();
		String itemID = request.getParameter("itemNo");	
		item.setItemNo(itemID);
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
		iItemService.updateItem(itemID, item);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/landPage.jsp");
		dispatcher.forward(request, response);
	}
}
