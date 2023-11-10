package com.bookstore.service;

import static com.bookstore.common.Utitlity.forwardToPage;
import static com.bookstore.common.Utitlity.showMessageFrontend;

import java.io.IOException;

import java.util.List;

import com.bookstore.common.CommonUtility;
import com.bookstore.common.authen.RoleUtils;
import com.bookstore.common.utils.HashGenerator;
import com.bookstore.dao.BooksDAO;
import com.bookstore.dao.CategoriesDAO;

import com.bookstore.dao.UserAddressDAO;
import com.bookstore.dao.UserRolesDAO;
import com.bookstore.dao.UsersDAO;

import com.bookstore.model.Books;
import com.bookstore.model.Categories;

import com.bookstore.model.UserAddress;
import com.bookstore.model.UserRoles;
import com.bookstore.model.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServices {

	private UsersDAO userDAO;
	private UserRolesDAO userRoleDAO;
	private UserAddressDAO userAddressDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		userDAO = new UsersDAO();
		userRoleDAO = new UserRolesDAO();
		userAddressDAO = new UserAddressDAO();
	}

	public void listUsers() throws ServletException, IOException {
		listUsers(null);
	}

	public void listUsers(String message) throws ServletException, IOException {
		List<Users> userList = userDAO.listAll();
		String listPage = "users_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);

		request.setAttribute("userList", userList);
		if (message != null) {
			request.setAttribute("message", message);
		}

		requestDispatcher.forward(request, response);
	}

	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("telephone");
		UserRoles userRole = new UserRoles();
		String role = request.getParameter("role");

		Users exitsUser = userDAO.findByEmail(email);
		if (exitsUser != null) {
			String message = "Could not create user. A user with email " + email + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Users newUser = new Users(username, password, firstName, lastName, email, phoneNumber);
			newUser.setCreatedAt(new java.util.Date());
			newUser.setModifiedAt(new java.util.Date());
			newUser.setIsBanned(false);
			userDAO.create(newUser);

			userRole.setUsers(newUser);
			userRole.setRole(role);
			userRoleDAO.create(userRole);
			listUsers("New user create successfully");
		}

	}

	public void editUser() throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("id"));

		String editPage = "user_form.jsp";

		Users editUser = userDAO.get(userId);

		request.setAttribute("user", editUser);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);

	}

	public void updateUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String telephone = request.getParameter("telephone");
		UserRoles userRole = userRoleDAO.findByUserId(userId);
		String role = request.getParameter("role");
		String message = "User has been updated successfully";

		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);
		Users userByTelephone = userDAO.findByTelephone(telephone);

		// Validate the email and telephone
		if (!validateUserUpdate(userByEmail, userByTelephone, userById)) {
			return;
		}

		Users updateUser = new Users(userId, username, password, firstName, lastName, email, telephone);
		updateUser.setCreatedAt(userById.getCreatedAt());
		updateUser.setModifiedAt(new java.util.Date());
		updateUser.setIsBanned(false);
		userDAO.update(updateUser);
		userRole.setRole(role);
		userRoleDAO.update(userRole);
		listUsers(message);
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		String message = "User has been deleted successfully";

		// First, get and delete the associated BookImages
		UserRoles userRole = userRoleDAO.findByUserId(userId);
		if (userRole != null) {
			userRoleDAO.delete(userRole.getRoleId());
		}
		userDAO.delete(userId);
		listUsers(message);
	}

	// Separate method to validate user updates
	public boolean validateUserUpdate(Users userByEmail, Users userByTelephone, Users userById) {
		if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			String message = "Could not update user. Email" + userByEmail.getEmail() + "is already in use.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			try {
				requestDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace(); // Handle or log the exception
			}
			return false;
		} else if (userByTelephone != null && userByTelephone.getUserId() != userById.getUserId()) {
			String message = "Could not update user." + userByEmail.getTelephone() + " Telephone is already in use.";
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

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("telephone");
		UserRoles userRole = new UserRoles();
		String role = "customer";

		Users existUser = userDAO.findByEmail(email);
		String message = "";

		if (existUser != null) {
			message = "The email " + email + " is already.";
		} else {

			Users newCustomer = new Users(username, password, firstName, lastName, email, phoneNumber);
			newCustomer.setCreatedAt(new java.util.Date());
			newCustomer.setModifiedAt(new java.util.Date());
			newCustomer.setIsBanned(false);

//			updateCustomerFieldsFromForm(newCustomer);

			userDAO.create(newCustomer);
			userRole.setUsers(newCustomer);
			userRole.setRole(role);
			userRoleDAO.create(userRole);
			message = "You have registered successfully!";
		}

		showMessageFrontend(message, request, response);
	}

