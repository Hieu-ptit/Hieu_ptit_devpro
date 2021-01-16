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
</head>
<body>
    <jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/category.jsp"></jsp:include>

    <div class="text-center">
         <h2>Contact US</h2>
    </div>

	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/subscribe.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</body>
</html>