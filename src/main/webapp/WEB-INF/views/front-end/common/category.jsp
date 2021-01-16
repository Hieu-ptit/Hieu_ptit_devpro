<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- title -->
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="title1">
	<div class="title-1">
		<a href="index"> <img id="image-1"
			src="${pageContext.request.contextPath}/image/header/9.jpg"> <img
			id="image-2"
			src="${pageContext.request.contextPath}/image/header/10.jpg"> <span>Online
				Shopping Top 1</span>
		</a>

		<!-- <div class="list-group">
   <h1 class="my-4">Shop Name</h1>
   
	<c:forEach var = "category" items = "${categories }">
		<a href="${base }/product/category/${category.seo}" class="list-group-item">${category.name }</a>
		<a href="${base }/product/category/${category.seo}" class="list-group-item">${category.id }</a>
	</c:forEach>

</div>
 -->
	</div>
	<div class="title-2">
		<form action="${pageContext.request.contextPath}/">
			<input type="text" name="keyword" required placeholder="Nhập từ khóa tìm kiếm...">
			&nbsp;
		   <input type="submit" value="Search">
		   &nbsp;
		</form>
	</div>
	<div class="title-3">
		<a class="nav-link btn btn-danger"
			href="${pageContext.request.contextPath}/hien-thi-san-pham-trong-gio-hang">
			<img alt=""
			src="${pageContext.request.contextPath}/image/images/1250px-Shopping_cart_icon.svg.png"
			width="20" height="20"> <span>(</span><span
			id="thong_tin_gio_hang"></span>${SL_SP_GIO_HANG}<span>)</span>
		</a>
	</div>
</div>
<div class="boder-line1"></div>
<!-- /title -->


<!-- menu -->
<div class="menu1">
	<div class="danh-muc">

		<p>DANH MỤC SẢN PHẨM</p>
	</div>
	<div class="menu-ngang">
		<ul>
			<li><a href="/">TRANG CHỦ</a></li>
			<li><a href="#">GIỚI THIỆU</a></li>
			<li><a href="#">KHUYẾN MẠI</a></li>
			<li><a href="#">TIN TỨC</a></li>
			<li><a href="#">BẢO HÀNH</a></li>
			<li><a href="#">DỊCH VỤ</a></li>
		</ul>
	</div>
</div>

<!-- /menu -->
