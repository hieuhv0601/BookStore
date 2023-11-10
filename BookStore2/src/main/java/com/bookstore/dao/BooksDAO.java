package com.bookstore.dao;

import java.util.ArrayList;
import java.util.List;

import com.bookstore.model.Books;


public class BooksDAO extends JpaDAO<Books> implements GenericDAO<Books> {
	
	public BooksDAO() {
	}

	@Override
	public Books create(Books book) {
		// TODO Auto-generated method stub
		return super.create(book);
	}

	@Override
	public Books update(Books book) {
		// TODO Auto-generated method stub
		return super.update(book);
	}

	@Override
	public Books get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Books.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Books.class, id);

	}

	public Books findByTitle(String title) {
		List<Books> result = super.findWithNameQuery("Books.findByTitle", "title", title);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}


	public Books findBySlug(String bookSlug) {
		List<Books> listBook = super.findWithNameQuery("Books.findBySlug", "bookSlug", bookSlug);
		if (listBook != null && listBook.size() == 1) {
			return listBook.get(0);
		}
		return null;
	}

	public Books findByIsbn(String isbn) {
		List<Books> listBook = super.findWithNameQuery("Books.findByIsbn", "isbn", isbn);
		if (listBook != null && listBook.size() == 1) {
			return listBook.get(0);
		}
		return null;
	}
	
	public List<Books> listByCategory (int categoryId){
		return super.findWithNameQuery("Books.findByCategory", "categoryId", categoryId);
	}
	
	public List<Books> search(String keyword){
		return super.findWithNameQuery("Books.search", "keyword", keyword);
	}
	
	public List<Books> listNewBooks() {
		
		return super.findWithNameQuery("Books.listNew", 0, 10);
	}

	@Override
	public List<Books> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("Books.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return super.countWithNamedQuery("Books.countAll");
	}

	
	public List<Books> listMostFavoredBooks() {
		List<Books> mostFavoredBooks = new ArrayList<>();
		List<Object[]>result = super.findWithNameQueryObjects("Reviews.mostFavoredBooks", 0, 4);
		
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				Books book = (Books) elements[0];
				mostFavoredBooks.add(book);
			}
		}
		
		return mostFavoredBooks;
	}

	public List<Books> listBestSellingBooks() {
		return super.findWithNameQuery("Books.findBestSellingBooks",0,4);
	}
}
