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

<title>Thông tin tài khoản</title>
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
				<li><a href="#"> <span>Thông tin tài khoản</span>
				</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="wrapper-tab row">
			<c:if test="${not empty message }"></c:if>
				<div class="col-sm-12 alert alert-${alert}">
					<strong>${messageAlert}</strong>
				</div>
				<h2>Thông tin tài khoản</h2>

				<div class="col-sm-12 required">
					<c:forEach var="account" items="${account}">
						<form name="account_information" class="form-group"
							action="/edit_account_information" method="post"
							modelAttribute="user" onSubmit="return checkPw(this)">
							<fieldset>
								<legend>Chi tiết tài khoản</legend>

								<input type="hidden" name="id" value="${account.id}"
									class="form-control" />

								<div class="form-group required">
									<label class="control-label col-sm-2 ">Họ & Tên</label>
									<div class="col-sm-10">
										<input type="text" name="name" value="${account.name}"
											placeholder="Họ & Tên" class="form-control" />
									</div>
								</div>
								<div class="form-group required">
									<label class="control-label col-sm-2">Email</label>
									<div class="col-sm-10">
										<input type="email" name="email" value="${account.email}"
											placeholder="Email" class="form-control" />
									</div>
								</div>
								<div class="form-group required">
									<label class="control-label col-sm-2">Điện thoại</label>
									<div class="col-sm-10">
										<input type="tel" name="mobile"
											value="${account.mobile}" placeholder="Điện thoại"
											class="form-control" />
									</div>
								</div>
							</fieldset>
							<fieldset id="address">
								<legend>Địa chỉ</legend>

								<div class="form-group required">
									<label class="control-label col-sm-2">Địa chỉ</label>
									<div class="col-sm-10">
										<input type="text" name="address" value="${account.address}"
											placeholder="Địa chỉ" class="form-control" />
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
									<label class="control-label col-sm-2">Mật khẩu mới</label>
									<div class="col-md-10">
										<input type="password" value=""
											placeholder="Không nhập vào mục này nếu không thay đổi password"
											name="passwordNew" class="form-control" />
									</div>
								</div>
								<div class="form-group required">
									<label class="control-label col-sm-2">Mật khẩu xác nhận</label>
									<div class="col-md-10">
										<input type="password" value=""
											placeholder="Không nhập vào mục này nếu không thay đổi password"
											name="confimPassword" class="form-control" />
									</div>
								</div>
							</fieldset>
					</c:forEach>
					<input type="submit" value="Cập nhật" name="register"
						class="btn btn-primary" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script>
		function checkPW() {
			var firstpassword = document.account_information.password.value;
			var secondpassword = document.account_information.password2.value;

			if (firstpassword == secondpassword) {
				return true;
			} else {
				alert("password must be same!");
				return false;
			}
		}
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>