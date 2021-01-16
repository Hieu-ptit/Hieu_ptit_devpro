package com.devpro.controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.controller.BaseController;
import com.devpro.repositories.ProductRepo;


@Controller
public class AdminController extends BaseController{
	   
		@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
		public String login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
				throws Exception {
	      //  model.addAttribute("admin1", new Admin1());
			return "back-end/admin";
		}

	//	@RequestMapping(value = { "/admin" }, method = RequestMethod.POST)
	//	public String save(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
	//			@ModelAttribute("admin1") Admin1 admin1) throws Exception {
    //        System.out.println("Mã sản phẩm : " +admin1.getMaSP());
   //         System.out.println("Tên sản phẩm : " +admin1.getTenSP());
    //        System.out.println("giá sản phẩm : "+admin1.getPrice());
	//		model.addAttribute("admin1", new Admin1());
	//		return "front-end/admin";
	//	}

}



