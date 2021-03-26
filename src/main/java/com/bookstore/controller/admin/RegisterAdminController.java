package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.entities.Admin;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.services.AdminServices;

@Controller
public class RegisterAdminController {
	@Autowired
	AdminServices adminServices;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/register" }, method = { RequestMethod.GET })
	public String register(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/register";
	}

	@PostMapping("/admin/register")
	public String saveRegister(@ModelAttribute("register") Admin admin, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		admin.setStatus(false);
		admin.setStatus_login(true);
		if(admin.getPassword().toString().equals(admin.getConfimPassword())) {
			admin.setImg("avatar.png");
			if (adminServices.InsertAdmin(admin, admin.getUsername()) == true) {
				model.addAttribute("mesage", "success");
				return "redirect:/admin";
			}
		}else {
			model.addAttribute("mesage", "false");
		}
		return "admin/register";
	}
}
