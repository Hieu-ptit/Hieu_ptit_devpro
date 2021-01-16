package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.devpro.repositories.ProductRepo;

public class GioHang {
       private List<SanPhamTrongGioHang> sanPhamTrongGioHangs = new ArrayList<SanPhamTrongGioHang>();

	public List<SanPhamTrongGioHang> getSanPhamTrongGioHangs() {
		return sanPhamTrongGioHangs;
	}

	public void setSanPhamTrongGioHangs(List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
		this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
	}


	public BigDecimal getTotal(ProductRepo productRepo) {
		BigDecimal decimal = BigDecimal.ZERO;
		for(SanPhamTrongGioHang phamTrongGioHang : sanPhamTrongGioHangs) {
			Products product = productRepo.getOne(phamTrongGioHang.getMaSanPham());
			decimal = decimal.add(new BigDecimal(product.getPriceSale().doubleValue()*phamTrongGioHang.getSoluong()));
		}
		return decimal;
	}
	
	
	
 }
