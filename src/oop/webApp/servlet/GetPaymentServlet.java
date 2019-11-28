package oop.webApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oop.webApp.model.Payment;
import oop.webApp.service.IPaymentService;
import oop.webApp.service.PaymentServiceImpl;

@WebServlet("/GetPaymentServlet")
public class GetPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		String paymentID = request.getParameter("id");
		IPaymentService iPaymentService = new PaymentServiceImpl();
		Payment payment = iPaymentService.getPaymentByID(paymentID);
		
		request.setAttribute("payment", payment);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/updatePayment.jsp");
		requestDispatcher.forward(request, response);
	}

}
