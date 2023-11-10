package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.bookstore.dao.BookImagesDAO;
import com.bookstore.dao.BooksDAO;
import com.bookstore.dao.CategoriesDAO;
import com.bookstore.model.BookImages;
import com.bookstore.model.Books;
import com.bookstore.model.Categories;

import com.bookstore.common.*;
import com.bookstore.common.utils.SlugGenerator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class BookServices {
	private BooksDAO bookDAO;
	private CategoriesDAO categoryDAO;
	private BookImagesDAO bookImagesDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BooksDAO();
		bookImagesDAO = new BookImagesDAO();
		categoryDAO = new CategoriesDAO();
	}

	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}

	public void listBooks(String message) throws ServletException, IOException {
		List<Books> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);

		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "books_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	private void forwardToPage(String page) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
	}

	public void showBookNewForm() throws ServletException, IOException {
		List<Categories> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);

		String newPage = "books_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}

	public void createBook() throws ServletException, IOException {
		BookImages bookImage = new BookImages();
		String title = request.getParameter("title");
		String slug = SlugGenerator.generateSlug(title);
		String author = request.getParameter("author");
		String isbn = request.getParameter("isbn");
		String description = request.getParameter("description");
		System.out.println("Descript tion check: " + description );
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		Categories category = categoryDAO.get(categoryId);
		float price = Float.parseFloat(request.getParameter("price"));
		String publishDateStr = request.getParameter("publishDate");

		// You can parse the publishDateStr to a Date object if needed
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(publishDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			// Handle parsing error if necessary
		}

		Books exitsBook = bookDAO.findBySlug(slug);
		if (exitsBook != null) {
			String message = "Could not create new book. A book with slug " + slug + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Books newBook = new Books(title, author, description, slug, isbn, price);
			newBook.setCategories(category);
			newBook.setPublishDate(publishDate);
			newBook.setCreatedAt(new java.util.Date());
			newBook.setModifiedAt(new java.util.Date());
			// Save the newBook in the database
			bookDAO.create(newBook);

			Part part = request.getPart("bookImage");

			if (part != null && part.getSize() > 0) {
				long size = part.getSize();
				byte[] imageBytes = new byte[(int) size];
				InputStream inputStream = part.getInputStream();
				inputStream.read(imageBytes);
				inputStream.close();
				bookImage.setBooks(newBook);
				bookImage.setBookImg(imageBytes);

				// Save the bookImage in the database
				bookImagesDAO.create(bookImage);

			}
			listBooks("New category create successfully");
		}

	}

	public void editBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Books book = bookDAO.get(bookId);
		List<Categories> listCategory = categoryDAO.listAll();

		request.setAttribute("book", book);
		request.setAttribute("listCategory", listCategory);

		String editPage = "books_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateBook() throws ServletException, IOException {
	    Integer bookId = Integer.parseInt(request.getParameter("bookId"));
	    Books existingBook = bookDAO.get(bookId);

	    if (existingBook != null) {
	        // Retrieve the book details from the form
	        String title = request.getParameter("title");
	        String author = request.getParameter("author");
	        String isbn = request.getParameter("isbn");
	        String description = request.getParameter("description");
	        Integer categoryId = Integer.parseInt(request.getParameter("category"));
	        Categories category = categoryDAO.get(categoryId);
	        float price = Float.parseFloat(request.getParameter("price"));
	        String publishDateStr = request.getParameter("publishDate");

	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date publishDate = null;
	        try {
	            publishDate = dateFormat.parse(publishDateStr);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            // Handle parsing error if necessary
	        }

	        // Check if a book with the same title already exists (case-insensitive comparison)
	        Books bookByTitle = bookDAO.findByTitle(title);

	        if (bookByTitle != null && !existingBook.getTitle().equals(bookByTitle.getTitle())) {
	            String message = "Could not update book because there's another book having the same title.";
	            listBooks(message);
	            return;
	        }

	        // Update the book details
	        existingBook.setTitle(title);
	        existingBook.setAuthor(author);
	        existingBook.setIsbn(isbn);
	        existingBook.setDescription(description);
	        existingBook.setCategories(category);
	        existingBook.setPrice(price);
	        existingBook.setModifiedAt(new java.util.Date());
	        existingBook.setPublishDate(publishDate);
	        // Update the book in the database
	        bookDAO.update(existingBook);

	        Part part = request.getPart("bookImage");
	        BookImages bookImage = bookImagesDAO.findByBookId(existingBook.getBookId());

	        // If no bookImage exists, create a new one
	        if (bookImage == null) {
	            bookImage = new BookImages();
	            bookImage.setBooks(existingBook);
	        }

	        if (part != null && part.getSize() > 0) {
	            long size = part.getSize();
	            byte[] imageBytes = new byte[(int) size];
	            InputStream inputStream = part.getInputStream();
	            inputStream.read(imageBytes);
	            inputStream.close();
	            bookImage.setBookImg(imageBytes);

	            // Save the bookImage in the database
	            bookImagesDAO.update(bookImage);
	        }

	        String message = "The book has been updated successfully.";
	        listBooks(message);
	    }
	}


	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Books existingBook = bookDAO.get(bookId);

		// First, get and delete the associated BookImages
		BookImages bookImage = bookImagesDAO.findByBookId(existingBook.getBookId());
		if (bookImage != null) {
			bookImagesDAO.delete(bookImage.getImageId());
		}

		// Now that the related images are deleted, you can safely delete the book
		bookDAO.delete(bookId);

		String message = "The book has been deleted successfully.";
		listBooks(message);
	}

	public void listBooksByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<Books> listBooks = bookDAO.listByCategory(categoryId);
		List<Categories> categoriesList = categoryDAO.listAll();
		Categories category = categoryDAO.get(categoryId);

		request.setAttribute("listBooks", listBooks);
		request.setAttribute("category", category);
		request.setAttribute("categoriesList", categoriesList);

		String listPage = "client/books_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewBookDetail() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Books book = bookDAO.get(bookId);
		List<Categories> categoriesList = categoryDAO.listAll();
		request.setAttribute("categoriesList", categoriesList);

		request.setAttribute("book", book);

		String detailPage = "client/book_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Books> result = null;
		if (keyword.equals("")) {
			result = bookDAO.listAll();
		} else {
			result = bookDAO.search(keyword);
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);

		String resultPage = "client/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}