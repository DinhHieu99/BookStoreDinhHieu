package com.bookstore.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookstore.CheckLogIn;
import com.bookstore.entities.Admin;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.services.AdminServices;

@Controller
public class AdminController {

	@Value("${file.upload.path}")
	private String attachmentPath;

	@Autowired
	AdminRepositories adminRepositories;

	@Autowired
	AdminServices adminServices;

	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin" }, method = { RequestMethod.GET })
	public String indexAdmin(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contact", contactRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/index";
	}

	@RequestMapping(value = { "/admin/account_information" }, method = { RequestMethod.GET })
	public String influencer_profile(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		Admin admin = adminRepositories.getOne(id);
		model.addAttribute("admin", admin);

		try {
			String message = request.getParameter("message");
			if(message.toString().equals("false")) {
				model.addAttribute("alert", false);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/account_information";
	}

	@RequestMapping(value = { "/admin/edit_account_information" }, method = { RequestMethod.POST })
	public String EditProfile(@RequestParam("image") MultipartFile postImage, @ModelAttribute("admin") Admin admin,
			Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		try {
			HttpSession session = request.getSession();
			if (postImage != null && postImage.getSize() > 0) {
				postImage.transferTo(new File(attachmentPath + "/" + postImage.getOriginalFilename()));
				admin.setImg(postImage.getOriginalFilename());

			} else {
				String image = session.getAttribute("img").toString();
				admin.setImg(image);
			}
			Admin tk = adminRepositories.getOne(admin.getId());
			admin.setUsername(tk.getUsername());
			if (admin.getConfimPassword().toString().equals("")) {
				admin.setPassword(tk.getPassword());
			} else {
				if (admin.getPassword().equals(tk.getPassword())) {
					if (admin.getPasswordNew().equals("")) {
						model.addAttribute("message", "false");
					} else {
						if (admin.getConfimPassword().toString().equals(admin.getPasswordNew().toString())) {
							admin.setPassword(admin.getPasswordNew());
							model.addAttribute("message", "success");
						}
					}
				}
			}
			model.addAttribute("message", "success");
			admin.setStatus(true);
			adminRepositories.save(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/account_information";
	}

	@RequestMapping(value = { "/admin/data-table-admin" }, method = { RequestMethod.GET })
	public String dataAdmin(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("admin", adminRepositories.findAll());
		return "admin/data-table-admin";
	}

	@RequestMapping(value = { "/admin/remove-admin/{id}" }, method = { RequestMethod.GET })
	public String removeAdmin(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		if (adminRepositories.countAdmin() > 1) {
			adminRepositories.deleteById(id);
			model.addAttribute("admin", adminRepositories.findAll());
		} else {
			model.addAttribute("admin", adminRepositories.findAll());
		}

		return "redirect:/admin/data-table-admin";
	}

	@RequestMapping(value = { "/admin/edit-admin/{id}" }, method = { RequestMethod.GET })
	public String editAdmin(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		Admin admin = adminRepositories.getOne(id);
		model.addAttribute("admin", admin);

		return "/admin/adminManagement/edit-admin";
	}

	@RequestMapping(value = { "/admin/edit-admin" }, method = { RequestMethod.POST })
	public String editAdmin(@ModelAttribute("admin") Admin admin, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		HttpSession session = request.getSession();
		admin.setImg(session.getAttribute("img").toString());
		Admin tk = adminRepositories.getOne(admin.getId());
		admin.setUsername(tk.getUsername());
		admin.setPassword(tk.getPassword());
		System.out.println("pass: " + tk.getPassword());
		adminRepositories.save(admin);

		return "redirect:/admin/data-table-admin";
	}

}
