package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.CheckLogIn;
import com.bookstore.entities.Admin;
import com.bookstore.entities.Users;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.services.UserServices;

@Controller
public class UserManagementController {
	@Autowired
	UserRepositories userRepositories;
	@Autowired
	UserServices userServices;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/data-table-user" }, method = { RequestMethod.GET })
	public String dataTableUsers(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("users", userRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/data-table-users";
	}

	@RequestMapping(value = { "/admin/remove-users/{id}" }, method = { RequestMethod.GET })
	public String removeUser(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		userRepositories.deleteById(id);
		model.addAttribute("users", userRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/data-table-user";
	}

	@RequestMapping(value = { "/admin/edit-users/{id}" }, method = { RequestMethod.GET })
	public String editUser(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("users", userRepositories.findById(id));
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/UserManagement/edit-user";
	}

	@RequestMapping(value = { "/admin/edit-users" }, method = { RequestMethod.POST })
	public String saveUser(@ModelAttribute("users") Users user, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		Users pass= userRepositories.getOne(user.getId());
		user.setPassword(pass.getPassword());
		userServices.updateUser(user);

		return "redirect:/admin/data-table-user";
	}
}
