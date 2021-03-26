package com.bookstore.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.bookstore.entities.Products;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.NhaCCRepositories;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.services.ProductsServices;

@Controller
public class WarehouseManagementController {
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
	
	@RequestMapping(value = { "/admin/kho-hang" }, method = { RequestMethod.GET })
	public String dataTablesProducts(Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		model.addAttribute("products", productsServices.findAllProducts());

		return "admin/NhapKhoManagement/data-table-warehouse";
	}
	
}
