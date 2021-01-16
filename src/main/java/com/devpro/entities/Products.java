package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity{
	
	@Column(name = "title",length = 500,nullable = false)
	private String title;
	

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;

	
	@Column(name = "short_description",length = 3000,nullable = true)
	private String short_description;
	
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;
     
	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}
	
	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String shortDetails;

	@Column(name = "seo", nullable = false)
	private String seo;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER, orphanRemoval = true)
	private List<ProductImage> productImage = new ArrayList<ProductImage>();
	
	public List<ProductImage> getProductImage() {
		return productImage;
	}

	public void setProductImage(List<ProductImage> productImage) {
		this.productImage = productImage;
	}

	public void addProductImages(ProductImage _productImages) {
		_productImages.setProduct(this);
		productImage.add(_productImages);
	}
	
	public void removeProductImages(ProductImage _productImages) {
		_productImages.setProduct(null);
		productImage.remove(_productImages);
	}

	public void removeProductImages() {
		for(ProductImage productImages : productImage) {
			removeProductImages(productImages);
		}
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getShortDetails() {
		return shortDetails;
	}

	public void setShortDetails(String shortDetails) {
		this.shortDetails = shortDetails;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
