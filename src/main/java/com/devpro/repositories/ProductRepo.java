package com.devpro.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Products;

@Repository
public interface ProductRepo extends JpaRepository<Products, Integer>{
	
	@Query(value = "select * from tbl_products where tbl_products.seo = :seo", nativeQuery = true)
    public Products getProductBySeo(@Param("seo") String seo);
	
	@Query(value = "select * from tbl_products where tbl_products.category_id = :category_id LIMIT 4", nativeQuery = true)
    public List<Products> getProductSiminar(@Param("category_id") String category_id);
	
	@Query(value = "select * from tbl_products where tbl_products.price >= :prices - 1000000 and tbl_products.price <= :prices + 1000000", nativeQuery = true)
    public List<Products> getProductByPrices(@Param("prices") String prices);
	
//	@Query(value = "select * from tbl_products where tbl_products.name = :keyword", nativeQuery = true)
//    public Products getProductBySearch(@Param("keyword") String keyword);
     
}
