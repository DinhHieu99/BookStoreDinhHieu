package com.bookstore.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bookstore.entities.Contact;

@Service
public class ContactServices {
	@PersistenceContext
	protected EntityManager entityManager;
	
	private JavaMailSender javaMailSender;
	
	@Autowired
	private ContactServices(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public void sendSimpleMessage(String email, String subject, String content) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("BookstoreDinhHieu@gmail.com");
		message.setTo(email);
		message.setSubject(subject);
		message.setText(content);
		javaMailSender.send(message);

	}
	
}
