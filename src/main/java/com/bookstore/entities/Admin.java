package com.bookstore.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tbl_nhanvien")
public class Admin extends BaseEntity {
	@Column(name = "name", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "address", columnDefinition = "text", nullable = false)
	private String address;

	@Column(name = "status", nullable = false)
	private boolean status;

	@Column(name = "position", nullable = false)
	private boolean position;

	@Column(name = "mobile", nullable = false)
	private int mobile;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "avatar", columnDefinition = "text")
	private String img;
	
	@Column(name = "username", nullable = false)
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Transient
	private String confimPassword;

	@Transient
	private String passwordNew;

	@Column(name = "status_login", nullable = false)
	private boolean status_login;
	
	@OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PhieuNhap> phieuNhap = new ArrayList<PhieuNhap>();
	
	@OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Post> post = new ArrayList<Post>();

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

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean getPosition() {
		return position;
	}

	public void setPosition(boolean position) {
		this.position = position;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfimPassword() {
		return confimPassword;
	}

	public void setConfimPassword(String confimPassword) {
		this.confimPassword = confimPassword;
	}

	public String getPasswordNew() {
		return passwordNew;
	}

	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}

	public boolean getStatus_login() {
		return status_login;
	}

	public void setStatus_login(boolean status_login) {
		this.status_login = status_login;
	}

	public List<PhieuNhap> getPhieuNhap() {
		return phieuNhap;
	}

	public void setPhieuNhap(List<PhieuNhap> phieuNhap) {
		this.phieuNhap = phieuNhap;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
	}

}