//	public void login() throws ServletException, IOException {
//	    String email = request.getParameter("email");
//	    String password = request.getParameter("password");
//
//	    Users user = userDAO.findByEmail(email);
//
//	    if (user != null && user.getPassword().equals(password)) {
//	        String adminRedirect = determineRedirectURL(user);
//	        if (adminRedirect != null) {
//	            request.getSession().setAttribute("useremail", email);
//	            request.getSession().setAttribute("username", user.getUsername());
//	            response.sendRedirect(request.getContextPath() + adminRedirect);
//	            return;
//	        }
//	    }
//
//	    // Login failed, show a message and redirect to the login page
//	    String message = "Login failed!";
//	    request.setAttribute("message", message);
//	    response.sendRedirect(request.getContextPath() + "/login?error=true");
//	}

//	private String determineRedirectURL(Users user) {
//		for (UserRoles userRole : user.getUserRoleses()) {
//			if ("admin".equals(userRole.getRole())) {
//				return "/admin/";
//			} else if ("customer".equals(userRole.getRole())) {
//				// Set a flag to indicate that the customer logged in from the login page
//				request.getSession().setAttribute("is_from_login", true);
//				return "/"; // Return null for customer role
//			}
//		}
//		return null; // Return null if no role is determined
//	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Users user = userDAO.findByEmail(email);

		if (user != null && user.getPassword().equals(password)) {
			// Check if the user has an admin role
			for (UserRoles userRole : user.getUserRoleses()) {
				if ("admin".equals(userRole.getRole())) {
					// The user has an admin role, grant access
					request.getSession().setAttribute("useremail", email);
					// Store the user's name in the session
					request.getSession().setAttribute("username", user.getUsername());
					request.getSession().setAttribute("userRole", "admin");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
					dispatcher.forward(request, response);
					return;

				}

				else {
					// If the user doesn't have an admin role or login fails, show a message and
					// redirect to the login page
					String message = "Login failed!";
					request.setAttribute("message", message);
					response.sendRedirect("login/")	;
				}
			}
		}

	}

	public void showLogin() throws ServletException, IOException {
		forwardToPage("client/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Users customer = userDAO.checkLogin(email, password);

		if (customer != null && customer.getPassword().equals(password)) {
			// Check if the user has an customer role
			for (UserRoles userRole : customer.getUserRoleses()) {
				if ("customer".equals(userRole.getRole())) {
					
					// The user has an customer role, grant access
					session.setAttribute("useremail", email);
					// Store the user's name in the session
					session.setAttribute("username", customer.getUsername());

					RoleUtils.setEncryptedRoleInSession(session, userRole.getRole());
					session.setAttribute("loggedCustomer", customer);

					Object objRedirectURL = session.getAttribute("redirectURL");

					if (objRedirectURL != null) {
						String redirectURL = (String) objRedirectURL;
						session.removeAttribute("redirectURL");
						response.sendRedirect(redirectURL);
					} else {
						showHomepage();
					}
				} else if ("admin".equals(userRole.getRole())) {
					// Assuming that `email` is the user's email, `customer` is the user object,
					// and `userRole` is the user's role.

					session.setAttribute("useremail", email);
					session.setAttribute("username", customer.getUsername());

					// Use RoleUtils to securely set the user's role in the session
					RoleUtils.setEncryptedRoleInSession(session, userRole.getRole());
					response.sendRedirect("admin/");
					return;
				} else {
					// If the user doesn't have an customer role or login fails, show a message and
					// redirect to the login page
					String message = "Login failed!";
					request.setAttribute("message", message);
					RequestDispatcher dispatcher = request.getRequestDispatcher("client/login.jsp");
					dispatcher.forward(request, response);
				}
			}
		}

	}

	public void showHomepage() throws ServletException, IOException {
	    String homePage = "client/index.jsp";

	    CategoriesDAO categoryDAO = new CategoriesDAO();
	    BooksDAO booksDAO = new BooksDAO();

	    List<Categories> categoriesList = categoryDAO.listAll();
//	    List<Books> booksList = booksDAO.listAll();
	    List<Books> newBooksList = booksDAO.listNewBooks();
	    List<Books> listBestSellingBooks = booksDAO.listBestSellingBooks();
	    
//	    // Retrieve the best-selling book IDs
//	    List<Integer> listBestSellingBooks = booksDAO.listBestSellingBooks();
//
//	    // Create a list to store the best-selling books
//	    List<Books> bestSellingBooksList = new ArrayList<>();
//
//	    // Check if each best-selling book ID is in the booksList and add it to the bestSellingBooksList
//	    for (Integer bookId : listBestSellingBooks) {
//	        for (Books book : booksList) {
//	            if (book.getBookId() == bookId) {
//	                bestSellingBooksList.add(book);
//	                break;
//	            }
//	        }
//	    }

	    request.getSession().setAttribute("categoriesList", categoriesList);
	    request.setAttribute("newBooksList", newBooksList);
	    request.setAttribute("listBestSellingBooks", listBestSellingBooks);
	    // Pass the best-selling books list to the JSP
//	    request.setAttribute("bestSellingBooksList", bestSellingBooksList);

	    forwardToPage(homePage, request, response);
	}


	
	public void showCustomerProfile() throws ServletException, IOException {
		forwardToPage("client/view_user_info.jsp", request, response);
	}

	public void showCustomerAddress() throws ServletException, IOException {
		CommonUtility.loadCountryList(request);
		forwardToPage("client/view_user_address.jsp", request, response);
	}

	
	private void updateCustomerFieldsFromForm(Users customer) {
		int customerId = customer.getUserId();
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("telephone");

		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String postalCode = request.getParameter("postalCode");
		String country = request.getParameter("country");
		String message = "";

		System.out.println("customerId: " + customerId);
		System.out.println("email: " + email);
		System.out.println("firstName: " + firstName);
		System.out.println("lastName: " + lastName);
		System.out.println("password: " + password);
		System.out.println("phoneNumber: " + phoneNumber);

		// Bug
		System.out.println("addressLine1: " + addressLine1);
		System.out.println("addressLine2: " + addressLine2);

		System.out.println("street: " + street);
		System.out.println("city: " + city);
		System.out.println("state: " + state);

		// Bug
		System.out.println("postalCode: " + postalCode);
		System.out.println("country: " + country);

		request.setAttribute("message", message);
		if (email == null && email.equals("")) {
			message = "Email cannot be null";
		} else if (userDAO.findByEmail(email).getEmail().equals(email)) {
			message = "Could not update user. Email" + email + "is already in use.";
		} else {
			customer.setEmail(email);
		}
		Users updateCustomer = new Users(customerId, customer.getUsername(), password, firstName, lastName, email,
				phoneNumber);
//		userDAO.update(updateCustomer);
		if (password != null && !password.isEmpty()) {
			String encryptPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptPassword);
		}

		UserAddress userAddress = new UserAddress(updateCustomer, addressLine1, addressLine2, street, city, state,
				country, postalCode, phoneNumber);
		userAddressDAO.create(userAddress);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		userDAO.update(customer);

		showCustomerProfile();

	}

	public void newCustomer() throws ServletException, IOException {
		CommonUtility.loadCountryList(request);

		String customerForm = "customer_form.jsp";
		request.getRequestDispatcher(customerForm).forward(request, response);

	}

}
