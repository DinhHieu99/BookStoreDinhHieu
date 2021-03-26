package com.bookstore.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.entities.Users;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.services.UserServices;

@Controller
public class InformationController {

	@Autowired
	UserServices userServices;

	@Autowired
	UserRepositories userRepositories;

	@RequestMapping(value = { "/account_information/{id}" }, method = { RequestMethod.GET })
	public String accountInformation(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("account", userServices.accountInformation(id));
		String message = request.getParameter("message");
		try {
			if(message != null) {
				if(message.equals("success")) {
					model.addAttribute("alert", "success");
					model.addAttribute("messageAlert", "Sửa thông tin thành công.");
				}else if(message.equals("false")) {
					model.addAttribute("alert", "danger");
					model.addAttribute("messageAlert", "Sửa thông tin không thành công thành công.");
				}else {
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "account_information";
	}

	@RequestMapping(value = { "/edit_account_information" }, method = { RequestMethod.POST })
	public String editAccountInformation(@ModelAttribute("user") Users user, Model model,
			final HttpServletRequest request, final HttpServletResponse response) {

		user.setStatus(true);
		Date date = new Date();
		user.setCreated(date);
		int idUser = user.getId();
		String passwrod = userRepositories.findPasswordById(idUser);
		if (user.getPassword().equals(passwrod)) {
			if(user.getPasswordNew().equals("")) {
				user.setPassword(passwrod);
				userRepositories.save(user);
			}else {
				if (user.getConfimPassword().toString().equals(user.getPasswordNew().toString())) {
					user.setPassword(user.getPasswordNew());
					userRepositories.save(user);
					model.addAttribute("message", "success");
				}
			}
		}else {
			model.addAttribute("message", "false");
		}
		
		return "redirect:/account_information/"+idUser;
	}
}
