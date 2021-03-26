package com.bookstore.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.IsExisting;
import com.bookstore.entities.Cart;
import com.bookstore.entities.HoaDon;
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
public class PayController {
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
	UserServices userServices;
	@Autowired
	HoaDonRepositories hoaDonRepositories;

	@Autowired
	HoaDonServices hoaDonServices;

	@PostMapping("/pay/addPay")
	public String savePay(@ModelAttribute("hoaDon") HoaDon hd, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			Date date = new Date();
			session.setAttribute("fullName", hd.getFullName());
			session.setAttribute("address", hd.getDeliveryAddress());
			session.setAttribute("mobile", hd.getEmail());
			session.setAttribute("date", date);
			session.setAttribute("pay", hd.isPay());
			session.setAttribute("idHoaDon", hd.getId());
			if (hd.getUser().getId() != null) {
				hd.setCreated(date);
				hoaDonRepositories.save(hd);
				for (int i = 0; i < cart.size(); i++) {
					cartServices.InsertCart(hd.getUser().getId(), cart.get(i).getDiscount(), cart.get(i).getMoney(),
							cart.get(i).getQuantity(), false, hd.getId(), cart.get(i).getProducts().getId());
				}
				
			} else {
				hd.setCreated(date);
				hoaDonServices.insert(hd);
				for (int i = 0; i < cart.size(); i++) {
					cartServices.InsertCart(hd.getUser().getId(), cart.get(i).getDiscount(), cart.get(i).getMoney(),
							cart.get(i).getQuantity(), false, hd.getId(), cart.get(i).getProducts().getId());

				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/thanks";
	}

	@RequestMapping(value = { "/thanks" }, method = { RequestMethod.GET })
	public String thank(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		quantity(model, request);

		return "thanks";
	}

	@RequestMapping(value = { "/remove-ordered/{id}" }, method = { RequestMethod.GET })
	public String removeOrdered(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		hoaDonServices.updateStatusDelete(id, true);

		return "redirect:/ordered";
	}

	@RequestMapping(value = { "/view-ordered/{id}" }, method = { RequestMethod.GET })
	public String viewOrdered(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("idUser") == null) {
			return "redirect:/login";
		}
		try {
			model.addAttribute("cart", cartServices.findByIdOrder(id));
			
			quantity(model, request);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "detail-order";
	}

	public void quantity(Model model, final HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int totalMoney = (int) IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
