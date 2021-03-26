package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.Cart;
import com.bookstore.entities.Products;
import com.bookstore.entities.Users;
import com.bookstore.repositories.CartRepositories;

@Service
@Transactional
public class CartServices {
	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	CartRepositories cartRepositories;

	public List<Cart> findAll() {
		String sql = "SELECT * FROM tbl_giohang";
		Query query = entityManager.createNativeQuery(sql, Cart.class);
		return query.getResultList();
	}

	public List<Cart> findByIdUser(int id) {
		String sql = "SELECT * FROM tbl_giohang WHERE idUser =" + id;
		Query query = entityManager.createNativeQuery(sql, Cart.class);
		return query.getResultList();
	}
	
	public List<Cart> findByIdOrder(int id) {
		String sql = "SELECT * FROM tbl_giohang WHERE idOrder =" + id;
		Query query = entityManager.createNativeQuery(sql, Cart.class);
		return query.getResultList();
	}
	
	@Modifying
	public int updateQuatity(int id, int quatity, int thanhTien) {
		String sql = "UPDATE tbl_giohang SET quantity=" + quatity + ",money =" + thanhTien + "  WHERE id =" + id;
		Query query = entityManager.createNativeQuery(sql, Cart.class);
		return query.executeUpdate();
	}

	@Modifying
	public Boolean InsertCart(int idUser, int discount, int money, int quantity, boolean statusDelete,
			int idOrder, int idProduct) {
		Query query = entityManager.createNativeQuery(
				"SELECT *FROM tbl_khachhang where user_status = true and id = " + idUser, Users.class);
		if (query.getResultList().size() > 0) {
			Query query1 = entityManager.createNativeQuery(
					"INSERT INTO tbl_giohang(discount, money, quantity, status_delete, idOrder, idProducts) VALUES ("
							+ discount + "," + money + "," + quantity + "," + statusDelete + ","+idOrder+","+idProduct+")",
					Cart.class);
			query1.executeUpdate();
			return true;
		} else {
			return false;
		}
	}
}
