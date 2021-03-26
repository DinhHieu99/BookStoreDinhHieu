package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.bookstore.entities.Cart;
import com.bookstore.entities.HoaDon;
import com.bookstore.entities.Users;
import com.bookstore.repositories.HoaDonRepositories;

@Service
@Transactional
public class HoaDonServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	HoaDonRepositories hoaDonRepositories;

	public List<HoaDon> findAll() {
		String sql = "SELECT * FROM tbl_hoadon";
		Query query = entityManager.createNativeQuery(sql, HoaDon.class);
		return query.getResultList();
	}

	public List<HoaDon> findAllByIdUser(int id) {
		String sql = "SELECT *FROM tbl_hoadon WHERE idUser = "+id;
		Query query = entityManager.createNativeQuery(sql, HoaDon.class);
		return query.getResultList();
	}

	@Modifying
	public int updateStatusDelete(int id, boolean status_delete) {
		String sql = "UPDATE tbl_giohang SET status_delete = " + status_delete + " WHERE id =" + id;
		Query query = entityManager.createNativeQuery(sql, Cart.class);
		return query.executeUpdate();
	}

	@Modifying
	public int updateStatus(int id, int status) {
		String sql = "UPDATE tbl_hoadon SET status = " + status + " WHERE id =" + id;
		Query query = entityManager.createNativeQuery(sql, HoaDon.class);
		return query.executeUpdate();
	}

	
	public List<HoaDon> selectHoaDon(String title) {
		String sql = "select *from tbl_hoadon where date(created) = '" + title + "'";
		Query query = entityManager.createNativeQuery(sql, HoaDon.class);
		return query.getResultList();
	}

	public List<HoaDon> selectHoaDonByMonth(String title) {
		String sql = "select *from tbl_hoadon where month(created) = '" + title + "'";
		Query query = entityManager.createNativeQuery(sql, HoaDon.class);
		return query.getResultList();
	}

	@Modifying
	public int insert(HoaDon hd) {
		Query query = entityManager
				.createNativeQuery("" + "INSERT INTO tbl_hoadon(created, status, "
						+ " totalMoney, message, pay, deliveryAddress,fullName, mobile, email)"
						+ "VALUES(?,?,?,?,?,?,?,?,?)")
				.setParameter(1, hd.getCreated()).setParameter(2, hd.getStatus()).setParameter(3, hd.getTotalMoney())
				.setParameter(4, hd.getMessage()).setParameter(5, hd.isPay()).setParameter(6, hd.getDeliveryAddress())
				.setParameter(7, hd.getFullName()).setParameter(8, hd.getMobile()).setParameter(9, hd.getEmail());

		return query.executeUpdate();
	}

	@Modifying
	public int insertForUser(HoaDon hd) {
		Query query = entityManager
				.createNativeQuery("" + "INSERT INTO tbl_hoadon(created, status, "
						+ " totalMoney, message, pay, deliveryAddress, fullName, mobile, email, idUser)"
						+ "VALUES(?,?,?,?,?,?,?,?,?,?)")
				.setParameter(1, hd.getCreated()).setParameter(2, hd.getStatus()).setParameter(3, hd.getTotalMoney())
				.setParameter(4, hd.getMessage()).setParameter(5, hd.isPay()).setParameter(6, hd.getDeliveryAddress())
				.setParameter(7, hd.getFullName()).setParameter(8, hd.getMobile()).setParameter(9, hd.getEmail())
				.setParameter(10, hd.getUser());

		return query.executeUpdate();
	}
}
