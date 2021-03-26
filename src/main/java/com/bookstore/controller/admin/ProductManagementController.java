package com.bookstore.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.bookstore.entities.NhaCC;
import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.NhaCCRepositories;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.services.ProductsServices;

@Controller
public class ProductManagementController {
	@Value("${file.upload.path}")
	private String attachmentPath;
	@Autowired
	ProductsServices productsServices;
	@Autowired
	ProductsRepositories productsRepositories;
	@Autowired
	CategoriesRepositories categoriesRepositories;
	@Autowired
	PhieuNhapRepositories phieuNhapRepositories;
	@Autowired
	NhaCCRepositories nhaCCRepositories;
	@Autowired
	ContactRepositories contactRepositories;

	@RequestMapping(value = { "/admin/dataTables" }, method = { RequestMethod.GET })
	public String dataTablesProducts(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("products", productsServices.findAllProducts());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/data-table-products";
	}

	@RequestMapping(value = { "/admin/removeProduct/{productsId}" }, method = { RequestMethod.GET })
	public String removeProducts(@PathVariable int productsId, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		productsRepositories.deleteById(productsId);
		model.addAttribute("products", productsServices.findAllProducts());
		
		return "redirect:/admin/dataTables";
	}

	@RequestMapping(value = { "/admin/addProduct" }, method = { RequestMethod.GET })
	public String addProduct(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("category", categoriesRepositories.findAll());
		HttpSession session = request.getSession();
		model.addAttribute("user", session.getAttribute("id"));
		model.addAttribute("ncc", nhaCCRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/ProductsManagement/addProducts";
	}

	@RequestMapping(value = { "/admin/add-product" }, method = { RequestMethod.POST })
	public String saveProducts(@RequestParam("image") MultipartFile productImage,
			@ModelAttribute("phieuNhap") PhieuNhap pn, Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		Products product = new Products();
		if (productImage != null && productImage.getSize() > 0) {
			productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
			product.setImgProduct(productImage.getOriginalFilename());

		}

		/* ====== save phieu nhap============== */
		Date date = new Date();

		pn.setPrice(pn.getAmount() * pn.getQuantity());
		pn.setCreateDate(date);

		/* ====== save sản phẩm============== */
		product.setCreateDate(date);
		product.setName(pn.getName());
		product.setPrice(pn.getAmount());
		product.setQuantity(pn.getQuantity());
		product.setDescribe(pn.getProduct().getDescribe());
		product.setStatus(pn.getProduct().getStatus());
		pn.setProduct(product);
		//NhaCC ncc = nhaCCRepositories.getOne(pn.getProduct().getNhaCC().getId());
		//product.setNhaCC(ncc);
		product.setAuthor(pn.getProduct().getAuthor());
		System.out.println("Author:" +pn.getProduct().getAuthor());
		productsRepositories.save(product);
		phieuNhapRepositories.save(pn);

		model.addAttribute("products", productsServices.findAllProducts());

		return "redirect:/admin/dataTables";
	}

	@RequestMapping(value = { "/admin/edit-product/{id}" }, method = { RequestMethod.GET })
	public String editProducts(@PathVariable int id, Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		Products products = productsRepositories.findById(id);
		model.addAttribute("products", products);
		model.addAttribute("category", categoriesRepositories.findAll());
		HttpSession sesion = request.getSession();
		sesion.setAttribute("date", products.getCreateDate());
		model.addAttribute("ncc", nhaCCRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "/admin/ProductsManagement/edit-product";
	}

	@RequestMapping(value = { "/admin/edit-product" }, method = { RequestMethod.POST })
	public String editSaveProducts(@RequestParam("image") MultipartFile productImage,
			@ModelAttribute("product") Products product, Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IllegalStateException, IOException, ParseException {
		HttpSession session = request.getSession();
		if (productImage != null && productImage.getSize() > 0) {
			productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
			product.setImgProduct(productImage.getOriginalFilename());

		}

		int phanTramGiamGia = product.getPercentDiscount();
		product.setDiscount(product.getPrice() / 100 * (100 - phanTramGiamGia));
		
		Date date = (Date) session.getAttribute("date");
		product.setCreateDate(date);
		productsRepositories.save(product);
		
		session.removeAttribute("date");
		return "redirect:/admin/dataTables";
	}
}
