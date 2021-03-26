package com.bookstore.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookstore.dto.AjaxResponse;
import com.bookstore.entities.Users;
import com.bookstore.services.CategoriesServices;
import com.bookstore.services.UserServices;

@Controller
public class RegisterController {
	@Autowired
	UserServices usserServices;

	@Autowired
	CategoriesServices categoriesServices;

	@RequestMapping(value = { "/account/register" }, method = { RequestMethod.GET })
	public String accountRegister(Model model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("category", categoriesServices.findAllCategory());

		return "signup";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("register") Users user, BindingResult result, Model model,
			final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {

		user.setStatus(false);
		Date date = new Date();
		user.setCreated(date);
		System.out.println("user: " + user.getPassword());
		System.out.println("userConfim: " + user.getConfimPassword());
		if (user.getPassword().toString().equals(user.getConfimPassword())) {
			if (usserServices.InsertUser(user) == true) {
				model.addAttribute("message", "Bạn đã đăng ký thành công!!!");
				return "redirect:account/register";
			}
		}else {
			model.addAttribute("message", "Bạn chưa đăng ký được vì nhập lại mật khẩu sai!!!");
		}
		return "redirect:/account/register";
	}

	/*@PostMapping(value = { "/register" })
	public ResponseEntity<AjaxResponse> saveContactViaBindData(@RequestBody final Map<String, Object> data,
			@ModelAttribute("register") Users user, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		
		// lưu dữ liệu vào database.
		user.setStatus(false);
		Date date = new Date();
		user.setCreated(date);
		user.setEmail(String.valueOf(data.get("email")));
		user.setDienThoai(Integer.parseInt((String) data.get("dienThoai")));
		user.setDiaChi(String.valueOf(data.get("diaChi")));
		user.setName(String.valueOf(data.get("name")));
		user.setPassword(String.valueOf(data.get("password")));
		user.setPassword(String.valueOf(data.get("confimPassword")));
		String pass = user.getPassword();
		String passConfim = user.getConfimPassword();
		if (pass.toString().equals(passConfim)) {
			if (usserServices.InsertUser(user) == true) {
				// trả về thông báo cho người dùng.
				model.addAttribute("message", "success");
			}
		}else {
			model.addAttribute("message", "false");
		}

		// trả về tên view./
		return ResponseEntity.ok(new AjaxResponse("Bạn đã gửi thành công!", 500));
	}*/
}
