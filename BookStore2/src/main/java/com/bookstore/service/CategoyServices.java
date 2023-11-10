package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import com.bookstore.dao.CategoriesDAO;

import com.bookstore.model.Categories;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoyServices {

	private CategoriesDAO categoriesDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoyServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		categoriesDAO = new CategoriesDAO();
	}

	public void listCategories() throws ServletException, IOException {
		listCategories(null);
	}

	public void listCategories(String message) throws ServletException, IOException {
		List<Categories> categoriesList = categoriesDAO.listAll();
		String listCategoriesPage = "categories_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listCategoriesPage);

		request.setAttribute("categoriesList", categoriesList);
		if (message != null) {
			request.setAttribute("message", message);
		}

		requestDispatcher.forward(request, response);
	}

	public void createCategory() throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");
		String categorySlug = request.getParameter("categorySlug");
		System.out.println("categoryName" + categoryName);
		System.out.println("categorySlug" + categorySlug);
		
		Categories exitsCategory = categoriesDAO.findByCategorySlug(categorySlug);
		if (exitsCategory != null) {
			String message = "Could not create new category. A category with slug " + categorySlug + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Categories newCategories = new Categories(categoryName,categorySlug);
			newCategories.setCreatedAt(new java.util.Date());
			newCategories.setModifiedAt(new java.util.Date());
			categoriesDAO.create(newCategories);
			listCategories("New category create successfully");
		}

	}

	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		
		String editCategoryPage = "category_form.jsp";
		Categories editCategory = categoriesDAO.get(categoryId);

		request.setAttribute("category", editCategory);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editCategoryPage);
		requestDispatcher.forward(request, response);

	}

	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		System.out.println(categoryId);
		
		String categoryName = request.getParameter("categoryName");
		String categorySlug = request.getParameter("categorySlug");
		
		String message = "Category has been updated successfully";
		
		Categories categoryById = categoriesDAO.get(categoryId);
		Categories categoryByName = categoriesDAO.findByCategoryName(categoryName);
		Categories categoryBySlug = categoriesDAO.findByCategorySlug(categorySlug);

		// Validate the email and telephone
		if (!validateCategoryUpdate(categoryByName, categoryBySlug, categoryById)) {
			return;
		}

		Categories updateCategory = new Categories(categoryId,categoryName,categorySlug);
		updateCategory.setCreatedAt(categoryById.getCreatedAt());
		updateCategory.setModifiedAt(new java.util.Date());

		categoriesDAO.update(updateCategory);
		listCategories(message);
	}


	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		String message = "Category has been deleted successfully";
		categoriesDAO.delete(categoryId);
		listCategories(message);
	}

	// Separate method to validate category updates
	// Separate method to validate category updates
	public boolean validateCategoryUpdate(Categories categoryByName, Categories categoryBySlug, Categories categoryById) {
		if (categoryByName != null && categoryByName.getCategoryId() != categoryById.getCategoryId()) {
			String message = "Could not update category. Name" + categoryByName.getCategoryName() + "is already in use.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			try {
				requestDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace(); // Handle or log the exception
			}
			return false;
		} else if (categoryBySlug != null && categoryBySlug.getCategoryId() != categoryById.getCategoryId()) {
			String message = "Could not update category." + categoryByName.getCategorySlug() + " Slug is already in use.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			try {
				requestDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace(); // Handle or log the exception
			}
			return false;
		}
		return true;
	}
}
