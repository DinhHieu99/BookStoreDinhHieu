package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.entities.HoaDon;
import com.bookstore.entities.Products;
import com.bookstore.repositories.HoaDonRepositories;
import com.bookstore.repositories.ProductsRepositories;

@Service
public class SearchSevices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	ProductsRepositories productsRepositories;

	public List<Products> selectNameProduct(String title) {
		String sql = "SELECT * FROM tbl_sanpham WHERE LOWER(nameProduct) LIKE LOWER('%" + title + "%')";
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

}
