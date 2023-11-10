package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.TransportUnit;

public class TransportUnitDAO extends JpaDAO<TransportUnit> implements GenericDAO<TransportUnit> {

	@Override
	public TransportUnit create(TransportUnit unit) {
		// TODO Auto-generated method stub
		return super.create(unit);
	}

	@Override
	public TransportUnit update(TransportUnit unit) {
		// TODO Auto-generated method stub
		return super.update(unit);
	}

	@Override
	public TransportUnit get(Object id) {
		// TODO Auto-generated method stub
		return super.find(TransportUnit.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(TransportUnit.class, id);
	}

	@Override
	public List<TransportUnit> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("TransportUnit.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public TransportUnit findByUnitName(String name) {
		List<TransportUnit> result = super.findWithNameQuery("TransportUnit.findByUnitName", "name", name);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}

}
