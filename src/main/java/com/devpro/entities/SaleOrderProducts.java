package com.devpro.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProducts extends BaseEntity{


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Products product;
	
	@Column(name = "quality")
	private Integer quality;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOder saleOrder;
	
	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

	public SaleOder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOder saleOrder) {
		this.saleOrder = saleOrder;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}


	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	
}
