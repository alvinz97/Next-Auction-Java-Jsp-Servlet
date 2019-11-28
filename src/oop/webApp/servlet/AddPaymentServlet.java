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

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public AddPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		response.setContentType("text/html");
		
		Payment payment = new Payment();
		
		payment.setCardNo(request.getParameter("cardNo"));
		payment.setCusName(request.getParameter("cusName"));
		payment.setExpiryDate(request.getParameter("expiryDate"));
		payment.setCvv(request.getParameter("cvv"));
		payment.setEmail(request.getParameter("email"));
		payment.setAmount(request.getParameter("amount"));
		payment.setPhone(request.getParameter("phone"));
		
		IPaymentService iPaymentService = new PaymentServiceImpl();
		iPaymentService.addPayment(payment);
		
		request.setAttribute("payment", payment);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/paymentList.jsp");
		requestDispatcher.forward(request, response);
	}

}
