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
import javax.persistence.Transient;

@Entity
@Table(name = "tbl_SanPham")
public class Products extends BaseEntity {
	@Column(name = "nameProduct", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "status")
	private Boolean status;

	@Column(name = "describes", columnDefinition = "text")
	private String describe;

	@Column(name = "quantity")
	private int quantity;

	@Transient
	private int soLuongNhap;

	@Column(name = "price")
	private int price;

	@Column(name = "percentDiscount")
	private Integer percentDiscount;

	@Column(name = "discount")
	private int discount;

	@Column(name = "imgProduct")
	private String imgProduct;

	@Column(name = "author", columnDefinition = "text")
	private String author;

	@Column(name = "createDate")
	private Date createDate;

	@Column(name = "view", columnDefinition = "text")
	private int view;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idNCC")
	private NhaCC nhaCC;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idDM")
	private Categories categories;

	@OneToMany(mappedBy = "products", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Cart> cart = new ArrayList<Cart>();

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PhieuNhap> phieuNhap = new ArrayList<PhieuNhap>();
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<ReviewProduct> review = new ArrayList<ReviewProduct>();
	
	public List<ReviewProduct> getReview() {
		return review;
	}

	public void setReview(List<ReviewProduct> review) {
		this.review = review;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSoLuongNhap() {
		return soLuongNhap;
	}

	public void setSoLuongNhap(int soLuongNhap) {
		this.soLuongNhap = soLuongNhap;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Integer getPercentDiscount() {
		return percentDiscount;
	}

	public void setPercentDiscount(Integer percentDiscount) {
		this.percentDiscount = percentDiscount;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getImgProduct() {
		return imgProduct;
	}

	public void setImgProduct(String imgProduct) {
		this.imgProduct = imgProduct;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public NhaCC getNhaCC() {
		return nhaCC;
	}

	public void setNhaCC(NhaCC nhaCC) {
		this.nhaCC = nhaCC;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public List<PhieuNhap> getPhieuNhap() {
		return phieuNhap;
	}

	public void setPhieuNhap(List<PhieuNhap> phieuNhap) {
		this.phieuNhap = phieuNhap;
	}

}
