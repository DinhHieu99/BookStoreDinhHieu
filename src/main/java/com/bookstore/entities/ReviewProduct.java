package com.bookstore.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_DanhGia")
public class ReviewProduct extends BaseEntity{
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "rating")
	private int rating;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduct")
	private Products product;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUser")
	private Users user;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
}
