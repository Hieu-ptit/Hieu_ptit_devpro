<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mua hàng</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
   
    <script src="${pageContext.request.contextPath}/js/Jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/shop.js"></script>
     <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="6mRcOQ3a"></script>
<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/front-end/common/category.jsp"></jsp:include>

<h1 style="text-align: center;width: 1114px;font-size: 18px;margin-left: 105px;margin-top: 15px;">${product.title }</h1>
<div class="container" style="display: flex;margin-bottom: 20px;">
<!-- box -->
<div class="box">
	<div class="boxa" style="width: 350px;height: 350px;border: 1px solid #dddddd;">
		<img class="card-img-top"
									src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(0).path }" id="imagemain" style="width: 300px;height: 300px;margin-left: 20px;margin-top: 20px;">
	</div>
	<div class="boxb" style="display: flex;width: 330px;height: 70px;margin-left: 40px;margin-top: 20px;">
		<ul>
			<li>
				<img class="card-img-top"
									src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(1).path }" id = "image1" onclick="changeImages('image1')">
				<img class="card-img-top"
									src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(2).path }" id = "image2" onclick="changeImages('image2')">
				<img class="card-img-top"
									src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(3).path }" id = "image3" onclick="changeImages('image3')">
				<img class="card-img-top"
									src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(4).path }" id = "image4" onclick="changeImages('image4')">
			</li>
		</ul>
	</div>
</div>
<div class="boxn" style="width: 485px;height: 84px;background-color: #f0f0f0;margin-left: 20px;margin-top: 20px;font-size: 18px;">
	<p style="margin-left: 20px;">Giá niêm yết : <b style="margin-left: 30px;text-decoration: line-through;">${product.price } ₫</b></p>
	<p style="margin-left: 20px;">Giá bán : <b style="margin-left: 50px;">${product.priceSale } ₫</b></p><span style="font-size: 15px;">Bảo hành: Chính hãng 12 tháng, tại nơi sử dụng. Đổi mới 30 ngày.</span>
	
	<div class="boxm" style="display: flex;margin-top: 10px;">
		<div class="khoi1" style="width: 236px;height: 80px;background-color: #ef2e2e;margin-right: 10px;">
			<a href="${pageContext.request.contextPath}/index" style="text-decoration: none;">
				<p style="color: white;text-align: center;margin-top: 10px;"><b>TIẾP TỤC MUA HÀNG</b></p>
			<p style="color: white;text-align: center;margin-top: -15px;font-size: 12px;">Giao hàng tận nơi nhanh chóng</p>
			</a>
		</div>
		
				<button type="button" class="btn btn-primary"
								onclick="sub.chon_san_pham_dua_vao_gio_hang(${product.id}, 1);" style="color: white;text-align: center;width: 246px;height: 80px;"><b>THÊM VÀO GIỎ HÀNG</b>
								<p style="color: white;text-align: center;font-size: 12px;">Thủ tục đơn giản</p></button></p>
			
		
	</div>
	<div class="boder-linen" style="border: 1px solid #dddddd;margin-top: 20px;"></div>
	<p style="color: red;">Ưu đãi và quà tặng khuyến mãi:</p>
	<p style="color: blue;">
		Từ ngày 1/9 đến 30/09/2020, Tặng bộ quà cao cấp gồm:<br>
        - Tai nghe thời trang <br>
        - Chuột không dây cao cấp.<br>
        - Bộ vệ sinh <br>
        - Balo Phúc Anh thời trang.<br>
        - Tặng gói bảo trì, bảo dưỡng laptop miễn phí tại Phúc Anh
	</p>
</div>
<!-- box -->
<div class="box-left" style="margin-left:15px;margin-top:18px;">
	<div class="box-left1" style="height: 280px;border: 1px solid yellow;">
	<p style="color: black;width: 240px;font-size: 18px;text-align: center;"><b>THÔNG SỐ KỸ THUẬT</b></p>
	<p style="margin-top: -10px;margin-left: 10px;font-size: 13px;line-height: 22px;color: blue;">
		- Bộ VXL: Core i5 10210U 1.6Ghz Up to 4.2Ghz - 6Mb <br>
        - Cạc đồ họa: VGA Nvidia Nvidia GeForce MX230 2GB GDDR5 <br>
        - Bộ nhớ: 8Gb <br>
        - Ổ cứng/ Ổ đĩa quang: 256Gb SSD/ Không có <br>
        - Màn hình: 14.0Inch Full HD <br>
        - Hệ điều hành: Windows 10 Home <br>
        - Màu sắc/ Chất liệu: Grey/vỏ nhôm <br>
	</p>
