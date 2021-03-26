package com.bookstore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.IsExisting;
import com.bookstore.entities.Cart;
import com.bookstore.entities.Products;
import com.bookstore.entities.Users;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.repositories.HoaDonRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.services.CartServices;
import com.bookstore.services.CategoriesServices;
import com.bookstore.services.HoaDonServices;
import com.bookstore.services.UserServices;

@Controller
public class CartController {
	@Autowired
	CategoriesServices categoriesServices;

	@Autowired
	CartServices cartServices;
	@Autowired
	CartRepositories cartRepositories;
	@Autowired
	UserRepositories userRepositories;

	@Autowired
	ProductsRepositories productsRepositories;
	@Autowired
	HoaDonRepositories hoaDonRepositories;
	@Autowired
	HoaDonServices hoaDonServices;
	@Autowired
	UserServices userServices;

	@RequestMapping(value = { "/carts" }, method = { RequestMethod.GET })
	public String cart(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			double totalMoney = IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "carts";
	}

	@RequestMapping(value = { "/addCart-{id}" }, method = { RequestMethod.GET })
	public String addcart(@PathVariable int id, @ModelAttribute("cart") Cart cart, BindingResult result, Model model,
			final HttpServletRequest request, final HttpServletResponse response) {

		HttpSession session = request.getSession();
		Products product = productsRepositories.findById(id);
		if (session.getAttribute("cart") == null) {
			List<Cart> carts = new ArrayList<Cart>();
			
			carts.add(new Cart(product.getId(), 1, product.getDiscount(), 1 * product.getDiscount(), product));
			session.setAttribute("cart", carts);

		} else {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int index = IsExisting.isExisting(id, carts);

			if (index == -1) {
				carts.add(new Cart(product.getId(), 1, product.getDiscount(), 1 * product.getDiscount(), product));
			} else {
				int quantity = carts.get(index).getQuantity() + 1;
				carts.get(index).setQuantity(quantity);
				carts.get(index).setMoney(quantity* product.getDiscount());
			}
			session.setAttribute("cart", carts);
		}
		return "redirect:/index";
	}

	@RequestMapping(value = { "/pay" }, method = { RequestMethod.GET })
	public String pay(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		HttpSession session = request.getSession();
		try {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			int totalMoney = (int) IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			int id = Integer.parseInt(session.getAttribute("idUser").toString());
			Users user = userRepositories.findById(id);
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "thanh-toan";
	}

	@RequestMapping(value = { "/removeProduct-{id}" }, method = { RequestMethod.GET })
	public String deleteCart(@PathVariable Integer id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());

		HttpSession session = request.getSession();
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		int index = IsExisting.isExisting(id, cart);
		cart.remove(index);

		session.setAttribute("cart", cart);

		if (cart.size() == 0)
			session.removeAttribute("cart");

		return "redirect:/carts";
	}
	@RequestMapping(value = { "/removeCart-{id}" }, method = { RequestMethod.GET })
	public String deleteTopCart(@PathVariable Integer id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());

		HttpSession session = request.getSession();
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		int index = IsExisting.isExisting(id, cart);
		cart.remove(index);

		session.setAttribute("cart", cart);

		if (cart.size() == 0)
			session.removeAttribute("cart");

		return "redirect:/index";
	}
	@RequestMapping(value = { "/editProduct-{id}" }, method = { RequestMethod.POST })
	public String editCart(@PathVariable Integer id, @ModelAttribute("cart") Cart cart, Model model,
			final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		HttpSession session = request.getSession();
		List<Cart> carts = (List<Cart>) session.getAttribute("cart");
		int index = IsExisting.isExisting(id, carts);
		int idProduct = cart.getProducts().getId();
		Products product = productsRepositories.findById(idProduct);
		cart.setProducts(product);
		cart.setMoney(cart.getDiscount() * cart.getQuantity());
		carts.set(index, cart);

		for (int i = 0; i < carts.size(); i++) {
			System.out.println(carts.get(i).getMoney());
		}

		session.setAttribute("cart", carts);

		return "redirect:carts";
	}

	@RequestMapping(value = { "/ordered" }, method = { RequestMethod.GET })
	public String ordered(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		try {
			HttpSession session = request.getSession();
			int id = Integer.parseInt(session.getAttribute("idUser").toString());
			System.out.println("id user: " +id);
			model.addAttribute("order", hoaDonServices.findAllByIdUser(id));
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			int totalMoney = (int) IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "ordered";
	}

}