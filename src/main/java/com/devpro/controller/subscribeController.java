package com.devpro.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.model.AjaxResponse;

import com.devpro.model.subscribe;

@Controller
public class subscribeController {
    @RequestMapping(value = {"/save-subscribe-with-ajax"},method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> saveAjax(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
    	                                       @RequestBody subscribe data){
    	String Email = String.valueOf(data.getEmail());
    	System.out.println(Email);
    	String firstName = String.valueOf(data.getFirstname());
		System.out.println(firstName);
		String phone = String.valueOf(data.getPhone());
		System.out.println(phone);
    	model.addAttribute("subscribe", new subscribe());
    	return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
    }
    
}
