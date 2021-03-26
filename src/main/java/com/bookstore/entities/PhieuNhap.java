package com.bookstore.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_PhieuNhap")
public class PhieuNhap extends BaseEntity {
	@Column(name = "nameProduct", nullable = false)
	private String name;
	
	@Column(name = "quantity", nullable = false)
	private int quantity;

	@Column(name = "created", nullable = false)
	private Date createDate;

	@Column(name = "price", nullable = false)
	private int price;

	@Column(name = "amount", nullable = false)
	private int amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idAdmin")
	private Admin admin;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduct")
	private Products product;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

}
