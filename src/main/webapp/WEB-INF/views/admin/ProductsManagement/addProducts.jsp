<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.Date"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">


<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Thêm sản phẩm</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
</head>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
	<!-- ============================================================== -->
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Thêm sản phẩm</h2>

						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">Bảng điều khiển</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">Giao diện</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">Kho hàng</a></li>
									<li class="breadcrumb-item active" aria-current="page">Thêm
										sản phẩm mới</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- valifation types -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h5 class="card-header">Thêm sản phẩm mới vào kho hàng</h5>
						<div class="card-body">
							<form method="post" action="/admin/add-product"
								modelAttribute="phieuNhap" enctype="multipart/form-data">

								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Tên
										sản phẩm:</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input name="name" type="text" required="" placeholder=""
											class="form-control" value="" />
									</div>
								</div>

								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Mô
										tả</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<textarea name="product.describe" required=""
											class="form-control ckeditor"></textarea>

									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Số
										lượng nhập:</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input name="quantity" required="" value=""
											class="form-control" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Đơn
										giá:</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input name="amount" required="" value="" class="form-control" />
									</div>
								</div>

								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Trạng
										thái:</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<select name="product.status" class="form-control"
											id="input-select">
											<option value="true">Hiển thị</option>
											<option value="false">Không hiển thị</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Nhà
										cung cấp:</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<select name="product.nhaCC.id" class="form-control"
											id="input-select">
											<c:forEach var="ncc" items="${ncc}">
												<option value="${ncc.id}">${ncc.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">Tệp/Ảnh</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input type="file" placeholder="" class="form-control"
											name="image">
									</div>
								</div>
								<input type="hidden" name="admin.id" required="" value="${user}"
									class="form-control" />
								<div class="form-group row text-right">
									<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
										<button type="submit" class="btn btn-space btn-primary">Lưu</button>
										<a href="/admin/dataTables"><input type="button"
											value="Hủy" class="btn btn-space btn-secondary"></input></a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end valifation types -->
				<!-- ============================================================== -->
			</div>

		</div>
		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<div class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
						Copyright © 2018 Concept. All rights reserved. Dashboard by <a
							href="https://colorlib.com/wp/">Colorlib</a>.
					</div>
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
						<div class="text-md-right footer-links d-none d-sm-block">
							<a href="javascript: void(0);">About</a> <a
								href="javascript: void(0);">Support</a> <a
								href="javascript: void(0);">Contact Us</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- end footer -->
		<!-- ============================================================== -->
	</div>
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
	<script>
		$('#form').parsley();
	</script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
</body>

</html>