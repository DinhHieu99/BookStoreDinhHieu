<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
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
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- login page  -->
	<!-- ============================================================== -->
	<c:if test="${not empty message }">
		<script type="text/javascript">
			alert('Bạn không có quyền đăng nhập');	
		</script>
	</c:if>
	<div class="splash-container">
		<div class="card ">
			<div class="card-header text-center">
				<a href="/"><img class="logo-img"
					src="${pageContext.request.contextPath}/img/logo.png" alt="logo"
					width="120px"></a><span class="splash-description">Vui
					lòng nhập thông tin tài khoản.</span>
			</div>
			<div class="card-body">
				<form action="/admin/loginAdmin" method="post"
					modelAttribute="admin">
					<div class="form-group">
						<input class="form-control form-control-lg" id="username"
							type="text" name="username" placeholder="Username"
							autocomplete="off">
					</div>
					<div class="form-group">
						<input class="form-control form-control-lg" id="password"
							type="password" name="password" placeholder="Password">
					</div>
					<div class="form-group">
						<label class="custom-control custom-checkbox"> <input
							class="custom-control-input" type="checkbox"><span
							class="custom-control-label">Nhớ mật khẩu</span>
						</label>
					</div>
					<button type="submit" class="btn btn-primary btn-lg btn-block">Đăng
						nhập</button>
				</form>
			</div>
			<div class="card-footer bg-white p-0  ">
				<div class="card-footer-item card-footer-item-bordered">
					<a href="/admin/register" class="footer-link">Tạo tài khoản</a>
				</div>
				<div class="card-footer-item card-footer-item-bordered"
					style="float: right;">
					<a href="#" class="footer-link">Quên mật khẩu</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- end login page  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

</html>