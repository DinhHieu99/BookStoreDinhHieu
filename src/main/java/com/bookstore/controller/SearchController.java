package com.bookstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.services.CategoriesServices;
import com.bookstore.services.NhaCCServices;
import com.bookstore.services.SearchSevices;

@Controller
public class SearchController {
	@Autowired
	SearchSevices searchSevices;

	@Autowired
	CategoriesServices categoriesServices;

	@Autowired
	NhaCCServices nhaCCServices;

	@Autowired
	public SearchSevices getSearchSevices() {
		return searchSevices;
	}

	@Autowired
	public void setSearchSevices(SearchSevices searchSevices) {
		this.searchSevices = searchSevices;
	}
	
	@RequestMapping(value = "/living-search", method = { RequestMethod.GET })
	public String livingSearch(ModelMap model,
			@RequestParam(defaultValue = "cxvxczgbfdgfdgdfghfd") String nameProduct) {
		model.addAttribute("searchProduct", searchSevices.selectNameProduct("%" + nameProduct + "%"));
		return "ajax/living-search";
	}
	
	@GetMapping("/products/search")
	public String searchPost(Model model, @RequestParam(defaultValue = "") String search_query,
			final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());
		model.addAttribute("nhacc", nhaCCServices.findAll());
		model.addAttribute("searchProduct", searchSevices.selectNameProduct(search_query));
		
		return "search";
	}

}
