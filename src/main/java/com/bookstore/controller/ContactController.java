package com.bookstore.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.IsExisting;
import com.bookstore.entities.Cart;
import com.bookstore.entities.Contact;
import com.bookstore.entities.Users;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.services.ContactServices;

@Controller
public class ContactController {

	@Autowired
	private ContactServices contactServices;

	@Autowired
	private ContactRepositories contactRepositories;

	@RequestMapping(value = { "/contact" }, method = { RequestMethod.GET })
	public String contact(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			double totalMoney = IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			int id = Integer.parseInt(session.getAttribute("idUser").toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "contact";
	}

	@RequestMapping(value = { "/sendMail" }, method = { RequestMethod.POST })
	public String sendMail(@ModelAttribute("contact") Contact contact, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		Date date = new Date();
		contact.setStatus(false);
		contact.setCreatedDate(date);
		contactRepositories.save(contact);
		return "redirect:/contact";
	}
}
