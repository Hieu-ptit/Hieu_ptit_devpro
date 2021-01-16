<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang đăng nhập</title>
     <link rel="stylesheet" type="text/css" href="css/style4.css">
</head>
<body>
<div class="bg-img">
        <div class="content">
            <header>Login Form</header>
            <form action="/cai-nay-la-thuoc-tinh-action-trong-form-login" method="post" >
            <c:if test="${not empty param.co_loi_xay_ra}">
							<div class="alert alert-danger" role="alert" style="color: red;font-size: 12px;margin-bottom: 5px;">
							  	Login attempt was not successful, try again.
							</div>
						</c:if>
                <div class="field">
                    <span class="fa fa-user"></span>
                    <input type="text" name="username" required placeholder="username"/>
                </div>
                <div class="field space">
                    <span class="fa fa-lock"></span>
                    <input type="password" name="password" class="pass-key" placeholder="Password"/>
                </div>
                <div class="pass">
                    <a href="#">Forgot Password?</a>
                </div>
                <input type="submit" id="login" value="LOGIN"/>
            </form>
            <div class="login">
            Or login with</div>
            <div class="links">
                <div class="facebook">
                    <i class="fab fa-facebook-f"><span>Facebook</span></i>
                </div>
                <div class="instagram">
                    <i class="fab fa-instagram"><span>Instagram</span></i>
                </div>
            </div>
            <div class="signup">
                Don't have account?
                <a href="${pageContext.request.contextPath}/registration">Signup Now</a>
            </div>
        </div>
    </div>
</body>

</html>

