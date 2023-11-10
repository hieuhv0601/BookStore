package com.bookstore.service;

import static com.bookstore.common.Utitlity.forwardToPage;
import static com.bookstore.common.Utitlity.showMessageBackend;
import static com.bookstore.common.Utitlity.showMessageFrontend;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.bookstore.common.CommonUtility;
import com.bookstore.common.OrderUpdateEndpoint;
import com.bookstore.common.utils.UniqueTrackingNumberGenerator;
import com.bookstore.dao.OrderDetailsDAO;
import com.bookstore.dao.OrdersDAO;
import com.bookstore.dao.ShippingDAO;
import com.bookstore.dao.ShoppingCartDAO;
import com.bookstore.dao.TransportUnitDAO;
import com.bookstore.dao.UsersDAO;
import com.bookstore.dao.WarehouseDAO;
import com.bookstore.model.ShoppingCart;
import com.bookstore.model.UserAddress;
import com.bookstore.model.Books;
import com.bookstore.model.Orders;
import com.bookstore.model.Shipping;
import com.bookstore.model.Users;
import com.bookstore.model.Warehouse;

import com.bookstore.model.jsonModels.WSOrderToast;
import com.bookstore.model.OrderDetails;
import com.bookstore.model.TransportUnit;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class OrderServices {
	private OrdersDAO orderDAO;
	private OrderDetailsDAO orderDetailDAO;
	private UsersDAO userDAO;
	private ShoppingCartDAO shoppingCartDAO;
	private TransportUnitDAO transportUnitDAO;
	private ShippingDAO shippingDAO;
	private WarehouseDAO warehouseDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.orderDAO = new OrdersDAO();
		this.userDAO = new UsersDAO();
		this.shoppingCartDAO = new ShoppingCartDAO();
		this.transportUnitDAO = new TransportUnitDAO();
		this.shippingDAO = new ShippingDAO();
		this.warehouseDAO = new WarehouseDAO();
		this.orderDetailDAO = new OrderDetailsDAO();
	}

	
	public void listAllOrder() throws ServletException, IOException {
		listAllOrder(null);
	}

	public void listAllOrder(String message) throws ServletException, IOException {
		List<Orders> listOrder = orderDAO.listAll();
		request.setAttribute("listOrder", listOrder);
		forwardToPage("order_list.jsp", message, request, response);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		Orders order = orderDAO.get(orderId);

		if (order != null) {
			request.setAttribute("order", order);
			forwardToPage("order_detail.jsp", request, response);
		} else {
			String message = "Could not find order with ID " + orderId;
			showMessageBackend(message, request, response);
		}
	}

	public void showCheckoutForm() throws ServletException, IOException {	
	    // Load any required data, e.g., country list
		Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
		List<TransportUnit> transportUnits = transportUnitDAO.listAll();
		request.setAttribute("user", customer);
		request.setAttribute("transportUnits", transportUnits);
	    // Retrieve the JSON data from the request as a URL-encoded form parameter
	    String selectedItemsJSON = request.getParameter("selectedItems");
	    System.out.println("This is " + selectedItemsJSON);

	    try {
	        // Parse the JSON string and extract the selected item IDs
	        JSONObject jsonObject = new JSONObject(selectedItemsJSON);
	        JSONArray selectedItemsArray = jsonObject.getJSONArray("selectedItems");

	        // Create a list to store selected item IDs as strings
	        List<String> selectedItemIdList = new ArrayList<>();

	        for (int i = 0; i < selectedItemsArray.length(); i++) {
	            selectedItemIdList.add(String.valueOf(selectedItemsArray.getInt(i)));
	        }

	        // Set the list of selected item IDs as a request attribute
	        request.getSession().setAttribute("selectedItemIds", selectedItemIdList);
	        System.out.println("Give me: " + selectedItemIdList.contains("55"));
	    } catch (JSONException e) {
	        e.printStackTrace();
	    }
	   
	    // Forward to the checkout page
	    forwardToPage("client/checkout.jsp", request, response);
	}


	public void placeOrder() throws ServletException, IOException {
		String paymentMethod = request.getParameter("paymentMethod");
		System.out.println("Kiem tra:" + paymentMethod);
		System.out.println("Kiem tra:" + paymentMethod.equals("PayPal"));
		Orders order = readOrderInfor();
		if (paymentMethod.equals("PayPal")) {
			PaymentServices paymentService = new PaymentServices(request, response);
			request.getSession().setAttribute("order4Paypal", order);
			paymentService.authorizePayment(order);
		} else {
			placeOrderCOD(order);
		}

	}

	private Orders readOrderInfor() {
		Orders order = new Orders();
		Shipping shipping = new Shipping();

		String paymentMethod = request.getParameter("paymentMethod");
		int transportUniId =  Integer.parseInt(request.getParameter("transportUnit"));

		TransportUnit transportUnit = transportUnitDAO.get(transportUniId);
		
		Users customer = (Users) request.getSession().getAttribute("loggedCustomer");
		UserAddress primaryAddress = null;

		if (customer != null) {
		    for (UserAddress address : customer.getUserAddresses()) {
		        if (address.getIsPrimary() != null && address.getIsPrimary() == 1) {
		            primaryAddress = address;
		            break;  // If a primary address is found, exit the loop
		        }
		    }
		}
		shipping.setUserAddress(primaryAddress);
		shipping.setTransportUnit(transportUnit);
		shipping.setStartDate(new java.util.Date());
		shipping.setExpectedDate(new java.util.Date());
		shipping.setDeliveryStatus("pending");
		String trackingNumber = UniqueTrackingNumberGenerator.generateUniqueTrackingNumber();
		shipping.setTrackingNumber(trackingNumber);
		
		shippingDAO.create(shipping);
		
		order.setUsers(customer);
		order.setShipping(shipping);
		order.setOrderDate(new java.util.Date());
		order.setOrderStatus("pending");

		float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
		
		order.setTotalAmount(totalAmount);	
		order.setPaymentMethod(paymentMethod);
		
		orderDAO.create(order);

		List<String> selectedItemIds = (List<String>) request.getSession().getAttribute("selectedItemIds");
	    for (String itemStrId : selectedItemIds) {
	    	System.out.println("Check for item Id: " + itemStrId);
	    	int itemId = Integer.parseInt(itemStrId);
	        // Find the shopping cart item by the item ID (you need to implement this)
	        ShoppingCart cartItem = shoppingCartDAO.get(itemId);

	        // Check if the cartItem is not null and add it to the order as an OrderDetails
	        if (cartItem != null) {
	            OrderDetails orderDetail = new OrderDetails();
	            Warehouse warehouse = warehouseDAO.findItem(cartItem.getBooks());
	            System.out.println("Check warehouse: " + warehouse.getWarehouseId());
	            int oldQuantity = warehouse.getQuantitySold();
	            warehouse.setQuantitySold(oldQuantity+ cartItem.getQuantity());
	            
	            orderDetail.setOrders(order);
	            orderDetail.setBooks(cartItem.getBooks());
	            orderDetail.setQuantity(cartItem.getQuantity());
	            
	            float subTotal = cartItem.getQuantity()*cartItem.getBooks().getPrice();
	            orderDetail.setSubTotal(subTotal);
	            
	            warehouseDAO.update(warehouse);
	            orderDetailDAO.create(orderDetail);
	        }
	    } 

		return order;

	}

	private void placeOrderCOD(Orders order) throws ServletException, IOException {
		String message = "Thank you. Your order has been received.";
		showMessageFrontend(message, request, response);

	}

	public void listOrderByCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users customer = (Users) session.getAttribute("loggedCustomer");
		List<Orders> listOrders = orderDAO.listByCustomer(customer.getUserId());

		request.setAttribute("listOrders", listOrders);
		forwardToPage("client/order_list.jsp", request, response);
	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Users customer = (Users) session.getAttribute("loggedCustomer");

		Orders order = orderDAO.get(orderId, customer.getUserId());
		request.setAttribute("order", order);
		forwardToPage("client/order_detail.jsp", request, response);
	}

	public void showEditOrderForm() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		Orders order = orderDAO.get(orderId);

		if (order == null) {
			String message = "Could not find order with ID " + orderId;
			showMessageBackend(message, request, response);
			return;
		}

		HttpSession session = request.getSession();
		Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");

		if (isPendingBook == null) {
			session.setAttribute("order", order);
		} else {
			session.removeAttribute("NewBookPendingToAddToOrder");
		}

		CommonUtility.loadCountryList(request);
		forwardToPage("order_form.jsp", request, response);
	}
	
    public WSOrderToast getOrderToastInfo(int userID) throws Exception {
    	Orders order = readOrderInfor();
        PreparedStatement ps = null;
        ResultSet rs = null;

        Users user = userDAO.get(userID);
        
        return new WSOrderToast(user.getUserFullName(),5, order.getTotalAmount());
    }
	
	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Orders order = (Orders) session.getAttribute("order");

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("addressLine1");
		String address2 = request.getParameter("addressLine2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
		float tax = Float.parseFloat(request.getParameter("tax"));

		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");

		order.setFirstname(firstname);
		order.setLastname(lastname);
		order.setAddressLine2(address2);
		order.setCity(city);
		order.setState(state);
		order.setShippingFee(shippingFee);
		order.setTax(tax);
		order.setZipcode(zipcode);
		order.setCountry(country);
		order.setPhone(phone);
		order.setAddressLine1(address1);
		order.setPaymentMethod(paymentMethod);
		order.setStatus(orderStatus);

		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayBookId.length];

		for (int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i - 1] = request.getParameter("quantity" + i);
		}

		Set<OrderDetails> orderDetails = order.getOrderDetailses();
		orderDetails.clear();

		float totalAmount = 0.0f;

		for (int i = 0; i < arrayBookId.length; i++) {
			int bookId = Integer.parseInt(arrayBookId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);

			float subtotal = price * quantity;

			OrderDetails orderDetail = new OrderDetails();
			orderDetail.setBook(new Book(bookId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setBookOrder(order);

			orderDetails.add(orderDetail);

			totalAmount += subtotal;
		}

		order.setSubtotal(totalAmount);
		totalAmount += shippingFee;
		totalAmount += tax;

		order.setTotal(totalAmount);

		orderDAO.update(order);

		String message = "The order " + order.getOrderId() + " has been updated successfully";

		listAllOrder(message);
	}

	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));

		Orders order = orderDAO.get(orderId);

		if (order != null) {
			orderDAO.delete(orderId);

			String message = "The order ID " + orderId + " has been deleted.";
			listAllOrder(message);
		} else {
			String message = "Could not find order with ID " + orderId
					+ ", or it might have been deleted by another admin.";
			showMessageBackend(message, request, response);
		}
	}

	public Integer proceedPaypal(Payment payment) {
		Orders order = (Orders) request.getSession().getAttribute("order4Paypal");

		ItemList itemList = payment.getTransactions().get(0).getItemList();
		ShippingAddress shippingAddress = itemList.getShippingAddress();
		String phoneNumber = itemList.getShippingPhoneNumber();
		String recipientName = shippingAddress.getRecipientName();

		String[] names = recipientName.split(" ");
		order.setFirstname(names[0]);
		order.setLastname(names[1]);
		order.setAddressLine1(shippingAddress.getLine1());
		order.setAddressLine2(shippingAddress.getLine2());
		order.setCity(shippingAddress.getCity());
		order.setState(shippingAddress.getState());
		order.setCountry(shippingAddress.getCountryCode());
		order.setPhone(phoneNumber);

		return saveOrder(order);
	}

	private Integer saveOrder(Orders savedOrder) {
		return savedOrder.getOrderId();
	}
	
	
}