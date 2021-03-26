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
@Table(name = "tbl_DanhMuc")
public class Categories extends BaseEntity{
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "describes", nullable = false)
	private String describe;

	@Column(name = "status", nullable = false)
	private boolean status;
	
	@OneToMany(mappedBy = "categories", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Products> product = new ArrayList<Products>();

	public List<Products> getProduct() {
		return product;
	}

	public void setProduct(List<Products> product) {
		this.product = product;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
