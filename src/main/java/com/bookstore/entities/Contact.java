package com.bookstore.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_LienHe")
public class Contact extends BaseEntity{
	@Column(name ="fullname")
	private String fullName;
	
	@Column(name ="email")
	private String email;
	
	@Column(name ="subject",columnDefinition = "text")
	private String subject;
	@Lob
	@Column(name ="content", nullable = false, columnDefinition = "text" )
	private String content;
	
	@Column(name ="status")
	private Boolean status;
	
	@Column(name = "create_date")
	private Date createdDate;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}
