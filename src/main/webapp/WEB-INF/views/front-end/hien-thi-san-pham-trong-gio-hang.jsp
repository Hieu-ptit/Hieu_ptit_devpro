<!-- sử dụng tiếng việt -->
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/Jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/subscribe.js"></script>
<title>Gio hang</title>



</head>

<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/category.jsp"></jsp:include>

	<!-- Page Content -->

	<!-- /.container -->
	<!-- /menu -->
	<div class="contentx">
		<!-- container -->

		<div class="container1" style="margin-bottom: 200px;">
			<a href="index">
				<div class="box2">
					<p style="margin-top: 8px; margin-left: 10px;">Tiếp
						tục mua hàng</p>
				</div>
			</a>
			<c:forEach items="${GIO_HANG.sanPhamTrongGioHangs }" var="item"
				varStatus="loop">

				<div class="product">
					<c:choose>
						<c:when test="${empty item.pathImage }">
							<img class="card-img-top" src="http://placehold.it/700x400"
								alt="">
						</c:when>
						<c:otherwise>
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/file/upload/${item.pathImage }"
								alt="">
						</c:otherwise>
					</c:choose>
					<p
						style="position: absolute; margin-top: 20px; margin-left: 90px; width: 240px; line-height: 20px; padding-right: 10px; border-right: 1px solid #eeeeee;">${item.tenSanPham }
					</p>
					<div class="boderx"
						style="width: 10px; height: 80px; position: absolute; color: black"></div>

					
					<p class="giatien"
						style="color: red; position: absolute; margin-left: 340px; margin-top: 25px;">
							<b>Tạm tính : ${item.giaban*item.soluong } ₫</b>
					</p>
					<nav>
						<ul class="pagination">
							<li><button type="button" class="btn btn-warning btn-sm"
									onclick="sub.sua_san_pham_tu_gio_hang(${item.maSanPham},-1);"
									style="position: absolute; margin-top: 20px; margin-left: 488px;"><b>-</b></button></li>
							<li><input type="number" class="soluong-giohang" min="1"
								class="form-control text-center" value="${item.soluong }"
								style="margin-left: 510px; height: 32px; width: 50px; "></li>
							<li><button type="button" class="btn btn-success btn-sm"
									onclick="sub.sua_san_pham_tu_gio_hang(${item.maSanPham},1);"
									style="position: absolute; margin-top: 20px; margin-left: 560px;"><b>+</b></button></li>
									<button type="button" class="btn btn-danger btn-sm"
								onclick="sub.xoa_san_pham_tu_gio_hang(${item.maSanPham});" style="position: absolute;margin-top: 20px;margin-left: 590px;">Xoá</button>
						</ul>
					</nav>
				</div>


			</c:forEach>
			<div class="total">
				<p class="tongcong"
					style="color: black; position: absolute; margin-left: 300px; margin-top: 10px;">
					 <b style="color: red; font-size: 20px;">Tổng cộng: ${total }
						₫</b>
				</p>
			</div>

			<p style="width: 730px; font-size: 14px;margin-top: 10px;">- Quý khách hàng thực
				hiện việc chuyển khoản qua ngân hàng tổng số tiền mua hàng, cước vận
				chuyển (nếu có) vào tài khoản của Phúc Anh (ghi rõ nội dung nộp tiền
				là thanh toán tiền mua ..… cho công ty Phúc Anh).</p>
			<p style="width: 730px; font-size: 14px;">- Quý khách chuyển tiền
				cho chúng tôi vào tài khoản sau đây:</p>
			<p style="width: 730px; font-size: 14px;">
				Tên tài khoản:<b>CÔNG TY TNHH KỸ NGHỆ PHẠM HIẾU</b>
			</p>
			<p style="width: 730px; font-size: 14px;">Địa chỉ: số 15 Xã Đàn,
				phường Phương Liên, quận Đống Đa, Thành phố Hà Nội</p>
			<p style="width: 730px; font-size: 14px;">Điện thoại:0345996565</p>
		</div>

		<!-- /container -->

		<div class="thanh-toan">
			<div class="tt-header"
				style="color: white; background-color: #de0b00; height: 40px; text-align: center; position: relative;">
				<p
					style="position: absolute; margin-top: 10px; margin-left: 120px; font-size: 16px;">
					<b>Thông tin thanh toán</b>
				</p>
			</div>
			<p style="margin-left: 15px; margin-top: 10px; font-size: 14px;">
				Để tiếp tục đặt hàng, quý khách xin vui lòng <a
					href="${pageContext.request.contextPath}/cai-nay-la-mapping-trong-adminlogincontroller"
					style="text-decoration: none;">đăng nhập</a> hoặc nhập thông tin
				bên dưới.
			</p>
			<p
				style="margin-left: 15px; margin-top: 10px; font-size: 14px; width: 350px;">Bằng
				cách đặt hàng, bạn đồng ý với Điều khoản giao dịch của Phạm Hiếu
				nhé!</p>
			<div class="row mb-4">
				<div class="col">
					<form action="${pageContext.request.contextPath}/luu_don_hang"
						method="post">
						<div class="form-group" style="margin-left: 5px;">
							<label for="name"><b>Họ và tên*:</b></label> <input type="text"
								class="form-control" id="name" name="name"
								placeholder="Họ tên người nhận hàng"
								style="width: 340px; height: 40px; margin-top: 5px;">
						</div>
						<div class="form-group" style="margin-left: 5px;">
							<label for="email"><b>Email(Vui lòng điền chính xác)*</b></label>
							<input type="email" class="form-control" id="email" name="email"
								placeholder="Để nhận thông báo đơn hàng"
								style="width: 340px; height: 40px;">
						</div>
						<div class="form-group" style="margin-left: 5px;">
							<label for="phone"><b>Số điện thoại*</b></label> <input
								type="text" class="form-control" id="phone" name="phone"
								placeholder="Dùng để liên lạc khi dao hàng"
								style="width: 340px; height: 40px;">
						</div>
						<div class="form-group" style="margin-left: 5px;">
							<label for="address"><b>Địa chỉ giao hàng*:</b></label> <input
								type="text" class="form-control" id="address" name="address"
								placeholder="Địa chỉ nhận hàng"
								style="width: 340px; height: 40px;">
						</div>

						<button type="submit" class="btn btn-warning"
							style="margin-left: 120px; margin-top: 15px;">ĐẶT HÀNG</button>

					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
   
</body>

</html>
