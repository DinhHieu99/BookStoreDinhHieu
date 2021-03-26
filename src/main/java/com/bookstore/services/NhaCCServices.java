package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.entities.NhaCC;
import com.bookstore.repositories.NhaCCRepositories;

@Service
public class NhaCCServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	NhaCCRepositories nhaCCRepositories;
	
	public List<NhaCC> findAll(){
		String sql = "SELECT * FROM tbl_nhacc";
		Query query = entityManager.createNativeQuery(sql, NhaCC.class);
		return query.getResultList();
	}
}
