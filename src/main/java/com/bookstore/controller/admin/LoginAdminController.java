package com.bookstore.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.entities.Admin;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.services.AdminServices;

@Controller
public class LoginAdminController {


	@Autowired
	AdminRepositories adminRepositories;

	@Autowired
	AdminServices adminServices;

	@RequestMapping(value = { "/admin/login" })
	public String dataTableSupplier(Model model, final HttpServletRequest request, final HttpServletResponse response) {
	
		try {
			String message = request.getParameter("message");
			if(message.toString().equals("false")) {
				model.addAttribute("alert", false);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/login";
	}

	@PostMapping("/admin/loginAdmin")
	public String activeLogIn(@ModelAttribute("admin") Admin admin, ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		System.out.println("email : " + admin.getUsername());
		System.out.println("Password : " + admin.getPassword());
		String email = admin.getUsername();
		String pass = admin.getPassword();
	
		int id = adminRepositories.findIdByUserName(email);
		List<Admin> admins = adminRepositories.findAll();
		
		for (Admin tk: admins) {
			if (admin.getUsername().equals(tk.getUsername()) && admin.getPassword().equals(tk.getPassword())) {
				if(adminRepositories.status_login(id) == true) {
					adminServices.updateStatus(true, id);
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("email", tk.getUsername());
					session.setAttribute("img", tk.getImg());
					session.setAttribute("adminName", tk.getName());
					session.setAttribute("position", tk.getPosition());
				
					
					return "redirect:/admin";
				}
				model.addAttribute("message", false);
				return "admin/login";
			}
		}
		return "admin/login";
	}

	@RequestMapping(value = { "/admin/logout" }, method = { RequestMethod.GET })
	public String logout(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		adminServices.updateStatus(false, id);
		session.removeAttribute("id");
		session.removeAttribute("email");
		session.removeAttribute("adminName");
		session.removeAttribute("adminName");

		return "admin/login";
	}
}
