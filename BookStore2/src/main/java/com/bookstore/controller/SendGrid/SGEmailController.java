package com.bookstore.controller.SendGrid;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

/**
 * Servlet implementation class SGEmail
 */
@WebServlet("/email")
public class SGEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SGEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Email from = new Email("BookStore");
		String email = request.getParameter("email");
		System.out.println("Kiem tra emai: " + email);
		String fullName = request.getParameter("fullName");
		float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
		String message = String.format("--------Your Invoice Detail--------\n Customer: %s \n Total Amount: %f", fullName,totalAmount);
		System.out.println("Kiem tra emai: " + message);
		Email to = new Email(email);
		Content content = new Content("text/plain",message);
		Mail mail = new Mail(from,"Welcome to BookStore",to,content);
		SendGrid sg = new SendGrid("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");
		Request req = new Request();
		try {
			req.setMethod(Method.POST);
			req.setEndpoint("mail/send");
			req.setBody(mail.build());
			Response res = sg.api(req);
			System.out.println("Send");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
