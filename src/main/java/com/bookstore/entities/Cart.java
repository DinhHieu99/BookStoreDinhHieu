package com.bookstore.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_giohang")
public class Cart extends BaseEntity {
	@Id // xác định đây là khoá chính.
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "id")
	private Integer id; // primary-key

	@Column(name = "quantity", nullable = false)
	private int quantity;

	@Column(name = "discount")
	private int discount;

	@Column(name = "money", nullable = false)
	private int money;

	@Column(name = "status_delete")
	private boolean status_delete;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idOrder")
	private HoaDon order;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProducts")
	private Products products;

	public Cart() {
		super();
	}

	public Cart(Integer id, int quantity, int discount, int money, Products products) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.discount = discount;
		this.money = money;
		this.products = products;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public boolean isStatus_delete() {
		return status_delete;
	}

	public void setStatus_delete(boolean status_delete) {
		this.status_delete = status_delete;
	}

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public HoaDon getOrder() {
		return order;
	}

	public void setOrder(HoaDon order) {
		this.order = order;
	}

}
