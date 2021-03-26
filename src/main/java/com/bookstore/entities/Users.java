package com.bookstore.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tbl_KhachHang")
public class Users extends BaseEntity {
	@Column(name = "name", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "address", columnDefinition = "text", nullable = false)
	private String address;

	@Column(name = "mobile", nullable = false)
	private int mobile;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "password", nullable = false)
	private String password;
	
	@Transient
	private String passwordNew;

	@Transient
	private String confimPassword;

	@Column(name = "status", nullable = false)
	private boolean status;

	@Column(name = "user_status", nullable = false)
	private boolean user_status;

	@Column(name = "created")
	private Date created;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<HoaDon> hoaDon = new ArrayList<HoaDon>();

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<ReviewProduct> reviewProduct = new ArrayList<ReviewProduct>();
	
	public List<ReviewProduct> getReviewProduct() {
		return reviewProduct;
	}

	public void setReviewProduct(List<ReviewProduct> reviewProduct) {
		this.reviewProduct = reviewProduct;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordNew() {
		return passwordNew;
	}

	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}

	public String getConfimPassword() {
		return confimPassword;
	}

	public void setConfimPassword(String confimPassword) {
		this.confimPassword = confimPassword;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean getUser_status() {
		return user_status;
	}

	public void setUser_status(boolean user_status) {
		this.user_status = user_status;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public List<HoaDon> getHoaDon() {
		return hoaDon;
	}

	public void setHoaDon(List<HoaDon> hoaDon) {
		this.hoaDon = hoaDon;
	}

}
