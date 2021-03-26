package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.CheckLogIn;
import com.bookstore.entities.Categories;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.services.CategoriesServices;

@Controller
public class CategoriesManagementController {
	@Autowired
	CategoriesServices categoriesServices;
	@Autowired
	CategoriesRepositories categoriesRepositories;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/data-table-category" }, method = { RequestMethod.GET })
	public String dataTablesCategories(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("category", categoriesRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/data-table-categories";
	}

	@RequestMapping(value = { "/admin/remove-category/{id}" }, method = { RequestMethod.GET })
	public String removeCategory(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		categoriesRepositories.deleteById(id);
		model.addAttribute("category", categoriesServices.findAllCategory());

		return "redirect:/admin/data-table-category";
	}

	@RequestMapping(value = { "/admin/edit-category/{id}" }, method = { RequestMethod.GET })
	public String editCategory(@PathVariable int id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		Categories category = categoriesRepositories.getOne(id);
		model.addAttribute("category", category);
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		// trả về tên view.
		return "admin/categoriesManagement/edit_category";
	}
	@RequestMapping(value = { "/admin/add-category" }, method = { RequestMethod.GET })
	public String addCategory(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/categoriesManagement/add-category";
	}
	@RequestMapping(value = { "/admin/add_category" }, method = { RequestMethod.POST })
	public String add(@ModelAttribute("category") Categories category, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		// lưu dữ liệu vào database.
	
		categoriesRepositories.save(category);

		// trả về thông báo cho người dùng.
		model.addAttribute("status", "success");

		// trả về tên view.
		return "redirect:/admin/data-table-category";
	}
	
	@RequestMapping(value = { "/admin/edit_category" }, method = { RequestMethod.POST })
	public String updateCategoryViaBindData(@ModelAttribute("category") Categories category, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		// lưu dữ liệu vào database.
	
		categoriesRepositories.save(category);

		// trả về thông báo cho người dùng.
		model.addAttribute("status", "success");

		// trả về tên view.
		return "redirect:/admin/data-table-category";
	}
}
