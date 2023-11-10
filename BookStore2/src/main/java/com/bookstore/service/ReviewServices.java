package com.bookstore.service;

import static com.bookstore.common.Utitlity.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.BooksDAO;
import com.bookstore.dao.ReviewsDAO;
import com.bookstore.model.Books;
import com.bookstore.model.Users;
import com.bookstore.model.Reviews;

public class ReviewServices {
	private ReviewsDAO reviewDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.reviewDAO = new ReviewsDAO();
	}
	
	public void listAllReview() throws ServletException, IOException {
		listAllReview(null);
	}
	
	public void listAllReview(String message) throws ServletException, IOException {
		List<Reviews> listReviews = reviewDAO.listAll();
		
		request.setAttribute("listReviews", listReviews);
		forwardToPage("review_list.jsp", message, request, response);		
	}

	public void editReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Reviews review = reviewDAO.get(reviewId);
		
		if (review != null) {		
			request.setAttribute("review", review);		
			forwardToPage("review_form.jsp", request, response);
		} else {
			String message = "Could not find review with ID " + reviewId;
			showMessageBackend(message, request, response);
		}
	}
	
	public void updateReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Reviews review = reviewDAO.get(reviewId);
		review.setHeadline(headline);
		review.setComment(comment);
		
		reviewDAO.update(review);
		
		String message = "The review has been updated successfully.";
		
		listAllReview(message);
		
	}
	
	public void deleteReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Reviews review = reviewDAO.get(reviewId);
		
		if (review != null) {
			reviewDAO.delete(reviewId);
			String message = "The review has been deleted successfully.";
			listAllReview(message);
		} else {
			String message = "Could you find review with ID " + reviewId
					+ ", or it might have been deleted by another admin";
			showMessageBackend(message, request, response);
		}		
	}

	public void showReviewForm() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));
		BooksDAO bookDao = new BooksDAO();
		Books book = bookDao.get(bookId);
		
		HttpSession session = request.getSession(); 
		session.setAttribute("book", book);
		
		Users customer = (Users) session.getAttribute("loggedCustomer");
		
		Reviews existReview = reviewDAO.findByCustomerAndBook(customer.getUserId(), bookId);
		
		String targetPage = "client/review_form.jsp";
		
		if (existReview != null) {
			request.setAttribute("review", existReview);
			targetPage = "client/review_info.jsp";
		}

		forwardToPage(targetPage, request, response);	
	}

	public void submitReview() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		Integer rating = Integer.parseInt(request.getParameter("rating"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Reviews newReview = new Reviews();
		newReview.setHeadline(headline);
		newReview.setComment(comment);
		newReview.setRating(rating);
		newReview.setCreatedAt(new java.util.Date());
		newReview.setUpdatedAt(new java.util.Date());
		newReview.setVerified(true);
		Books book = new Books();
		book.setBookId(bookId);
		newReview.setBooks(book);
		
		Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
		newReview.setUsers(customer);
		
		reviewDAO.create(newReview);
		
		forwardToPage("client/review_done.jsp", request, response);		
	}

}
