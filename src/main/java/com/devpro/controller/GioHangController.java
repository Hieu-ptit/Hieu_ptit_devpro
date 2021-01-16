package com.devpro.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.GioHang;
import com.devpro.entities.Products;
import com.devpro.entities.SaleOder;
import com.devpro.entities.SaleOrderProducts;
import com.devpro.entities.SanPhamTrongGioHang;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;

@Controller
public class GioHangController {

	@Autowired
	ProductRepo productRepo;
	
	@Autowired 
	SaleOrderRepo saleOrderRepo;
	
	@RequestMapping(value = { "/chon-san-pham-dua-vao-gio-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> muaHang(@RequestBody SanPhamTrongGioHang sanPhamTrongGioHang,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession httpSession = request.getSession();

		GioHang gioHang = null;
		BigDecimal tongTien = BigDecimal.ZERO;

		if (httpSession.getAttribute("GIO_HANG") != null) {
			gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		} else {
			gioHang = new GioHang();
			httpSession.setAttribute("GIO_HANG", gioHang);
		}

		List<SanPhamTrongGioHang> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();
		boolean sanPhamDaCoTrongGioHangPhaiKhong = false;

		// trường hợp đã có sản phẩm trong giỏ hàng.
		for (SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
				sanPhamDaCoTrongGioHangPhaiKhong = true;
				item.setSoluong(item.getSoluong() + sanPhamTrongGioHang.getSoluong());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng.
		if (!sanPhamDaCoTrongGioHangPhaiKhong) {

			Products product = productRepo.getOne(sanPhamTrongGioHang.getMaSanPham());
			sanPhamTrongGioHang.setTenSanPham(product.getTitle());
			sanPhamTrongGioHang.setGiaban(product.getPriceSale());
			sanPhamTrongGioHang.setPathImage(product.getProductImage().get(0).getPath());

			gioHang.getSanPhamTrongGioHangs().add(sanPhamTrongGioHang);
		}
		
		for(SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			tongTien = tongTien.add(item.getGiaban().multiply(new BigDecimal(item.getSoluong())));
		}

//		httpSession.setAttribute("SL_SP_GIO_HANG", cart.getCartItems().size());
		httpSession.setAttribute("TONG_TIEN_GIO_HANG", tongTien);
		httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getSanPhamTrongGioHangs().size());
	//location.load

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size())));
	}
	
	@RequestMapping(value = { "/sua-san-pham-dua-vao-gio-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> suaSanPham(@RequestBody SanPhamTrongGioHang sanPhamTrongGioHang,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession httpSession = request.getSession();

		GioHang gioHang = null;
		BigDecimal tongTien = BigDecimal.ZERO;

		if (httpSession.getAttribute("GIO_HANG") != null) {
			gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		} 

		List<SanPhamTrongGioHang> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();
		boolean sanPhamDaCoTrongGioHangPhaiKhong = false;

		// trường hợp đã có sản phẩm trong giỏ hàng.
		for (SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
				//sanPhamDaCoTrongGioHangPhaiKhong = true;
				//item.setSoluong(item.getSoluong());
				item.setSoluong(item.getSoluong() + sanPhamTrongGioHang.getSoluong());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng.
//		if (!sanPhamDaCoTrongGioHangPhaiKhong) {
//
//			Products product = productRepo.getOne(sanPhamTrongGioHang.getMaSanPham());
//			sanPhamTrongGioHang.setTenSanPham(product.getTitle());
//			sanPhamTrongGioHang.setGiaban(product.getPriceSale());
//			sanPhamTrongGioHang.setPathImage(product.getProductImage().get(0).getPath());
//
//			gioHang.getSanPhamTrongGioHangs().add(sanPhamTrongGioHang);
//		}
		
		for(SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			tongTien = tongTien.add(item.getGiaban().multiply(new BigDecimal(item.getSoluong())));
		}

//		httpSession.setAttribute("SL_SP_GIO_HANG", cart.getCartItems().size());
		httpSession.setAttribute("TONG_TIEN_GIO_HANG", tongTien);
		httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getSanPhamTrongGioHangs().size());
	//location.load

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size())));
	}
	
	@RequestMapping(value = { "/xoa-san-pham-dua-vao-gio-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> XoaSanPham(@RequestBody SanPhamTrongGioHang sanPhamTrongGioHang,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession httpSession = request.getSession();
		BigDecimal tongTien = BigDecimal.ZERO;

		GioHang gioHang = null;
		//BigDecimal tongTien = BigDecimal.ZERO;

		if (httpSession.getAttribute("GIO_HANG") != null) {
			gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		}

		List<SanPhamTrongGioHang> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();
		// trường hợp đã có sản phẩm trong giỏ hàng.
		if(_sanPhamTrongGioHangs != null) {
			SanPhamTrongGioHang spXoa = new SanPhamTrongGioHang();
			for (SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
				if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
					spXoa = item; 
				}
			}
			_sanPhamTrongGioHangs.remove(spXoa);
		}
		
		
		httpSession.removeAttribute("GIO_HANG");
		gioHang.setSanPhamTrongGioHangs(_sanPhamTrongGioHangs);
		httpSession.setAttribute("GIO_HANG", gioHang);
		for(SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			tongTien = tongTien.add(item.getGiaban().multiply(new BigDecimal(item.getSoluong())));
		}
//		httpSession.setAttribute("SL_SP_GIO_HANG", cart.getCartItems().size());
		httpSession.setAttribute("TONG_TIEN_GIO_HANG", tongTien);
		httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getSanPhamTrongGioHangs().size());
	//location.load

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size())));
	}

	@RequestMapping(value = { "/hien-thi-san-pham-trong-gio-hang" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
//		model.addAttribute("total", saleOrderRepo.findAll());
		BigDecimal tongTien = (BigDecimal) (request.getSession().getAttribute("TONG_TIEN_GIO_HANG") == null?BigDecimal.ZERO:request.getSession().getAttribute("TONG_TIEN_GIO_HANG"));
		model.addAttribute("total", tongTien.toString());
		return "front-end/hien-thi-san-pham-trong-gio-hang";
	}
	
	@RequestMapping(value = { "/luu_don_hang" }, method = RequestMethod.POST)
	public String save(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		
		GioHang gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		
		String name = request.getParameter("name");
		httpSession.setAttribute("Name",request.getParameter("name") );
		String email = request.getParameter("email");
		httpSession.setAttribute("Email",request.getParameter("email") );
		String phone = request.getParameter("phone");
		httpSession.setAttribute("Phone",request.getParameter("phone") );
		String address = request.getParameter("address");
		httpSession.setAttribute("Address",request.getParameter("address") );
		
		SaleOder saleOrder = new SaleOder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setCreatedDate(LocalDateTime.now());
		saleOrder.setCustomerName(name);
		saleOrder.setCustomerAddress(address);
		saleOrder.setTotal(gioHang.getTotal(productRepo));
		
		for(SanPhamTrongGioHang sanPhamTrongGioHang : gioHang.getSanPhamTrongGioHangs()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(sanPhamTrongGioHang.getMaSanPham()));
			saleOrderProducts.setQuality(sanPhamTrongGioHang.getSoluong());
			saleOrderProducts.setCreatedDate(LocalDateTime.now());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		model.addAttribute("NAME", httpSession.getAttribute("Name"));
		model.addAttribute("PHONE", httpSession.getAttribute("Phone"));
		model.addAttribute("EMAIL", httpSession.getAttribute("Email"));
		model.addAttribute("ADDRESS", httpSession.getAttribute("Address"));
		
		saleOrderRepo.save(saleOrder);
		
		// lưu xong xoá giỏ hàng đi
		httpSession.removeAttribute("GIO_HANG");
		httpSession.removeAttribute("SL_SP_GIO_HANG");
//		return "redirect:/";
//		request.setAttribute("CURRENT_PAGE", 0);
		
		return "front-end/message";
	}
}
