<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Mua hàng</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/Jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/category.jsp"></jsp:include>


	<!-- /menu -->
	<div class="contentx">
		<!-- container -->
		<div class="container1">
			<a href="index">
				<div class="box2">
					<p style="margin-top: 8px; margin-left: 10px; position: absolute;">Tiếp
						tục mua hàng</p>
				</div>
			</a>

			<div class="product">
				<c:choose>
					<c:when test="${empty product.productImage }">
						<img class="card-img-top" src="http://placehold.it/700x400" alt="">
					</c:when>
					<c:otherwise>
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(0).path }"
							alt="">
					</c:otherwise>
				</c:choose>
				<p
					style="position: absolute; margin-top: 20px; margin-left: 90px; width: 240px; line-height: 20px; padding-right: 10px; border-right: 1px solid #eeeeee;">Laptop
					Lenovo Thinkbook 13s IML 20RR00B8VN (Core i5 10210U/8Gb/512Gb
					SSD/13.3"FHD/VGA ON/Dos/Grey/vỏ nhôm)</p>
				<div class="boderx"
					style="width: 10px; height: 80px; position: absolute; color: black"></div>
				<p
					style="color: black; position: absolute; margin-top: 20px; margin-left: 350px; font-size: 16px;">Giá
					niêm yết : 19.990.000 ₫</p>
				<p
					style="color: red; position: absolute; margin-top: 45px; margin-left: 350px; font-size: 16px;">Giá
					bán : 18.290.000 ₫</p>
				<input type="number" class="form-control text-center" value="1">
			</div>

			<div class="total">
				<p style="color: black; position: absolute; margin-left: 300px;">
					Tổng cộng: <b style="color: red; font-size: 20px;">18.290.000 ₫</b>
				</p>
			</div>
			<div class="khuyen-mai">
				<p style="color: black; position: absolute; margin-left: 290px;">
					Khuyến mãi khi sử dụng mã code: <b
						style="color: red; font-size: 20px;">0 ₫</b>
				</p>
			</div>
			<div class="total1">
				<p style="color: black; position: absolute; margin-left: 280px;">
					Tổng giá trị đơn hàng: <b style="color: red; font-size: 20px;">
						18.990.000 ₫</b>
				</p>
			</div>
			<div class="ma-code">
				<p style="color: black; position: absolute; margin-left: 200px;">
					Mã giảm giả / Quà tặng <input type="text" id="code"
						placeholder="Nhập mã giảm giá">
					<button type="submit" value=""
						style="width: 80px; height: 30px; background-color: red; color: white; border-radius: 5px 5px;">Áp
						dụng</button>
				</p>
			</div>
			<p style="width: 730px; font-size: 14px;">- Quý khách hàng thực
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
				Để tiếp tục đặt hàng, quý khách xin vui lòng <a href="login"
					style="text-decoration: none;">đăng nhập</a> hoặc nhập thông tin
				bên dưới.
			</p>
			<p
				style="margin-left: 15px; margin-top: 10px; font-size: 14px; width: 350px;">Bằng
				cách đặt hàng, bạn đồng ý với Điều khoản giao dịch của Phạm Hiếu
				nhé!</p>
			<sf:form action="${pageContext.request.contextPath}/product/details/{id}"
				method="post" modelAttribute="cart">
				<p id="name">
					<b>Họ và tên*<br></b>
					<sf:input type="text" path="name"
						placeholder="Họ tên người nhận hàng" />
				</p>
				<p id="phone">
					<b>Số điện thoại*<br></b>
					<sf:input type="text" path="phone"
						placeholder="Dùng để liên lạc khi dao hàng" />
				</p>
				<p id="email">
					<b>Email(Vui lòng điền chính xác)*<br></b>
					<sf:input type="email" path="email"
						placeholder="Để nhận thông báo đơn hàng" />
				</p>
				<p id="address">
					<sf:input type="text" path="address"
						placeholder="Địa chỉ nhận hàng" />
				</p>
				<p id="note">
					<sf:input type="text" path="note"
						placeholder="Ghi chú thông tin viết hóa đơn ,yêu cầu lắp đặt" />
				</p>

				<div class="btn-submit">
					<input type="submit" value="ĐẶT HÀNG" id="btn-subit">
					<p style="margin-left: 10px; color: white; font-size: 13px;">Tư
						vấn viên sẽ gọi điện thoại xác nhận, không mua không sao</p>
				</div>
			</sf:form>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>

</body>
</html>