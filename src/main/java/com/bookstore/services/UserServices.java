package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.Users;
import com.bookstore.repositories.ProductsRepositories;

@Service
@Transactional
public class UserServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	ProductsRepositories productsRepositories;

	public List<Users> findAll() {
		String sql = "SELECT * FROM tbl_khachhang";
		Query query = entityManager.createNativeQuery(sql, Users.class);
		return query.getResultList();
	}

	public List<Users> accountInformation(int id) {
		String sql = "SELECT * FROM tbl_khachhang where id =" + id;
		Query query = entityManager.createNativeQuery(sql, Users.class);
		return query.getResultList();
	}

	@Modifying
	public int updateStatus(Boolean status, int id) {
		String sql = "UPDATE tbl_khachhang SET status = " + status + " WHERE id =" + id + "";
		Query query = entityManager.createNativeQuery(sql, Users.class);
		return query.executeUpdate();
	}
	@Modifying
	public int updateUser(Users user) {
		Query query = entityManager.createNativeQuery(
				"Update tbl_khachhang set address = ?, mobile =?, email =?, name=?, password =?, status=?, user_status =?",
				Users.class).setParameter(1, user.getAddress()).setParameter(2, user.getMobile())
				.setParameter(3, user.getEmail()).setParameter(4, user.getName()).setParameter(5, user.getPassword())
				.setParameter(6, user.getStatus()).setParameter(7, user.getUser_status());

		return query.executeUpdate();
	}

	@Modifying
	public Boolean InsertUser(Users user) {
		Query query = entityManager.createNativeQuery("SELECT *FROM tbl_khachhang where email = ?", Users.class)
				.setParameter(1, user.getEmail());
		if (query.getResultList().size() > 0) {
			return false;
		} else {
			entityManager.createNativeQuery(
					"Insert into tbl_khachhang(created,address,mobile,email,name,password, status, user_status) VALUES(?,?,?,?,?,?,?,?)")
					.setParameter(1, user.getCreated()).setParameter(2, user.getAddress())
					.setParameter(3, user.getMobile()).setParameter(4, user.getEmail())
					.setParameter(5, user.getName()).setParameter(6, user.getPassword())
					.setParameter(7, user.getStatus()).setParameter(8, user.getUser_status()).executeUpdate();
			return true;
		}
	}

}
