package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.OrderDetails;

public class OrderDetailsDAO extends JpaDAO<OrderDetails> implements GenericDAO<OrderDetails> {

	@Override
	public OrderDetails create(OrderDetails orderDetail) {
		// TODO Auto-generated method stub
		return super.create(orderDetail);
	}

	@Override
	public OrderDetails update(OrderDetails orderDetail) {
		// TODO Auto-generated method stub
		return super.update(orderDetail);
	}

	@Override
	public OrderDetails get(Object id) {
		// TODO Auto-generated method stub
		return super.find(OrderDetails.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		 super.delete(OrderDetails.class, id);
	}

	@Override
	public List<OrderDetails> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("OrderDetails.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public long countQuantity(int orderId) {
		// TODO Auto-generated method stub
		return super.countWithNamedQuery("OrderDetails.countQuantity","orderId",orderId);
	}
	
}
