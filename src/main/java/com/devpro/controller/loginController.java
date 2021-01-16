package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.model.Login;

//import com.devpro.model.Login;

@Controller
public class loginController {

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("login", new Login());
		return "front-end/login";
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String save(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		System.out.println(email + " " + password);
		model.addAttribute("login", new Login());
		return "front-end/login";
	}

//	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
//	public String saveContact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
	// @ModelAttribute("login") Login login)
	// hứng dữ liệu từ sf đẩy lên
	// throws IOException {
//		System.out.println("First Name is: " + login.getEmail());
//		System.out.println("First Name is: " + login.getPassword());

	// hiển thị lại trang contact, dữ liệu phải để trống cho nguowif dùng nhập tiếp.
	// model.addAttribute("login", new Login());
	// return "front-end/login";
	// }
}
