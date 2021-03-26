package com.bookstore.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;

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
import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.NhaCCRepositories;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.services.ProductsServices;

@Controller
public class PhieuNhapManagementController {
	@Value("${file.upload.path}")
	private String attachmentPath;
	@Autowired
	ProductsServices productsServices;
	@Autowired
	ProductsRepositories productsRepositories;
	@Autowired
	PhieuNhapRepositories phieuNhapRepositories;
	@Autowired
	CategoriesRepositories categoriesRepositories;
	@Autowired
	AdminRepositories adminRepositories;
	@Autowired
	NhaCCRepositories nhaCCRepositories;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/thong-ke-nhap-hang" }, method = { RequestMethod.GET })
	public String nhapHang(Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("phieuNhap", phieuNhapRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/NhapKhoManagement/data-table-nhap";
	}
	@RequestMapping(value = { "/admin/phieu-nhap-hang" }, method = { RequestMethod.GET })
	public String TKNhapHang(Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("products", productsServices.findAllProducts());
		
		return "admin/NhapKhoManagement/data-table-warehouse";
	}
	@RequestMapping(value = { "/admin/nhap-hang/id={id}" }, method = { RequestMethod.GET })
	public String addNhapHang(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		HttpSession session = request.getSession();
		model.addAttribute("category", categoriesRepositories.findAll());
		Products products = productsRepositories.getOne(id);
		model.addAttribute("products", products);
		model.addAttribute("user", session.getAttribute("id"));
		
		model.addAttribute("ncc", nhaCCRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/NhapKhoManagement/Nhap-kho";
	}

	@RequestMapping(value = { "/admin/nhap-san-pham" }, method = { RequestMethod.POST })
	public String saveNhapHang(@RequestParam("image") MultipartFile productImage,
			@ModelAttribute("product") Products product, Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		if (productImage != null && productImage.getSize() > 0) {
			productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
			product.setImgProduct(productImage.getOriginalFilename());
		}
		HttpSession session = request.getSession();
		Date date = new Date();
		PhieuNhap pn = new PhieuNhap();
		pn.setName(product.getName());
		pn.setQuantity(product.getSoLuongNhap());
		pn.setAmount(product.getPrice());
		pn.setPrice(product.getPrice() * product.getSoLuongNhap());

		pn.setProduct(product);
		int id = Integer.parseInt(session.getAttribute("id").toString());
		Admin admin = adminRepositories.getOne(id);
		pn.setAdmin(admin);
		pn.setCreateDate(date);

		product.setQuantity(product.getQuantity() + product.getSoLuongNhap());
		product.setDiscount(product.getPrice() / 100 * (100 - product.getPercentDiscount()));
		Date date1 = new Date();
		product.setCreateDate(date1);
		productsRepositories.save(product);
		phieuNhapRepositories.save(pn);
		
		return "redirect:/admin/kho-hang";
	}
}
