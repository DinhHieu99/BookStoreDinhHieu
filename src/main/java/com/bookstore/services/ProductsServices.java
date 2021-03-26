package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.bookstore.entities.Products;
import com.bookstore.repositories.ProductsRepositories;

@Service
@Transactional
public class ProductsServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	ProductsRepositories productsRepositories;

	public List<Products> findAll(int limit) {
		String sql = "select *from tbl_sanpham s inner join tbl_danhmuc d on s.idDM = d.id Where d.status = true LIMIT "
				+ limit;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> findAllProducts() {
		String sql = "SELECT * FROM tbl_sanpham";
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> findAllById(int id) {
		String sql = "SELECT * FROM tbl_sanpham WHERE id = " + id;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> findAllByIdCategory(int id) {
		String sql = "SELECT * FROM tbl_sanpham WHERE idDM = " + id;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> sortName(int id, String name, String sort) {
		String sql = "SELECT *FROM tbl_sanpham WHERE idDM = " + id + " ORDER BY " + name + " " + sort;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> showProductsByMinIdCategory(int limit) {
		String sqlMin = "SELECT Min(id) +1 from tbl_danhmuc WHERE status = true";
		String sql = "SELECT * FROM tbl_sanpham WHERE idDM = (" + sqlMin + ") ORDER BY id DESC LIMIT " + limit;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> showProductsByMaxIdCategory(int limit) {
		String sqlMax = "SELECT Max(id) from tbl_danhmuc WHERE status = true";
		String sql = "SELECT * FROM tbl_sanpham WHERE idDM = (" + sqlMax + ") ORDER BY id DESC LIMIT " + limit;
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}
}
