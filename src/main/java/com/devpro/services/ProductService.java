package com.devpro.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Products;
import com.devpro.entities.ProductImage;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;

@Service // -> Bean
public class ProductService {

	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	private ProductRepo productRepo;

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;
		return false;
	}

	/**
	 * Lưu sản phẩm và ảnh sản phẩm.
	 * 
	 * @param productImages
	 * @param product
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	public void save(MultipartFile[] productImages, Products product) throws IllegalStateException, IOException {

		if (!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
			for (MultipartFile productImage : productImages) {

				// lưu vật lí
				productImage.transferTo(
						new File("D:\\Template\\com.devpro\\upload1\\" + productImage.getOriginalFilename()));

				ProductImage _productImages = new ProductImage();
				_productImages.setPath(productImage.getOriginalFilename());
				_productImages.setTitle(productImage.getOriginalFilename());
				product.addProductImages(_productImages);
			}
		}

		productRepo.save(product);
	}

	public void delete(MultipartFile[] productImages, Products product) throws IllegalStateException, IOException {

		if (product.getId() != null) { // chỉnh sửa
			// lấy dữ liệu cũ của sản phẩm
			Products productInDb = productRepo.findById(product.getId()).get();

			if (!isEmptyUploadFile(productImages)) { // nếu admin sửa ảnh sản phẩm
				// lấy danh sách ảnh cũ của sản phẩm
				List<ProductImage> oldProductImages = productInDb.getProductImage();

				// xoá ảnh cũ trên vật lí(host)
				for (ProductImage _images : oldProductImages) {
					new File("D:\\Template\\com.devpro\\upload1\\" + _images.getPath()).delete();
				}

				// xoá ảnh trên database
				product.removeProductImages();

			} else { // ảnh phải giữ nguyên
				product.setProductImage(productInDb.getProductImage());
			}

		}

		if (!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
			for (MultipartFile productImage : productImages) {

				// lưu vật lí
				productImage.transferTo(
						new File("D:\\Template\\com.devpro\\upload1\\" + productImage.getOriginalFilename()));

				ProductImage _productImages = new ProductImage();
				_productImages.setPath(productImage.getOriginalFilename());
				_productImages.setTitle(productImage.getOriginalFilename());
				product.removeProductImages(_productImages);
			}
		}

		productRepo.delete(product);
	}

	/**
	 * Tìm kiếm sản phẩm.
	 * 
	 * @param productSearch
	 * @return
	 */
	public List<Products> search(final ProductSearch productSearch) {
//		String jpql = "Select caijcungduoc from Product caijcungduoc";
//		Query query = entityManager.createQuery(jpql, Product.class);

		String sql = "select * from tbl_products where 1=1";

		if (productSearch != null && productSearch.getCategoryId() != null) {
			sql = sql + " and category_id=" + productSearch.getCategoryId();
		}
		if (productSearch != null && productSearch.getId() != null) {
			sql = sql + " and id=" + productSearch.getId();
		}

		// tìm kiếm theo seo của category
		if (productSearch != null && productSearch.getSeoCategoty() != null) {
			sql = sql + " and category_id in (select id from tbl_category where seo='" + productSearch.getSeoCategoty()
					+ "')";
		}

		if (productSearch != null && productSearch.getName() != null) {
			sql = sql + " and title LIKE '%"+ productSearch.getName() +"%' " ;
		}

	
		Query query = entityManager.createNativeQuery(sql, Products.class);

		
		if(productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) {
			query.setFirstResult((productSearch.getCurrentPage()-1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
			query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
		}

        Integer currentPage = 0;
		return query.getResultList();
	}

}
