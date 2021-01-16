<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="com.devpro.entities.Users"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
  <div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào Admin
                      <!--   ${USERMODEL.fullName} -->
                    </a>
                    <li class="light-blue dropdown-modal">
                        <a href="${pageContext.request.contextPath}/cai-nay-la-thuoc-tinh-href-trong-the-a-logout">
                            <i class="ace-icon fa fa-power-off"></i>
                            Thoát(<%= getEmailUserLogined() %>)
                        </a>
                    </li>
                </li>
            </ul>
        </div>
    </div>
</div>