package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.service.CategoryServiceImpl;
import oop.webApp.service.ICategoryService;

@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteCategoryServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String categoryID = request.getParameter("catNo");
		ICategoryService iCategoryService = new CategoryServiceImpl();
		iCategoryService.removeCategory(categoryID);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/deleteCategory.jsp");
		dispatcher.forward(request, response);
	}

}
