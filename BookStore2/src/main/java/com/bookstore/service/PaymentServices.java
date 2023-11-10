package com.bookstore.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.model.Books;
import com.bookstore.model.Orders;
import com.bookstore.model.Shipping;
import com.bookstore.model.UserAddress;
import com.bookstore.model.Users;
import com.bookstore.model.OrderDetails;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {
	private static final String CLIENT_ID = "AfDgai4kOB-komrgjZ5Im7H0kohy_k-a5DT8occMa00803M_lmi_EZAdY0ZZf3fiH9B6NOwpD3LSo8WZ";
	private static final String CLIENT_SECRET = "EO4gQuwAEHG9ZWIQ8DYFnk3sXGH1rPgGJeoovuGInVOTjgu6yN84NLnCQrtLdFUgyD76QTpuNj3Nx3j7";
	private String mode = "sandbox";

	private HttpServletRequest request;
	private HttpServletResponse response;

	public PaymentServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
	}

	public void authorizePayment(Orders order) throws ServletException, IOException {
		// get info payer information
		Payer payer = getPayerInformation(order);

		// get redirect URLs
		RedirectUrls redirectUrls = getRedirectURLs();

		// get transaction details
		List<Transaction> transactions = getTransactionInformation(order);

		// request payment
		Payment payment = new Payment();
		payment.setPayer(payer).setRedirectUrls(redirectUrls).setIntent("authorize").setTransactions(transactions);

		System.out.println("=== REQUEST PAYMENT: ===");
		System.out.println(payment);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);

		try {
			Payment authorized = payment.create(apiContext);
			System.out.println("=== AUTHORIZED PAYMENT: ===");
			System.out.println(authorized);

			String approvalURL = getApprovalURL(authorized);
			response.sendRedirect(approvalURL);
		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in authorizing payment");
		}

		// redirect to Paypal's payment page
	}

	// get approval link
	private String getApprovalURL(Payment authorized) {
		String approvalURL = null;

		List<Links> links = authorized.getLinks();

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalURL = link.getHref();
				break;
			}
		}

		return approvalURL;
	}

	private List<Transaction> getTransactionInformation(Orders order) {
		Transaction transaction = new Transaction();
		transaction.setDescription("Amazon Book Store Online");
		Amount amount = getAmountDetails(order);
		transaction.setAmount(amount);

		ItemList itemList = new ItemList();
		ShippingAddress shippingAddress = getShippingInformation(order);
		itemList.setShippingAddress(shippingAddress);

		List<Item> payItems = new ArrayList<>();
		Iterator<OrderDetails> iterator = order.getOrderDetailses().iterator();

		while (iterator.hasNext()) {
			OrderDetails orderDetail = iterator.next();
			Books book = orderDetail.getBooks();
			Integer quantity = orderDetail.getQuantity();

			Item item = new Item();
			item.setCurrency("USD").setName(book.getTitle()).setQuantity(String.valueOf(quantity))
					.setPrice(String.format("%.2f", book.getPrice()));

			payItems.add(item);

		}

		itemList.setItems(payItems);
		transaction.setItemList(itemList);

		List<Transaction> listTransactions = new ArrayList<>();
		listTransactions.add(transaction);

		return listTransactions;
	}

	private ShippingAddress getShippingInformation(Orders order) {
		ShippingAddress shippingAddress = new ShippingAddress();
		
		Shipping shipping = order.getShipping();
		Users user = order.getUsers();
		UserAddress address = shipping.getUserAddress();
		
		String recipientName = user.getFirstName() + " " + user.getLastName();
		shippingAddress.setRecipientName(recipientName).setPhone(user.getTelephone()).setLine1(address.getAddressLine1())
				.setLine2(address.getAddressLine2()).setCity(address.getCity()).setState(address.getState())
				.setCountryCode(address.getCountry()).setPostalCode(address.getPostalCode());

		return shippingAddress;
	}

	private Payer getPayerInformation(Orders order) {
		Payer payer = new Payer();
		payer.setPaymentMethod("PayPal");

		PayerInfo payerInfo = new PayerInfo();
		Users customer = order.getUsers();
		payerInfo.setFirstName(customer.getFirstName());
		payerInfo.setLastName(customer.getLastName());
		payerInfo.setEmail(customer.getEmail());
		payer.setPayerInfo(payerInfo);

		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String baseURL = requestURL.replace(requestURI, "").concat(request.getContextPath());

		RedirectUrls redirectUrls = new RedirectUrls();
		String cancelUrl = baseURL.concat("/view_cart");
		String returnUrl = baseURL.concat("/review_payment");

		System.out.println("Return URL: " + returnUrl);
		System.out.println("Cancel URL: " + cancelUrl);

		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(returnUrl);

		return redirectUrls;
	}

	private Amount getAmountDetails(Orders order) {
		Details details = new Details();
		details.setShipping(String.format("%.2f", order.getShipping().getTransportUnit().getPrice()));
		details.setTax(String.format("%.2f", 10));
		details.setSubtotal(String.format("%.2f", order.getTotalAmount()-order.getShipping().getTransportUnit().getPrice()));

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setDetails(details);
		amount.setTotal(String.format("%.2f", order.getTotalAmount()));

		return amount;
	}

	public void reviewPayment() throws ServletException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		if (paymentId == null || payerId == null) {
			throw new ServletException("Error... !");
		}

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);
		try {
			Payment payment = Payment.get(apiContext, paymentId);
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

			request.setAttribute("payer", payerInfo);
			request.setAttribute("recipient", shippingAddress);
			request.setAttribute("transaction", transaction);

			String reviewPage = "client/review_payment.jsp?paymentId" + paymentId + "&PayerID=" + payerId;
			request.getRequestDispatcher(reviewPage).forward(request, response);

		} catch (PayPalRESTException | IOException e) {
			e.printStackTrace();
			throw new ServletException("Error in getting payment details from Paypal");
		}

	}

	public Payment executePayment() throws PayPalRESTException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		PaymentExecution execution = new PaymentExecution();
		execution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);

		return payment.execute(apiContext, execution);

	}

}
