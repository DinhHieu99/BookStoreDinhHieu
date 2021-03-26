package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.IsExisting;
import com.bookstore.entities.Cart;
import com.bookstore.entities.Users;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.services.CategoriesServices;
import com.bookstore.services.NhaCCServices;
import com.bookstore.services.ProductsServices;

@Controller
public class CategoryController {
	@Autowired
	ProductsServices productsServices;

	@Autowired
	CategoriesServices categoriesServices;

	@Autowired
	NhaCCServices nhaCCServices;

	@Autowired
	CartRepositories cartRepositories;
	
	@RequestMapping(value = { "/category/{id}-{title}" }, method = { RequestMethod.GET })
	public String category(@PathVariable int id, @PathVariable String title, Model model,
			final HttpServletRequest request, final HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			double totalMoney = IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("category", categoriesServices.findAllCategory());
		model.addAttribute("product", productsServices.findAllByIdCategory(id));
		model.addAttribute("category_sort", id);
		model.addAttribute("category_name", title);
		model.addAttribute("nhacc", nhaCCServices.findAll());
		quantity(model, request);
		return "category";
	}

	

	@RequestMapping(value = { "/category/{title}/id={id}&name={name}&order={sort}" }, method = { RequestMethod.GET })
	public String category(@PathVariable int id, @PathVariable String title, @PathVariable String name,
			@PathVariable String sort, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			double totalMoney = IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("category", categoriesServices.findAllCategory());
		model.addAttribute("product", productsServices.sortName(id, name, sort));
		model.addAttribute("category_sort", id);
		model.addAttribute("category_name", title);
		quantity(model, request);
		return "category";
	}
	public void quantity(Model model, final HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
