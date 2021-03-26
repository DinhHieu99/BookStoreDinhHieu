package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.bookstore.entities.Admin;
import com.bookstore.repositories.AdminRepositories;

@Service
@Transactional
public class AdminServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	AdminRepositories adminRepositories;

	public List<Admin> findAll() {
		String sql = "SELECT * FROM tbl_nhanvien";
		Query query = entityManager.createNativeQuery(sql, Admin.class);
		return query.getResultList();
	}
	
	
	@Modifying
	public int updateStatus(boolean status, int id) {
		String sql = "UPDATE tbl_nhanvien SET status = " + status + " WHERE id =" + id;
		Query query = entityManager.createNativeQuery(sql, Admin.class);
		return query.executeUpdate();
	}
	
	@Modifying
	public Boolean InsertAdmin(Admin admin, String username) {
		Query query = entityManager.createNativeQuery("SELECT *FROM tbl_taikhoan where username like '%"+username+"%'", Admin.class);
		if (query.getResultList().size() > 0) {
			return false;
		} else {
			adminRepositories.save(admin);
			return true;
		}
	}
	
	public int countAdmin() {
		String sql = "SELECT count(id) FROM tbl_nhanvien";
		Query query = entityManager.createNativeQuery(sql, Admin.class);
		return query.executeUpdate();
	}
	
}
