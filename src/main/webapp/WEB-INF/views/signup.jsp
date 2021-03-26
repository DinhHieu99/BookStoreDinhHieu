<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8" />
<meta name="description" content="Demo su dung bootstrap" />
<meta name="keyword"
	content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery" />
<meta name="author" content="HieuNguyen">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/webbook.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Signup.css">
<!-- icon trang thẻ web-->
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<!-- icon trang thẻ web-->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<title>Đăng nhập</title>
</head>

<body class="font">
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!--content-->
	<div class="container-fluid">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Tài khoản</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Đăng ký</span>
				</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="wrapper-tab row">
				<h2>Đăng ký tài khoản</h2>
				<h6>Nếu bạn đã đăng ký tài khoản với chúng tôi, vui lòng đăng
					nhập.</h6>
				<div class="col-sm-12 required">
					<form name="register" class="form-group" action="/register"
						modelAttribute="register" method="POST">
						<fieldset>
							<legend>Chi tiết tài khoản</legend>
							<div class="form-group required">
								<label class="control-label col-sm-2 ">Họ & Tên</label>
								<div class="col-sm-10">
									<input type="text" name="name" value="" placeholder="Họ & Tên"
										class="form-control" />
								</div>
							</div>
							<div class="form-group required">
								<label class="control-label col-sm-2">Email</label>
								<div class="col-sm-10">
									<input type="email" name="email" value="" placeholder="Email"
										class="form-control" />
								</div>
							</div>
							<div class="form-group required">
								<label class="control-label col-sm-2">Điện thoại</label>
								<div class="col-sm-10">
									<input type="tel" name="mobile" value=""
										placeholder="Điện thoại" class="form-control" />
								</div>
							</div>
						</fieldset>
						<fieldset id="address">
							<legend>Địa chỉ</legend>

							<div class="form-group required">
								<label class="control-label col-sm-2">Địa chỉ</label>
								<div class="col-sm-10">
									<input type="text" name="address" value="" placeholder="Địa chỉ"
										class="form-control" />
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Mật khẩu</legend>
							<div class="form-group required">
								<label class="control-label col-sm-2">Mật khẩu</label>
								<div class="col-sm-10">
									<input type="password" name="password" value=""
										placeholder="Mật khẩu" class="form-control" />
								</div>
							</div>
							<div class="form-group required">
								<label class="control-label col-sm-2">Mật khẩu xác nhận</label>
								<div class="col-md-10">
									<input type="password" value="" placeholder="Mật khẩu xác nhận"
										name="confimPassword" class="form-control" />
								</div>
							</div>
						</fieldset>
						<input type="submit" value="Đăng ký" class="btn btn-primary" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>