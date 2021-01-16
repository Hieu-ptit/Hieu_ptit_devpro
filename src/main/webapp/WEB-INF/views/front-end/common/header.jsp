<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="com.devpro.entities.Users"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!-- heafer -->
<%!
	public String getEmailUserLogined() {
		String email = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			email = ((Users)principal).getEmail();
		}
		return email;
	}
%>
     <div class="header-top">
        <div class="call1">
            
            <a href="#">HOTLINE: <b>0345996565</b></a>
        </div>
        <div class="email1">
          
            <span>Email: Hieuptit20021998@gmail.com</span>
        </div>
        <div class="info1">
            <ul>
             
                <li>
               
                    <a href="#">Đăng Kí</a>
                </li>
                <li>
					<sec:authorize access="hasAuthority('ADMIN')">
						<a class="nav-link" href="#" style="margin-top: -8px;">Admin Page</a> 
					</sec:authorize>
					<sec:authorize access="hasAuthority('GUEST')">
					<a class="nav-link" href="#" style="margin-top: -8px;">Users Page</a>
					</sec:authorize>
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cai-nay-la-thuoc-tinh-href-trong-the-a-logout" style="margin-top: -8px;">Logout(<%= getEmailUserLogined() %>)</a></li>
            </ul>
        </div>
     </div>
<!-- /heafer -->