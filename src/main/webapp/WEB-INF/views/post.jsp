<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	href="${pageContext.request.contextPath}/css/post.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

<title>Nhà sách Online giá tốt nhất</title>
</head>

<body class="font">
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid col-md-12">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="/post">Tin tức</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-xs-12 col-md-3 post" id="post-top">
					<h5 style="border: 0;">XEM NHIỀU NHẤT</h5>
					<div class="row post-most">
						<div class="col-3 col-sm-3 col-md-3">
							<img src="${pageContext.request.contextPath}/img/${post.image}"
								width="50px" height="50px" alt="${post.title}"
								class="img-responsive center-block">

						</div>
						<div class="col-9 col-sm-9 col-md-9">
							<h6>
								<a class="post-most-title" href="/post/${post.id}-${post.title}" title="${post.title}"
									style="font-weight: none;">${post.title}</a>
							</h6>
						</div>
					</div>

				</div>
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-12">
							<h1 class="title-head">${post.title}</h1>
							<div class="post-time">
								<span><fmt:formatDate value="${post.createdDate}"
										pattern="dd/MM/yyyy" /></span>
							</div>
							<h2 class="description_short">
								<strong>
									<p>${post.description}</p>
								</strong>
							</h2>
							<div class="top-cate-head clearfix">${post.details}</div>
						</div>

					</div>
				</div>
				<div class="col-sm-12 col-xs-12 col-md-3 post" id="post-bottom">
					<h5 style="border: 0;">XEM NHIỀU NHẤT</h5>
					<div class="row post-most">
						<div class="col-3 col-sm-3 col-md-3">
							<img src="${pageContext.request.contextPath}/img/${post.image}"
								width="50px" height="50px" alt="${post.title}"
								class="img-responsive center-block">

						</div>
						<div class="col-9 col-sm-9 col-md-9">
							<h6>
								<a class="post-most-title" href="/post/${post.id}-${post.title}" title="${post.title}"
									style="font-weight: none;">${post.title}</a>
							</h6>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<!--end content-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		function hienThi(x, a) {
			document.getElementById(x).style.display = a;
		}
	</script>
	<!--End -->
</body>

</html>