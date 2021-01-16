<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/Jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/shop.js"></script>
        <div class="content">
           <header>Thêm Sản phẩm</header>
            <sf:form action="${pageContext.request.contextPath}/admin" method="post" modelAttribute="admin1">
                <div class="ma" >
                   Mã sản phẩm: <sf:input type="text" path="maSP" />
                </div>
                <div class="ten">
                   Tên sản phẩm <sf:input type="text" path="tenSP"/>
                </div>
                <div class="gia">
                   Gía sản phẩm <sf:input type="text" path="price"/>
                </div>
                <input type="submit" id="login1" value="Thêm"/>
            </sf:form>
        </div> -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Trang quản trị</title>
<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/font-awesome/4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/fonts/fonts.googleapis.com.css" />
<link
	href="${pageContext.request.contextPath}/summernote/summernote.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<script
	src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
</head>

<body class="no-skin">
	<!-- header -->

	<jsp:include page="/WEB-INF/views/back-end/common/header.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>

					<button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>

					<button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>

					<button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">

				<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-list"></i> <span class="menu-text">
							Quản lí bài viết </span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a href="tables.html"> <i
								class="menu-icon fa fa-caret-right"></i> Tin tức khuyến mãi
						</a> <b class="arrow"></b></li>

						<li class=""><a href="jqgrid.html"> <i
								class="menu-icon fa fa-caret-right"></i> Thông tin bảo hành
						</a> <b class="arrow"></b></li>
					</ul></li>

				<li class=""><a href="#" class="dropdown-toggle"> <span
						class="glyphicon glyphicon-user" style="margin-left: 5px;"></span>
						<span class="menu-text"> Tài khoản </span> <b
						class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a href="tables.html"> <i
								class="menu-icon fa fa-caret-right"></i> Danh sách liên hệ
						</a> <b class="arrow"></b></li>

						<li class=""><a href="jqgrid.html"> <i
								class="menu-icon fa fa-caret-right"></i> Danh sách User
						</a> <b class="arrow"></b></li>
					</ul></li>

				<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-pencil-square-o"></i> <span
						class="menu-text"> Sản phẩm </span> <b
						class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a href="${pageContext.request.contextPath}/admin/themsanpham/list"> <i
								class="menu-icon fa fa-caret-right"></i> Danh sách sản phẩm
						</a> <b class="arrow"></b></li>

						<li class=""><a href="${pageContext.request.contextPath}/admin/themsanpham"> <i
								class="menu-icon fa fa-caret-right"></i> Thêm sản phẩm
						</a> <b class="arrow"></b></li>

					</ul></li>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left"
						data-icon1="ace-icon fa fa-angle-double-left"
						data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
		</div>

		<div class="card mb-4">
			<div class="card-body" style="width: 800px; margin-left: 300px;">
				<div class="card-header">
					<h2>Thêm mới sản phẩm</h2>
				</div>
				<!-- Nếu cần phải upload file thì form bắt buộc phải có enctype="multipart/form-data" -->
				<form:form action="${pageContext.request.contextPath}/admin/themsanpham"
					method="post" modelAttribute="products"
					enctype="multipart/form-data">
					<form:hidden path="id"/>
					<div class="form-group">
						<label>Category</label>
						<form:select class="form-control form-control-line"
							path="category.id">
							<!-- product.getCategory().setId() -->
							<form:options items="${categories}" itemValue="id"
								itemLabel="name" />
						</form:select>
					</div>

					<div class="form-group">
						<label>Title</label>
						<form:input type="text" class="form-control" path="title" />
						<small id="emailHelp" class="form-text text-muted"> Tối đa
							15 kí tự. </small>
					</div>

					<div class="form-group">
						<label>Short Description</label>
						<form:input type="text" class="form-control"
							path="short_description" />
						<small id="emailHelp" class="form-text text-muted"> Sẽ
							hiển thị tại màn hình danh sách sản phẩm. </small>
					</div>

					<div class="form-group">
						<label>Giá Niêm yết</label>
						<form:input type="text" class="form-control" path="price" />
						<small id="emailHelp" class="form-text text-muted"> Đơn vị
							tính là VNĐ. </small>
					</div>
					
					<div class="form-group">
						<label>Giá bán</label>
						<form:input type="text" class="form-control" path="priceSale" />
						<small id="emailHelp" class="form-text text-muted"> Đơn vị
							tính là VNĐ. </small>
					</div>

					<div class="form-group">
						<label>Details description</label>
						<form:textarea id="txtDetailDescription" class="form-control"
							path="shortDetails" />
					</div>

					<div class="form-group">
						<label>Images</label> <input type="file" name="product_image"
							class="form-control" multiple="multiple">
					</div>

					<button type="submit" class="btn btn-primary">Lưu trữ</button>
				</form:form>

			</div>
		</div>

		<div class="footer">
			<div class="footer-inner">
				<div class="footer-content">
					<span class="bigger-120"> <span class="blue bolder">Ace</span>
						Application &copy; 2020
					</span> &nbsp; &nbsp; <span class="action-buttons"> <a href="#">
							<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
					</a> <a href="#"> <i
							class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
					</a> <a href="#"> <i
							class="ace-icon fa fa-rss-square orange bigger-150"></i>
					</a>
					</span>
				</div>
			</div>
		</div>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<script type="text/javascript">
		$("#checkall").change(function() {
			if (this.checked) {
				$("#table-sanpham #checksanpham").each(function() {
					$(this).attr("checked", true);
				})
			} else {
				$("#table-sanpham #checksanpham").each(function() {
					$(this).attr("checked", false);
				})
			}
		});
	</script>

	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.2.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-ui.custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.easypiechart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/summernote/summernote.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#txtDetailDescription').summernote();
		});
	</script>
</body>
</html>
