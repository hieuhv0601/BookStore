package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Books;

import com.bookstore.model.Warehouse;

public class WarehouseDAO extends JpaDAO<Warehouse> implements GenericDAO<Warehouse> {

	@Override
	public Warehouse create(Warehouse warehouse) {
		// TODO Auto-generated method stub
		return super.create(warehouse);
	}

	@Override
	public Warehouse update(Warehouse warehouse) {
		// TODO Auto-generated method stub
		return super.update(warehouse);
	}

	@Override
	public Warehouse get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Warehouse.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Warehouse.class, id);
	}

	@Override
	public List<Warehouse> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public Warehouse findItem(Books book){
		List<Warehouse> result = super.findWithNameQuery("Warehouse.findItem", "book" ,book);
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}

}
