package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.entities.Categories;
import com.bookstore.entities.Products;
import com.bookstore.repositories.CategoriesRepositories;

@Service
public class CategoriesServices {
	@PersistenceContext protected EntityManager entityManager;
	
	@Autowired
	CategoriesRepositories categoriesRepositories;
	
	public List<Categories> findAllCategory(){
		String sql = "SELECT * FROM tbl_danhmuc where status = true";
		Query query = entityManager.createNativeQuery(sql, Categories.class);
		return query.getResultList();
	}
	public List<Categories> findById(int id){
		String sql = "SELECT * FROM tbl_danhmuc where id ="+id;
		Query query = entityManager.createNativeQuery(sql, Categories.class);
		return query.getResultList();
	}
	public List<Categories> findNameById(int id){
		String sql = "SELECT name FROM tbl_danhmuc where id ="+id;
		Query query = entityManager.createNativeQuery(sql, Categories.class);
		return query.getResultList();
	}
	
}
