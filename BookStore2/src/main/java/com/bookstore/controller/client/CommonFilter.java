package com.bookstore.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.bookstore.dao.CategoriesDAO;
import com.bookstore.model.Categories;


@WebFilter("/*")
public class CommonFilter implements Filter {

	private final CategoriesDAO categoryDAO;
	
	public CommonFilter() {
		categoryDAO = new CategoriesDAO(); 
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		if (!path.startsWith("/admin/")) {
			List<Categories> listCategory = categoryDAO.listAll();		
			request.setAttribute("listCategory", listCategory);	
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
