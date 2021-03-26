<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="vi" xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8" />

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
	href="${pageContext.request.contextPath}/css/contact.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Liên hệ</title>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="#"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Liên hệ</span>
				</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="page-content">
						<h5>Liên hệ với chúng tôi</h5>
						<!-- End .widget-title -->
						<ul class="menu" style="list-style: none;">
							<li><i class="fa fa-map-marker" aria-hidden="true"></i>Trường
								đại học công nghiệp Hà Nội</li>
							<li><i class="fa fa-phone" aria-hidden="true"></i> <a
								href="#">0123 456 789</a></li>
							<li><i class="fa fa-envelope" aria-hidden="true"></i> <a
								href="#">BookstoreDinhHieu@gmail.com</a></li>
						</ul>
						<!-- End .widget-menu -->
					</div>
					<div class="box-maps col-md-12">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.4736630784314!2d105.73291811445509!3d21.05373599230217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345457e292d5bf%3A0x20ac91c94d74439a!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1614857292357!5m2!1svi!2s"
							height="450" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-content-login">
						<h3 class="text-center">Thông tin liên hệ</h3>
						<span class="text-center block"></span>
						<form action="/sendMail" method="post" modelAttribute="contact">
							<div class="form-signup clearfix">
								<div class="row">
									<div class="col-sm-6">
										<fieldset class="form-group">
											<label>Tên của bạn:<span class="required">*</span></label> <input
												type="text" name="fullName" id="name" class="form-control"
												data-validation-error-msg="Không được để trống"
												data-validation="required" required />
										</fieldset>
									</div>
									<div class="col-sm-6">
										<fieldset class="form-group">
											<label>Địa chỉ Email:<span class="required">*</span></label><input
												type="email" name="email" id="name" class="form-control"
												data-validation-error-msg="Email định dạng sai"
												placeholder="hãy nhập đúng địa chỉ mail để chúng tôi có thể phản hồi"
												data-validation="required" required />
										</fieldset>
									</div>
									<div class="col-sm-12">
										<fieldset class="form-group">
											<label>Chủ đề:<span class="required">*</span></label> <input
												type="text" name="subject" id="subject" class="form-control"
												data-validation-error-msg="Không được để trống"
												data-validation="required" />
										</fieldset>
									</div>
									<div class="col-12">
										<fieldset class="form-group">
											<label>Nội dung<span class="required">*</span></label>
											<textarea name="content" id="enquiry" class="form-control"
												rows="5" data-validation-error-msg="Không được để trống"
												data-validation="required" required></textarea>
										</fieldset>
										<div class="pull-xs-left">
											<button type="submit" class="btn">Gửi đi</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--footer-->
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script>
			function hienThi(x, a) {
				document.getElementById(x).style.display = a;
			}
		</script>
</body>

</html>