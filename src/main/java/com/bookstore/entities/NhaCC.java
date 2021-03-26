package com.bookstore.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_NhaCC")
public class NhaCC extends BaseEntity {
	@Column(name = "nameSupplier", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "address", columnDefinition = "text", nullable = false)
	private String address;

	@Column(name = "mobile", nullable = false)
	private int mobile;

	@Column(name = "email", columnDefinition = "text", nullable = false)
	private String email;
	
	@Column(name = "status")
	private boolean status;
	
	@OneToMany(mappedBy = "nhaCC", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Products> products = new ArrayList<Products>();

	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
