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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookstore.CheckLogIn;
import com.bookstore.entities.Admin;
import com.bookstore.entities.Post;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.repositories.PostRepositories;

@Controller
public class PostManagementController {
	@Autowired
	PostRepositories postRepositories;
	@Autowired
	AdminRepositories adminRepositories;
	@Autowired
	ContactRepositories contactRepositories;
	@Value("${file.upload.path}")
	private String attachmentPath;
	
	@RequestMapping(value = { "/admin/post" }, method = { RequestMethod.GET })
	public String listPost(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("post", postRepositories.findAll());
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/PostManagement/data-table-post";
	}
	@RequestMapping(value = { "/admin/add-post" }, method = { RequestMethod.GET })
	public String addPost(Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		return "admin/PostManagement/add-post";
	}
	@RequestMapping(value = "/admin/addPost", method = RequestMethod.POST)
	public String savePost(@RequestParam("postImage") MultipartFile postImage, @ModelAttribute("post") Post post,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		if (postImage != null && postImage.getSize() > 0) {
			
			post.setImage(postImage.getOriginalFilename());

			// lưu file vào folder trên server.
			// E:/web-tintuc/Nhom13-web/src/main/resources/META-INF/img/upload/abc.jpeg

			postImage.transferTo(new File(attachmentPath + "/" + postImage.getOriginalFilename()));
		}

		Date now = new Date();
		Date createdDate = new Date(now.getTime());
		post.setCreatedDate(createdDate);

		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		Admin admin = adminRepositories.getOne(id);
		post.setAdmin(admin);
		
		postRepositories.save(post);

		return "redirect:/admin/post";
	}
	@RequestMapping(value = { "/admin/edit-post/id={id}" }, method = { RequestMethod.GET })
	public String editPost(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		Post post = postRepositories.getOne(id);
		model.addAttribute("post", post);
		model.addAttribute("contactHeader", contactRepositories.findAll(false));
		
		return "admin/PostManagement/edit-post";
	}
	@RequestMapping(value = { "/admin/edit-post" }, method = { RequestMethod.POST })
	public String savePostViaBindData(@RequestParam("postImage") MultipartFile postImage,
			@ModelAttribute("post") Post post, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IllegalStateException, IOException {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		if (postImage != null && postImage.getSize() > 0) {
			
			post.setImage(postImage.getOriginalFilename());

			// lưu file vào folder trên server.
			// E:/web-tintuc/Nhom13-web/src/main/resources/META-INF/img/upload/abc.jpeg

			postImage.transferTo(new File(attachmentPath + "/" + postImage.getOriginalFilename()));
		}
		Date now = new Date();
		Date createdDate = new Date(now.getTime());
		post.setCreatedDate(createdDate);
		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		Admin admin = adminRepositories.getOne(id);
		post.setAdmin(admin);
		postRepositories.save(post);

		// trả về tên view.
		return "redirect:/admin/post";
	}
	
	@RequestMapping(value = { "/admin/remove-post/{id}" }, method = { RequestMethod.GET })
	public String removePost(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {
		if (CheckLogIn.Check(request) == false) {
			return "redirect:/admin/login";
		}
		postRepositories.deleteById(id);
		
		return "redirect:/admin/post";
	}
}
