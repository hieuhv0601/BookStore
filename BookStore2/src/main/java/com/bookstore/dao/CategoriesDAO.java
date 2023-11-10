package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Categories;


public class CategoriesDAO extends JpaDAO<Categories> implements GenericDAO<Categories> {

	public CategoriesDAO() {

	}

	@Override
	public Categories create(Categories category) {
		// TODO Auto-generated method stub
		return super.create(category);
	}

	@Override
	public Categories update(Categories category) {
		// TODO Auto-generated method stub
		return super.update(category);
	}

	@Override
	public Categories get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Categories.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		 super.delete(Categories.class,id);
	}

	public Categories findByCategoryName(String categoryName) {
		List<Categories> listCategories = super.findWithNameQuery("Categories.findByCategoryName", "categoryName", categoryName);
		if (listCategories != null && listCategories.size() == 1) {
			return listCategories.get(0);
		}
		return null;
	}

	public Categories findByCategorySlug(String categorySlug) {
		List<Categories> listCategories = super.findWithNameQuery("Categories.findByCategorySlug", "categorySlug", categorySlug);
		if (listCategories != null && listCategories.size() == 1) {
			return listCategories.get(0);
		}
		return null;
	}
	
	@Override
	public List<Categories> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("Categories.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return super.countWithNamedQuery("Categories.countAll");
	}

}
