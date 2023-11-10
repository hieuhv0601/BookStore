package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Shipping;

public class ShippingDAO extends JpaDAO<Shipping> implements GenericDAO<Shipping> {

	@Override
	public Shipping create(Shipping shipping) {
		// TODO Auto-generated method stub
		return super.create(shipping);
	}

	@Override
	public Shipping update(Shipping shipping) {
		// TODO Auto-generated method stub
		return super.update(shipping);
	}

	@Override
	public Shipping get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Shipping.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Shipping.class, id);
	}

	@Override
	public List<Shipping> listAll() {
		// TODO Auto-generated method stub
		 return super.findWithNameQuery("Shipping.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
