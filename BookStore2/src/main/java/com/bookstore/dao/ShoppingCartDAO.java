package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Books;
import com.bookstore.model.ShoppingCart;
import com.bookstore.model.Users;

public class ShoppingCartDAO extends JpaDAO<ShoppingCart> implements GenericDAO<ShoppingCart>{

	@Override
	public ShoppingCart create(ShoppingCart item) {
		// TODO Auto-generated method stub
		return super.create(item);
	}

	@Override
	public ShoppingCart update(ShoppingCart item) {
		// TODO Auto-generated method stub
		return super.update(item);
	}

	@Override
	public ShoppingCart get(Object id) {
		// TODO Auto-generated method stub
		return super.find(ShoppingCart.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(ShoppingCart.class, id);
	}

	@Override
	public List<ShoppingCart> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("ShoppingCart.findAll");
	}
	public List<ShoppingCart> listByUser(Users user) {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("ShoppingCart.findByUser","user",user);
	}
	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public long getTotalItems() {
		return super.countWithNamedQuery("ShoppingCart.countAll");
	}
	
	public float getTotalAmount() {
		return super.countWithNamedQuery("ShoppingCart.totalAmount");
	}
	
	public ShoppingCart findItem(Books book, Users user){
		List<ShoppingCart> result = super.findWithNameQuery("ShoppingCart.findItem", "book" ,book,"user" , user);
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
}
