package com.bookstore.controller.client.shoppingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ShoppingCartServices;

/**
 * Servlet implementation class RemoveBookFromCartServlet
 */
@WebServlet("/delete_from_cart")
public class DeleteBookFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	ShoppingCartServices cartServices = new ShoppingCartServices(request, response);
		cartServices.deleteBook();
	}


}
