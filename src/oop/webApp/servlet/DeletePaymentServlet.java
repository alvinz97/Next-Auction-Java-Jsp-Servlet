package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.service.IPaymentService;
import oop.webApp.service.PaymentServiceImpl;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletePaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		String paymentID = request.getParameter("id");
		IPaymentService iPaymentService = new PaymentServiceImpl();
		iPaymentService.removePayment(paymentID);
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/paymentList.jsp");
		requestDispatcher.forward(request, response);
	}

}
