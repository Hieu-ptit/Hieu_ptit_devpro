package com.devpro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.entities.Category;
import com.devpro.entities.Products;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;

public abstract class BaseController {
	@Autowired
	CategoryRepo categoryRepo;

	
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryRepo.findAll();
	}
	
}
