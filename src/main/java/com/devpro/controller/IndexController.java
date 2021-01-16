package com.devpro.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Constants;
import com.devpro.entities.Category;
import com.devpro.model.AjaxResponse;
import com.devpro.model.ProductSearch;
import com.devpro.model.subscribe;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

/**
 * 
 * @author admin
 *
 */
@Controller // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
			// -> báo module web mapping request cho controller này.
public class IndexController extends BaseController implements Constants{
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private ProductService productService;
	/**
	 * 
	 * @param model: trung gian trao đổi thông tin giữa Controller và View(Jsp)
	 * @param request: Chứa các thông tin Trình Duyệt truy vấn thông qua mẫu: ?abc=xyz
	 * @param response: Dữ liệu trả về Trình Duyệt.
	 * @return
	 * @throws Exception
	 */
	@Autowired
	private CategoryRepo Categoryrepo;
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute(CURRENTCATEGORYSEO);
		Integer currentPage = 0;
		ProductSearch productSearch = new ProductSearch();
		String strCurrentPage = request.getParameter("page");
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
		productSearch.setCurrentPage(currentPage);
		
		String keyword = request.getParameter("keyword");
		if(keyword != null && !"".equals(keyword)) {
			productSearch.setName(keyword);
		}
		
		model.addAttribute("products", productService.search(productSearch));
		
		request.setAttribute("CURRENT_PAGE", currentPage.intValue());
//		request.setAttribute("MAX_PAGE", currentPage.intValue());
		
		//List<Category> categories = Categoryrepo.findAll();
		//model.addAttribute("categories", categories);
		
		return "front-end/index";
	}
	
//	@RequestMapping(value = { "/?keyword={keyword}" }, method = RequestMethod.GET)
//	public String index1(@PathVariable("keyword") String keyword,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
//			throws Exception {
//		System.out.println(keyword);
//		HttpSession httpSession = request.getSession();
//		httpSession.removeAttribute(CURRENTCATEGORYSEO);
//		Integer currentPage = 0;
//		ProductSearch productSearch = new ProductSearch();
//		String strCurrentPage = request.getParameter("page");
//		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
//		productSearch.setCurrentPage(currentPage);
//		productSearch.setName(keyword);
//		model.addAttribute("products", productService.search(productSearch));
//		return "front-end/index";
//	}
	
	@RequestMapping(value = { "/product/details/index" }, method = RequestMethod.GET)
	public String index2(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Integer currentPage = 0;
		ProductSearch productSearch = new ProductSearch();
		String strCurrentPage = request.getParameter("page");
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
		productSearch.setCurrentPage(currentPage);
		model.addAttribute("products", productService.search(productSearch));
		return "front-end/index";
	}
	
	
	@RequestMapping(value = { "/danhmuc" }, method = RequestMethod.GET)
	public String danhmuc(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		return "front-end/danhmuc";
	}
	

	@RequestMapping(value = { "/chitiet" }, method = RequestMethod.GET)
	public String chitiet(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		return "front-end/chitiet";
	}
}
