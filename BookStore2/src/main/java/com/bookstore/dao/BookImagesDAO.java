package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.BookImages;

public class BookImagesDAO extends JpaDAO<BookImages> implements GenericDAO<BookImages> {

	@Override
	public BookImages create(BookImages image) {
		// TODO Auto-generated method stub
		return super.create(image);
	}

	@Override
	public BookImages update(BookImages image) {
		// TODO Auto-generated method stub
		return super.update(image);
	}

	@Override
	public BookImages get(Object id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(BookImages.class, id);
	}

	@Override
	public List<BookImages> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public BookImages findByBookId(int bookId) {
		List<BookImages> result = super.findWithNameQuery("BookImages.findByBookId", "bookId", bookId);
		
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
