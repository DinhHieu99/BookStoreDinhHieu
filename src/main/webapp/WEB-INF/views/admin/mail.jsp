<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
<title>Liên hệ - Phản hồi</title>
</head>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid">
				<aside class="page-aside">
					<div class="aside-content">
						<div class="aside-header">
							<button class="navbar-toggle" data-target=".aside-nav"
								data-toggle="collapse" type="button">
								<span class="icon"><i class="fas fa-caret-down"></i></span>
							</button>
							<span class="title">Dịch vụ Mail</span>

						</div>

						<div class="aside-nav collapse">
							<ul class="nav">
								<li class="active"><a href="/admin/contacts"><span
										class="icon"><i class="fas fa-fw fa-inbox"></i></span>Hộp thư
										đến<span class="badge badge-primary float-right">${mail}</span></a></li>
								<li><a href="/admin/send-mail"><span class="icon"><i
											class="fas fa-paper-plane"></i></span> Đã gửi mail <span
										class="badge badge-secondary float-right">${sendMail}</span></a></li>
						</div>
					</div>
				</aside>
				<div class="main-content container-fluid p-0">
					<div class="email-inbox-header">
						<div class="row">
							<div class="col-lg-6">
								<div class="email-title">
									<span class="icon"><i class="fas fa-inbox"></i></span> Hộp thư
									đến <span class="new-messages">(${mail} tin mới)</span>
								</div>
							</div>

						</div>
					</div>

					<div class="email-list">
						<c:forEach var="contact" items="${contact}">
							<div class="email-list-item email-list-item--unread">
								<div class="email-list-actions">
									<label class="custom-control custom-checkbox"> <input
										class="custom-control-input checkboxes" type="checkbox"
										value="1" id="one"><span class="custom-control-label"></span>
									</label>
								</div>
								<div class="email-list-detail">
									<a href="/admin/sendMail/id=${contact.id}"> <span
										class="date float-right"><span class="icon"> </span> <fmt:formatDate
												value="${contact.createdDate}" pattern="dd/MM/yyyy" /></span><span
										class="from">${contact.fullName}</span>
										<p class="msg">${contact.content}</p></a>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="../assets/libs/js/main-js.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							// binding the check all box to onClick event
							$(".chk_all").click(function() {

								var checkAll = $(".chk_all").prop('checked');
								if (checkAll) {
									$(".checkboxes").prop("checked", true);
								} else {
									$(".checkboxes").prop("checked", false);
								}

							});

							// if all checkboxes are selected, then checked the main checkbox class and vise versa
							$(".checkboxes")
									.click(
											function() {

												if ($(".checkboxes").length == $(".subscheked:checked").length) {
													$(".chk_all").attr(
															"checked",
															"checked");
												} else {
													$(".chk_all").removeAttr(
															"checked");
												}

											});

						});
	</script>
</body>

</html>