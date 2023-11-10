package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.UserRoles;

public class UserRolesDAO extends JpaDAO<UserRoles> implements GenericDAO<UserRoles> {

	@Override
	public UserRoles create(UserRoles role) {
		// TODO Auto-generated method stub
		return super.create(role);
	}

	@Override
	public UserRoles update(UserRoles role) {
		// TODO Auto-generated method stub
		return super.update(role);
	}

	@Override
	public UserRoles get(Object id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Object id) {
		super.delete(UserRoles.class, id);

	}

	@Override
	public List<UserRoles> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public UserRoles findByUserId(int userId) {
		List<UserRoles> result = super.findWithNameQuery("UserRoles.findByUserId", "userId", userId);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
