package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.entities.Users;
import com.bookstore.services.CategoriesServices;
import com.bookstore.services.ProductsServices;
import com.bookstore.services.UserServices;

@Controller
public class LoginController {
	@Autowired
	ProductsServices productsServices;

	@Autowired
	CategoriesServices categoriesServices;

	@Autowired
	UserServices userService;

	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
	public String login(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());

		return "login";
	}

	@PostMapping("/login")
	public String activeLogIn(@ModelAttribute("Login") Users user, ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		System.out.println("email : " + user.getEmail());
		System.out.println("Password : " + user.getPassword());
		String email = user.getEmail();
		String pass = user.getPassword();
		List<Users> users = userService.findAll();

		for (Users tk : users) {
			if (user.getEmail().equals(tk.getEmail()) && user.getPassword().equals(tk.getPassword())) {

				userService.updateStatus(true, tk.getId());

				HttpSession session = request.getSession();

				session.setAttribute("nameUser", tk.getName().toString());
				session.setAttribute("emailUser", tk.getEmail().toString());
				session.setAttribute("idUser", tk.getId().toString());
				return "redirect:index";
			}
		}
		return "login";
	}

	@RequestMapping(value = { "/logout" }, method = { RequestMethod.GET })
	public String logout(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		try {
			HttpSession session = request.getSession();
			int id = Integer.parseInt(session.getAttribute("idUser").toString());
			userService.updateStatus(false, id);
			session.removeAttribute("nameUser");
			session.removeAttribute("idUser");
			session.removeAttribute("emailUser");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:index";
	}
}
