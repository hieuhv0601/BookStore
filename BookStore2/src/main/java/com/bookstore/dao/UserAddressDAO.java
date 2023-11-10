package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.UserAddress;

public class UserAddressDAO extends JpaDAO<UserAddress> implements GenericDAO<UserAddress> {

	@Override
	public UserAddress create(UserAddress address) {
		// TODO Auto-generated method stub
		return super.create(address);
	}

	@Override
	public UserAddress update(UserAddress address) {
		// TODO Auto-generated method stub
		return super.update(address);
	}

	@Override
	public UserAddress get(Object id) {
		// TODO Auto-generated method stub
		return super.find(UserAddress.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(UserAddress.class, id);
	}

	@Override
	public List<UserAddress> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
