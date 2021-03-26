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
import com.bookstore.entities.Post;
import com.bookstore.entities.Users;
import com.bookstore.repositories.PostRepositories;

@Controller
public class PostController {
	@Autowired
	PostRepositories postRepositories;

	@RequestMapping(value = { "/post" }, method = { RequestMethod.GET })
	public String post(Model model, final HttpServletRequest request, final HttpServletResponse response) {
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
		model.addAttribute("post", postRepositories.findAll());
		model.addAttribute("postmost", postRepositories.getView());
		return "list-post";
	}
	@RequestMapping(value = { "/post/{id}-{title}" }, method = { RequestMethod.GET })
	public String Post(@PathVariable int id, @PathVariable String title,  Model model, final HttpServletRequest request, final HttpServletResponse response) {
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
		Post post = postRepositories.getOne(id);
		int view = postRepositories.findViewById(id);
		view++;
		postRepositories.updateViewById(view, id);
		model.addAttribute("post", post);
		return "post";
	}
}
