package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.model.Cart;

@Controller 
public class cartController {
	@RequestMapping(value = { "/product/details/cart" }, method = RequestMethod.GET)
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
        model.addAttribute("cart", new Cart());
		return "front-end/cart";
	}

	
	@RequestMapping(value = { "/product/details/cart" }, method = RequestMethod.POST)
	public String cart1(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("cart") Cart cart)
			throws Exception {
		    System.out.println("Họ tên : "+cart.getName());
		    System.out.println("Số điện thoại:" +cart.getPhone());
		    System.out.println("Email : "+cart.getEmail());
		    System.out.println("Địa chỉ :"+cart.getAddress());
		    System.out.println("Ghi chú :"+cart.getNote());
		    model.addAttribute("cart", new Cart());
		    return "front-end/cart";
	}
}
