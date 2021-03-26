package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.CheckLogIn;
import com.bookstore.entities.HoaDon;
import com.bookstore.entities.Products;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.HoaDonRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.services.HoaDonServices;
import com.bookstore.services.ProductsServices;

@Controller
public class PayManagementController {
	@Autowired
	HoaDonRepositories hoaDonRepositories;

	@Autowired
	HoaDonServices hoaDonServices;

	@Autowired
	ProductsRepositories productsRepositories;

	@Autowired
	ProductsServices productsServices;

	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/hoa-don" }, method = { RequestMethod.GET })
	public String hoaDon(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("hoaDon", hoaDonRepositories.findAll());
		return "admin/data-table-pay";
	}

	@RequestMapping(value = { "/admin/hoa-don/{id}-{status}" }, method = { RequestMethod.GET })
	public String updateHoaDon(@PathVariable int id, @PathVariable int status, Model model,
			final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		HoaDon hd = hoaDonRepositories.findById(id);
		hoaDonServices.updateStatus(id, status);
		return "redirect:/admin/hoa-don";
	}

	@RequestMapping(value = { "/admin/remove-hoa-don/{id}" }, method = { RequestMethod.GET })
	public String removeHoaDon(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		HoaDon hd = hoaDonRepositories.findById(id);

		hoaDonRepositories.deleteById(id);

		return "redirect:/admin/hoa-don";
	}

	@RequestMapping(value = { "/admin/ban-hang" }, method = { RequestMethod.GET })
	public String banHang(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("hoaDon", hoaDonRepositories.findAll());
		return "admin/ThongKeManagement/Ban-hang";
	}

	@GetMapping("/admin/search")
	public String searchDate(Model model, @RequestParam(defaultValue = "") String search_date,
			final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("hoaDon", hoaDonServices.selectHoaDon(search_date));
		int tongTien = hoaDonRepositories.sumMoneyByDate(search_date);
		model.addAttribute("TongTien", tongTien);

		return "admin/ThongKeManagement/Ban-hang";
	}

	@GetMapping("/admin/searchMonth")
	public String searchMonth(Model model, @RequestParam(defaultValue = "") String search_month,
			final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		String[] parts = search_month.split("-");
		String month = parts[1];
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("hoaDon", hoaDonServices.selectHoaDonByMonth(month));
		int tongTien = hoaDonRepositories.sumMoneyByMonth(Integer.parseInt(month));
		model.addAttribute("TongTien", tongTien);
		return "admin/ThongKeManagement/Ban-hang";
	}
}
