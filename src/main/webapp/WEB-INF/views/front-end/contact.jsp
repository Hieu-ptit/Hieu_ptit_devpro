<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/Jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/category.jsp"></jsp:include>


	<div class="content"
		style="text-align: center; margin-left: 450px; position: relative; margin-top: 20px;">
		<div class="content1" style="position: absolute;">
			<div class="tich">
				<img
					src="${pageContext.request.contextPath}/image/images/icon-tick-xanh-fb.png"
					style="width: 100px; height: 100px; margin: auto">
			</div>
			<br>
			<div class="noi-dung" style="margin-bottom: 8px;">
				<span>Cảm ơn quý khách <br>Chúng tôi đã nhận được thông
					tin của quý khách!
				</span> <br> <span><i>Tổng đài HDWEB.COM sẽ liên hệ với quý
						khách trong <b>5 phút</b>
				</i></span> <br> <span><i>Xin cảm ơn quý khách đã cho chúng tôi
						cơ hội được phục vụ!</i></span> <br>
			<a href="/" class="btn btn-success" style="height: 50px; margin-top: 30px;">Tiếp
					tục mua sắm</a>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/subscribe.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</body>
</html>