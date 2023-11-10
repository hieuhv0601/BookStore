package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BooksDAO;
import com.bookstore.dao.OrdersDAO;
import com.bookstore.dao.ReviewsDAO;
import com.bookstore.dao.UsersDAO;
import com.bookstore.model.Orders;
import com.bookstore.model.Reviews;

@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminHomeServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		OrdersDAO orderDAO = new OrdersDAO();
//		ReviewsDAO reviewDAO = new ReviewsDAO();
		UsersDAO userDAO = new UsersDAO();
		BooksDAO bookDAO = new BooksDAO();
//
//		List<Orders> listMostRecentSales = orderDAO.listMostRecentSales();
//		List<Reviews> listMostRecentReviews = reviewDAO.listMostRecent();

		long totalUsers = userDAO.count();
		long totalBooks = bookDAO.count();
//		long totalReviews = reviewDAO.count();
//		long totalOrders = orderDAO.count();
//
//		request.setAttribute("listMostRecentSales", listMostRecentSales);
//		request.setAttribute("listMostRecentReviews", listMostRecentReviews);

		request.setAttribute("totalUsers", totalUsers);
		request.setAttribute("totalBooks", totalBooks);
//		request.setAttribute("totalReviews", totalReviews);
//		request.setAttribute("totalOrders", totalOrders);

		String homepage = "index.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(homepage);
		dispatch.forward(request, response);
	}

}
