package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListCategoryServlet")
public class ListCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListCategoryServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/deleteCategory.jsp");
		requestDispatcher.forward(request, response);
		
	}

}
