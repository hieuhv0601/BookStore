package com.bookstore.service;

import static com.bookstore.common.Utitlity.forwardToPage;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BooksDAO;

import com.bookstore.dao.ShoppingCartDAO;
import com.bookstore.dao.UsersDAO;

import com.bookstore.model.Books;
import com.bookstore.model.ShoppingCart;
import com.bookstore.model.Users;


public class ShoppingCartServices {
	private BooksDAO bookDAO;
	private ShoppingCartDAO shoppingCartDAO;
	private UsersDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public ShoppingCartServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BooksDAO();
		userDAO = new UsersDAO();
		shoppingCartDAO = new ShoppingCartDAO();
	}

	public void listItems() throws ServletException, IOException {
		listItems(null);
	}

	public void listItems(String message) throws ServletException, IOException {
	    Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
	    List<ShoppingCart> listItems = shoppingCartDAO.listByUser(customer);

	    // Store the cart items in a session attribute
	    request.getSession().setAttribute("listItems", listItems);
	    request.getSession().setAttribute("cartItems", listItems);

	    if (message != null) {
	        request.setAttribute("message", message);
	    }

	    String listPage = "client/shopping_cart.jsp";
	    RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
	    requestDispatcher.forward(request, response);
	}



	public void addItemToCart() throws ServletException, IOException {
	    Integer bookId = Integer.parseInt(request.getParameter("book_id"));
	    Integer quantity = Integer.parseInt(request.getParameter("quantity"));

	    Books book = bookDAO.get(bookId);
	    Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
	    ShoppingCart existingCartItem = shoppingCartDAO.findItem(book, customer);

	    if (existingCartItem != null) {
	        // If the book already exists in the cart, update the quantity
	        int newQuantity = existingCartItem.getQuantity() + quantity;
	        existingCartItem.setQuantity(newQuantity);
	        existingCartItem.setUpdatedAt(new java.util.Date());
	        shoppingCartDAO.update(existingCartItem);
	    } else {
	        // If the book doesn't exist in the cart, create a new ShoppingCart item
	        ShoppingCart newBookInCart = new ShoppingCart(book, customer, quantity);
	        newBookInCart.setCreatedAt(new java.util.Date());
	        newBookInCart.setUpdatedAt(new java.util.Date());
	        // Save the newBook in the database
	        shoppingCartDAO.create(newBookInCart);
	    }
	    
	    listItems("Item added to the cart successfully.");
	}

	public void updateCartItem() throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("cartItemId"));
		int quantity = Integer.parseInt(request.getParameter("newQuantity"));
		System.out.println("Kiem tra cartId:" + itemId);
		
		ShoppingCart updateItem = shoppingCartDAO.get(itemId);
		updateItem.setQuantity(quantity);
		
		shoppingCartDAO.update(updateItem);
		String message = "The book has been updated successfully.";
		listItems(message);
	}
	
	public void deleteBook() throws ServletException, IOException {
	    String[] selectedItems = request.getParameterValues("selectedItems");
	    Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
	   
	    if (selectedItems != null) {
	        for (String selectedItem : selectedItems) {
	        	int select = Integer.parseInt(selectedItem);
	            System.out.println("Selected Item: " + select);
	            System.out.println("Customer ID: " + customer.getUserId());            
	            if (selectedItem != null) {
	                shoppingCartDAO.delete(select);
	            }
	        }

	        listItems("Selected items removed successfully");
	    } else {
	        listItems("No items selected for deletion.");
	    }
	}

	
	
}
