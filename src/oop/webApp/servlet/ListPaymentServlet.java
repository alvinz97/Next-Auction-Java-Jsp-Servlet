package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ListPaymentServlet")
public class ListPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/paymentList.jsp");
		requestDispatcher.forward(request, response);
	}

}
