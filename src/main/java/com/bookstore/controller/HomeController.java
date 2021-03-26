package com.bookstore.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.IsExisting;
import com.bookstore.dto.AjaxResponse;
import com.bookstore.entities.Cart;
import com.bookstore.entities.Products;
import com.bookstore.entities.ReviewProduct;
import com.bookstore.entities.Users;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.ReviewProductRepositories;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.services.CategoriesServices;
import com.bookstore.services.ProductsServices;

@Controller
public class HomeController {

	@Autowired
	ProductsServices productsServices;

	@Autowired
	ProductsRepositories productsRepositories;

	@Autowired
	CategoriesServices categoriesServices;

	@Autowired
	CartRepositories cartRepositories;
	
	@Autowired
	UserRepositories userRepositories;
	
	@Autowired
	ReviewProductRepositories reviewProductRepositories;

	@RequestMapping(value = { "/", "/index" }, method = { RequestMethod.GET })
	public String index(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		System.out.println("================================= Index ================================================");

		model.addAttribute("category", categoriesServices.findAllCategory());
		model.addAttribute("product", productsServices.findAll(4));
		model.addAttribute("product1", productsServices.showProductsByMinIdCategory(4));
		model.addAttribute("product2", productsServices.showProductsByMaxIdCategory(4));
		
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			int totalMoney = (int) IsExisting.totalMoney(carts);
			model.addAttribute("ThanhTien", totalMoney);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = { "/product/{id}-{title}" }, method = { RequestMethod.GET })
	public String product(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		int view = productsRepositories.view(id);
		Products product = productsRepositories.findById(id);
		model.addAttribute("product", product);
		model.addAttribute("rating", reviewProductRepositories.findAllByIdProduct(id));
		model.addAttribute("countComment", reviewProductRepositories.countComment(id));		
		if (productsRepositories.statusProduct(id) > 0) {
			model.addAttribute("status_product", "Còn trong kho");
		} else {
			model.addAttribute("status_product", "Không còn trong kho");
		}
		view++;
		productsRepositories.updateView(view, id);
		model.addAttribute("mostView", productsRepositories.mostView());
		try {
			int count = reviewProductRepositories.countComment(id);
			int sumRating= reviewProductRepositories.sumRating(id);
			System.out.println("cákjdcnajsdc "+ sumRating/count);
			model.addAttribute("avgStar", sumRating/count);
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			Users user = userRepositories.findById(Integer.parseInt(session.getAttribute("idUser").toString()));
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "products";
	}

	@RequestMapping(value = { "/gioi-thieu" }, method = { RequestMethod.GET })
	public String gioiThieu(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			Users user = userRepositories.findById(Integer.parseInt(session.getAttribute("idUser").toString()));
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "gioi-thieu";
	}
	@RequestMapping(value = { "/chinh-sach-bao-mat" }, method = { RequestMethod.GET })
	public String chinhSachBaoMat(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		
		try {
			HttpSession session = request.getSession();
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int quantity = carts.size();
			model.addAttribute("soLuongHang", quantity);
			Users user = userRepositories.findById(Integer.parseInt(session.getAttribute("idUser").toString()));
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "chinh-sach-bao-mat";
	}
	@RequestMapping(value = { "/addProduct" }, method = { RequestMethod.POST })
	public String addProduct(@ModelAttribute("product") Products product, Model model, BindingResult result,
			final HttpServletRequest request, final HttpServletResponse response) {
		int id = product.getId();
		HttpSession session = request.getSession();
		Products products = productsRepositories.findById(id);
		if (session.getAttribute("cart") == null) {
			List<Cart> carts = new ArrayList<Cart>();

			carts.add(new Cart(product.getId(), product.getQuantity(), product.getDiscount(),
					product.getQuantity() * product.getDiscount(), products));
			session.setAttribute("cart", carts);
		} else {
			List<Cart> carts = (List<Cart>) session.getAttribute("cart");
			int index = IsExisting.isExisting(id, carts);

			if (index == -1) {
				carts.add(new Cart(product.getId(), product.getQuantity(), product.getDiscount(),
						product.getQuantity() * product.getDiscount(), products));
			} else {
				int quantity = carts.get(index).getQuantity() + product.getQuantity();
				carts.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", carts);
		}

		return "redirect:/product/" + id + "-" + products.getName();
	}
	@PostMapping(value = "/comment")
	public ResponseEntity<AjaxResponse> api (@RequestBody final Map<String, Object> data // co the hung du lieu (thay map bang object)
			,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		ReviewProduct comment = new ReviewProduct();
		Users user = userRepositories.findById(Integer.parseInt(session.getAttribute("idUser").toString()));
		Products product = productsRepositories.findById(Integer.parseInt(data.get("idProduct").toString()));
		comment.setComment(String.valueOf(data.get("comment")));
		comment.setRating(Integer.parseInt(data.get("rating").toString()));
		comment.setUser(user);
		comment.setProduct(product);
		reviewProductRepositories.save(comment);
		
		return ResponseEntity.ok(new AjaxResponse("", 500));
	}
}
