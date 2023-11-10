package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.model.Reviews;

public class ReviewsDAO extends JpaDAO<Reviews> implements GenericDAO<Reviews>{

	@Override
	public Reviews create(Reviews review) {
		// TODO Auto-generated method stub
		return super.create(review);
	}

	@Override
	public Reviews update(Reviews review) {
		// TODO Auto-generated method stub
		return super.update(review);
	}

	@Override
	public Reviews get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Reviews.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Reviews.class, id);
	}

	@Override
	public List<Reviews> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("Reviews.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public Reviews findByCustomerAndBook(Integer customerId, Integer bookId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("userId", customerId);
		parameters.put("bookId", bookId);
		
		List<Reviews> result = super.findWithNameQuery("Reviews.findByCustomerAndBook", parameters);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}

}
