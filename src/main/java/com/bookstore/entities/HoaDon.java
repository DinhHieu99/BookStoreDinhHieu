package com.bookstore.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_HoaDon")
public class HoaDon extends BaseEntity {

	@Column(name = "fullName", nullable = false)
	private String fullName;

	@Column(name = "mobile", nullable = false)
	private int mobile;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "created", nullable = false)
	private Date created;

	@Column(name = "status", nullable = false)
	private int status;

	@Column(name = "message", columnDefinition = "text")
	private String message;

	@Column(name = "deliveryAddress", columnDefinition = "text")
	private String deliveryAddress;

	@Column(name = "pay")
	private boolean pay;

	@Column(name = "totalMoney", nullable = false)
	private int totalMoney;

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Cart> cart = new ArrayList<Cart>();

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUser", nullable = true)
	private Users user;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public boolean isPay() {
		return pay;
	}

	public void setPay(boolean pay) {
		this.pay = pay;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

}
