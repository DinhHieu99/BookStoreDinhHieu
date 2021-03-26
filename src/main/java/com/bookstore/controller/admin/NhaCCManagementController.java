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
import com.bookstore.entities.NhaCC;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.NhaCCRepositories;
import com.bookstore.services.NhaCCServices;

@Controller
public class NhaCCManagementController {
	@Autowired
	NhaCCRepositories nhaCCRepositories;
	@Autowired
	NhaCCServices nhaCCServices;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/data-table-supplier" }, method = { RequestMethod.GET })
	public String dataTableSupplier(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("nhacc", nhaCCServices.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/data-table-supplier";
	}

	@RequestMapping(value = { "/admin/remove-supplier/{id}" }, method = { RequestMethod.GET })
	public String removeSupplier(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		nhaCCRepositories.deleteById(id);
		model.addAttribute("nhacc", nhaCCServices.findAll());

		return "redirect:/admin/data-table-supplier";
	}

	@RequestMapping(value = { "/admin/edit-supplier/{id}" }, method = { RequestMethod.GET })
	public String editSupplier(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		NhaCC ncc = nhaCCRepositories.getOne(id);
		model.addAttribute("nhacc", ncc);
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/NhaCCManagement/edit-supplier";
	}

	@RequestMapping(value = { "/admin/edit-supplier" }, method = { RequestMethod.POST })
	public String saveSupplier(@ModelAttribute("nhacc") NhaCC ncc, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		nhaCCRepositories.save(ncc);

		return "redirect:/admin/data-table-supplier";
	}

	@RequestMapping(value = { "/admin/add-supplier" }, method = { RequestMethod.GET })
	public String supplier(@ModelAttribute("nhacc") NhaCC ncc, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/NhaCCManagement/add-supplier";
	}
	@RequestMapping(value = { "/admin/add-supplier" }, method = { RequestMethod.POST })
	public String addSupplier(@ModelAttribute("nhacc") NhaCC ncc, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		nhaCCRepositories.save(ncc);
		
		return "redirect:/admin/data-table-supplier";
	}
}
