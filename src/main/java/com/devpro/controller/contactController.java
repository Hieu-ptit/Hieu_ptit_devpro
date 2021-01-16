package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class contactController {

	  @Autowired
	  private JavaMailSender mailSender;
	  
	  @RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
		public String showContact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
				throws Exception {
		  
		  return "front-end/index";
	  }
	  @RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
		public String showContact1(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
				throws Exception {
		  String fullname = request.getParameter("fullname");
		  String email = request.getParameter("email");
		  String subject = request.getParameter("subject");
		  String content = request.getParameter("content");
		  SimpleMailMessage message = new SimpleMailMessage();
		  message.setFrom("contact@devpro.com");
		  message.setTo(email);
		  String mailSubject = fullname +" has sent a message";
		  String mailContent = "Xin chào : " + fullname + "\n";
		  mailContent += "from Email: Hieuptit20021998@gmail.com" +"\n";
		  mailContent += "Subject : " + subject +"\n";
		  mailContent += "Content : " + content +"\n";
		  message.setSubject(mailSubject);
		  message.setText(mailContent+"Cảm ơn bạn đã quan tâm khi có hàng nhân viên chúng tôi sẽ thông báo đến bạn!");
		  mailSender.send(message);
		  
		  return "front-end/contact";
	  }
}
