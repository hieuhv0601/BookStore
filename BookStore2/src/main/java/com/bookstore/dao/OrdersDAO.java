package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.model.Orders;

import com.bookstore.model.Users;
import com.bookstore.model.jsonModels.WSOrderToast;

public class OrdersDAO extends JpaDAO<Orders> implements GenericDAO<Orders>{

	@Override
	public Orders create(Orders order) {
		// TODO Auto-generated method stub
		return super.create(order);
	}

	@Override
	public Orders update(Orders order) {
		// TODO Auto-generated method stub
		return super.update(order);
	}

	@Override
	public Orders get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Orders.class, id);
	}

	public Orders get(Integer orderId, Integer customerId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", orderId);
		parameters.put("customerId", customerId);
		
		List<Orders> result = super.findWithNameQuery("Orders.findByIdAndCustomer", parameters);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public Orders getOrderToast() {	
		List<Orders> result = super.findWithNameQuery("Orders.getOrderToast");
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Orders.class, id);
	}

	@Override
	public List<Orders> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("Orders.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return super.countWithNamedQuery("Orders.countAll");
	}

	public List<Orders> listByCustomer(Integer customerId) {
		return super.findWithNameQuery("Orders.findByCustomer", 
				"customerId", customerId);
	}
	
	public List<Orders> listMostRecentSales() {
		return super.findWithNameQuery("Orders.findAll", 0, 3);
	}

	public long countByCustomer(int customerId) {
		return super.countWithNamedQuery("Orders.countByCustomer", "customerId", customerId);
	}
	
	public WSOrderToast getOrderToastInfo(int userID) throws Exception {

        UsersDAO userDAO = new UsersDAO();
        Users user = userDAO.get(userID);
        OrdersDAO orderDAO = new OrdersDAO();
        OrderDetailsDAO orderDetailDAO = new OrderDetailsDAO();
        Orders order = orderDAO.getOrderToast();
        try {
        	
                float totalPrice = order.getTotalAmount();
                long totalQuantity = orderDetailDAO.countQuantity(order.getOrderId());
                return new WSOrderToast(user.getUserFullName(),totalQuantity, totalPrice);
            }
         catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