</div>
     <div class="box-left-2" style="margin-top:10px;height: 152px;border: 1px solid yellow;">
     	<p style="color: red;margin-left: 4px;"><b>Đang còn hàng tại cửa hàng:</b></p>
     	<p style="color: black;margin-left: 4px;margin-top: -5px;line-height: 20px;font-size: 12px;">
     		- Số 15 Xã Đàn, Q. Đống Đa, HN <br>
     		- Số 134 Thái Hà, Q. Đống Đa, HN <br>
     		- Số 152 Trần Duy Hưng, Q. Cầu Giấy, HN <br>
     		- Số 160 Phạm Văn Đồng, Q. Cầu Giấy, HN <br>
     		- Số 63 Nguyễn Hoàng, Q. Nam Từ Liêm, HN <br>
     	</p>
     </div>
</div>
</div>
<div class="danh-muc-main" style="width:600px;height: 500px;margin-left: 300px;margin-top: 50px; ">
	<img class="slide" src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(1).path }" idx ="0" style="width:800px;height: 350px;">
	<img class="slide" src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(2).path }" idx ="1" style="width:800px;height: 350px;">
	<img class="slide" src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(3).path }" idx ="2" style="width:800px;height: 350px;">
	<img class="slide" src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(4).path }" idx ="3" style="width:800px;height: 350px;">
	<img class="btn-change" id="next" src="${pageContext.request.contextPath}/image/banner/next.png" style="margin-left: 500px;">
	<img class="btn-change" id="prev" src="${pageContext.request.contextPath}/image/banner/prev.png">
</div>
<div style="margin-left: 153px;">${product.shortDetails }</div>

			<div class="col-lg-9">
				<div class="row"
					style="margin-left: 180px; width: 1000px;position: relative;">
		        <h4 class="sptt" style="position: absolute;margin-bottom: 50px;"> SẢN PHẨM TƯƠNG TỰ</h4>
					<c:forEach var="product" items="${products }">
						<div class="colum-n" style="margin-top: 20px;">
							<div class="sp2" style="height: 380px;">
								<c:choose>
									<c:when test="${empty product.productImage }">
										<img class="card-img-top" src="http://placehold.it/700x400"
											alt="">
									</c:when>
									<c:otherwise>
										<img class="card-img-top"
											src="${pageContext.request.contextPath}/file/upload/${product.productImage.get(0).path }"
											alt=""
											style="width: 180px; height: 180px; margin-top: 20px; margin-bottom: 20px; margin-left: 30px;">
									</c:otherwise>
								</c:choose>
								<div class="box3" style="margin-top: -15px;">
		
		
									<p style="margin-left: 8px; color: black; font-weight: bold;">${product.title }</p>
									<p style="color: black; margin-left: 8px;">
										Giá niêm yết : <b style="text-decoration: line-through;">${product.price }</b>
									</p>
									<p style="color: red; margin-left: 8px;">
										Giá bán : <b style="color: red">${product.priceSale }</b>
									</p>
		
								</div>
								<div class="gio-hang-1" style="display: flex; margin-left: 20px;">
									<button type="button" class="btn btn-primary"
										onclick="sub.chon_san_pham_dua_vao_gio_hang(${product.id}, 1);">Mua
										hàng</button>
									<a
										href="${pageContext.request.contextPath}/details/${product.seo}"
										style="margin-left: 10px;"><button type="button"
											class="btn btn-danger" class="noi-dung-2"
											style="text-decoration: none;">xem chi tiết</button></a>
								</div>
		
							</div>
						</div>
		
		
					</c:forEach>
		
				</div>
		
			</div>
			
<div class="empty" style="width: 20px;height: 20px;"></div>
<div class="comment" style="margin-left: 150px;">
<div class="fb-comments" data-href="http://localhost:9090" data-width="500" data-numposts="1"></div>
</div>
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
<style type="text/css">
	.boxb ul{margin: 0px;padding: 0px;list-style: none;}
	.boxb ul li{display: inline;}
	.boxb img{width: 60px;height: 60px;border: 1px solid #dddddd;}
</style>
<script type="text/javascript">
	function changeImages(imagesID){
        var src = document.getElementById(imagesID).getAttribute("src");
        document.getElementById("imagemain").setAttribute("src",src);
        document.getElementById('image1').setAttribute("style","border: 1px solid #dddddd;");
        document.getElementById('image2').setAttribute("style","border: 1px solid #dddddd;");
        document.getElementById('image3').setAttribute("style","border: 1px solid #dddddd;");
        document.getElementById('image4').setAttribute("style","border: 1px solid #dddddd;");
        document.getElementById('image5').setAttribute("style","border: 1px solid #dddddd;");
        document.getElementById(imagesID).setAttribute("style","border:1px solid red");
	}
</script>
	<script src="${pageContext.request.contextPath}/js/subscribe.js"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>