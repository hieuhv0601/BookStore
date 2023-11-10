package com.bookstore.model;
// Generated Oct 12, 2023, 8:58:27 AM by Hibernate Tools 4.3.6.Final


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Nationalized;

/**
 * Categories generated by hbm2java
 */
@Entity
@Table(name = "Categories", schema = "dbo", catalog = "bookstore", uniqueConstraints = {
		@UniqueConstraint(columnNames = "name"), @UniqueConstraint(columnNames = "slug") })
@NamedQueries({ @NamedQuery(name = "Categories.findAll", query = "SELECT c FROM Categories c ORDER BY c.categoryId"),
		@NamedQuery(name = "Categories.findByCategoryName", query = "SELECT c FROM Categories c WHERE c.categoryName = :categoryName"),
		@NamedQuery(name = "Categories.findByCategorySlug", query = "SELECT c FROM Categories c WHERE c.categorySlug = :categorySlug"),
		@NamedQuery(name = "Categories.countAll", query = "SELECT COUNT(c) FROM Categories c") })
public class Categories implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer categoryId;
	private Categories categories;
	private String categoryName;
	private String categorySlug;
	private Date createdAt;
	private Date modifiedAt;
	private Set<Books> booksSet = new HashSet<Books>(0);
	private Set<Categories> categoriesSet = new HashSet<Categories>(0);

	public Categories() {
	}

	public Categories(String categoryName, String categorySlug) {
		this.categoryName = categoryName;
		this.categorySlug = categorySlug;
	}
	public Categories(Integer categoryId,String categoryName, String categorySlug) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categorySlug = categorySlug;
	}
	public Categories(String categoryName, Date createdAt, Date modifiedAt) {
		this.categoryName = categoryName;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
	}
	public Categories(Categories categories, String categoryName, String categorySlug, Date createdAt, Date modifiedAt,
			Set<Books> booksSet, Set<Categories> categoriesSet) {
		this.categories = categories;
		this.categoryName = categoryName;
		this.categorySlug = categorySlug;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
		this.booksSet = booksSet;
		this.categoriesSet = categoriesSet;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "category_id", unique = true, nullable = false)
	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_category_id")
	public Categories getCategories() {
		return this.categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	@Nationalized
	@Column(name = "name", unique = true, nullable = false)
	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String name) {
		this.categoryName = name;
	}
	@Nationalized
	@Column(name = "slug", unique = true)
	public String getCategorySlug() {
		return this.categorySlug;
	}

	public void setCategorySlug(String slug) {
		this.categorySlug = slug;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at", nullable = false, length = 23)
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modified_at", nullable = false, length = 23)
	public Date getModifiedAt() {
		return this.modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categories")
	public Set<Books> getBookses() {
		return this.booksSet;
	}

	public void setBookses(Set<Books> bookses) {
		this.booksSet = bookses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categories")
	public Set<Categories> getCategorieses() {
		return this.categoriesSet;
	}

	public void setCategorieses(Set<Categories> categorieses) {
		this.categoriesSet = categorieses;
	}

}
