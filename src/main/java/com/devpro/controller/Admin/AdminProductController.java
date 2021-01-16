package com.devpro.controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.entities.Products;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

@Controller // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
			// -> báo module web mapping request cho controller này.
public class AdminProductController extends BaseController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ProductRepo productRepo;
	
	@RequestMapping(value = { "/admin/themsanpham" }, method = RequestMethod.GET)
	public String themsanpham(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
        model.addAttribute("products", new Products());
		return "back-end/themsanpham";
	}

	@RequestMapping(value = { "/admin/themsanpham/list" }, method = RequestMethod.GET)
	public String product(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("messsage", "");
		String messsage = request.getParameter("add");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("messsage", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Thêm mới thành công." + 
					"</div>");
		}
        model.addAttribute("productes", productRepo.findAll());
		return "back-end/product";
	}    
	
	
	@RequestMapping(value = { "/admin/themsanpham" }, method = RequestMethod.POST)
	public String saveProduct(@RequestParam("product_image") MultipartFile[] productImage,@ModelAttribute("products") Products products,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		    productService.save(productImage, products);
		    return "redirect:/admin/themsanpham/list?add=success";
	}
	
	
	@RequestMapping(value = { "/admin/themsanpham/{id}" }, method = RequestMethod.GET)
	public String saveProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Products product = productRepo.getOne(id);
		model.addAttribute("products", product);
		return "back-end/themsanpham";
	}
	
	
//	xóa sp
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String xoa(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
        model.addAttribute("productes",productRepo.findAll());
		return "back-end/product";
	}
	
	@RequestMapping(value = { "/admin/product/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Products product = productRepo.getOne(id);
		productRepo.delete(product);
		model.addAttribute("productes", productRepo.findAll());
		return "back-end/product";
	}
	
	
}
