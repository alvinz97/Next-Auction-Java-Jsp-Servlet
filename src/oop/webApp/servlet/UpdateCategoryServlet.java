package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.model.Category;
import oop.webApp.service.CategoryServiceImpl;
import oop.webApp.service.ICategoryService;


@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateCategoryServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Category category = new Category();
		String categoryID = request.getParameter("catNo");
		category.setCatNo(categoryID);
		category.setCatName(request.getParameter("catName"));
		category.setSubName(request.getParameter("subName"));
		
		ICategoryService iCategoryService = new CategoryServiceImpl();
		iCategoryService.updateCategory(categoryID, category);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/deleteCategory.jsp");
		dispatcher.forward(request, response);
	}

}
