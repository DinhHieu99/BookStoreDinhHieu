package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.entities.Contact;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.services.ContactServices;

@Controller
public class ContactManagementController {
	@Autowired
	ContactRepositories contactRepositories;
	@Autowired
	private ContactServices contactServices;

	private Logger logger = LoggerFactory.getLogger(ContactServices.class);

	@RequestMapping(value = { "/admin/contacts" }, method = { RequestMethod.GET })
	public String contact(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		int count = contactRepositories.count(false);
		model.addAttribute("mail", count);
		int sendMail = contactRepositories.count(true);
		model.addAttribute("sendMail", sendMail);
		model.addAttribute("contact", contactRepositories.findAll(false));
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/mail";
	}
	
	@RequestMapping(value = { "/admin/send-mail" }, method = { RequestMethod.GET })
	public String sendMail(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		int count = contactRepositories.count(false);
		model.addAttribute("mail", count);
		int sendMail = contactRepositories.count(true);
		model.addAttribute("sendMail", sendMail);
		model.addAttribute("contact", contactRepositories.findAll(true));
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/mail";
	}

	@RequestMapping(value = { "/admin/sendMail/id={id}" }, method = { RequestMethod.GET })
	public String editContact(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		Contact contact = contactRepositories.getOne(id);
		model.addAttribute("contact", contact);
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/ContactManagement/sendMail";
	}

	@PostMapping("/admin/sendMail")
	public String sendMail(@ModelAttribute("contact") Contact contact, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		
		contactRepositories.update(true, contact.getId());
		contactServices.sendSimpleMessage(contact.getEmail(), contact.getSubject(), contact.getContent());
		return "redirect:/admin/contacts";
	}
}
