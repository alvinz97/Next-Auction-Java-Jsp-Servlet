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

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		Category category = new Category();
		
		category.setCatName(request.getParameter("catName"));
		category.setSubName(request.getParameter("subName"));
		
		ICategoryService iCategoryService = new CategoryServiceImpl();
		iCategoryService.addCategory(category);
		
		request.setAttribute("category", category);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/deleteCategory.jsp");
		requestDispatcher.forward(request, response);
	}

}
