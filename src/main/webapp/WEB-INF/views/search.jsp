<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="vi">

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
	href="${pageContext.request.contextPath}/css/LoaiSP.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Tìm kiếm</title>
</head>

<body class="font">

	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- header -->
	<!--content-->
	<div class="container-fluid col-md-12">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li>${category_name}</li>
			</ul>
		</div>
		<div class="wrapper-tab col-md-12">
			<div class="content-left col-md-3">
				<div class="title">
					<span>LỌC TRUYỆN</span>
				</div>
				<div class="content-left-menu">
					<form name="filter_form">
						<nav class="nav-category navbar-toggleable-md">
							<ul class="nav navbar-pills">
								<li class="nav-item">
									<p class="nav-link active">
										<strong>Thương hiệu</strong>
									</p> <i class="fa fa-angle-down"></i>
									<ul class="navbar-nav" id="supplier">
										<c:forEach var="nhacc" items="${nhacc}">
											<li class="nav-item"><a class="nav-link"> <input
													type="checkbox" name="manufacturer[]" id="group0" value="" />
													<label for="group0">${nhacc.name}</label>
											</a></li>
										</c:forEach>
									</ul>
								</li>
							</ul>
						</nav>

						<!-- <div class="panel-footer text-right hidden">
                            <button type="button" id="button-filter" class="btn btn-primary"></button>
                        </div>-->
					</form>
				</div>
			</div>
			<div class="content-right col-md-9">
				<div class="title">
					<span><strong>Kết quả tìm được</strong></span>
				</div>
				<div class="sort">
					<h5>Sắp xếp theo:</h5>
					<ul class="nav">
						<li class="nav-item"><a class="nav-link"
							href="/category/${category_name}/id=${category_sort}&name=nameProduct&order=DESC"><i></i>Mặc
								định</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/category/${category_name}/id=${category_sort}&name=nameProduct&order=ASC"><i></i>Tên
								(A - Z)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/category/${category_name}/id=${category_sort}&name=nameProduct&order=DESC"><i></i>Tên
								(Z - A)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/category/${category_name}/id=${category_sort}&name=discount&order=ASC"><i></i>Giá
								(Thấp &gt; Cao)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/category/${category_name}/id=${category_sort}&name=discount&order=DESC"><i></i>Giá
								(Cao &gt; Thấp)</a></li>

					</ul>
				</div>
				<div class="sort-cate-right-mobile">
					<div id="sort-by">
						<label class="left">Sắp xếp theo: </label> <select
							class="mdb-select md-form"
							onchange="javascript:handleSelect(this)">
							<option
								value="/category/${category_name}/id=${category_sort}&name=nameProduct&order=DESC">Mặc
								định</option>
							<option
								value="/category/${category_name}/id=${category_sort}&name=nameProduct&order=ASC">Tên
								(A - Z)</option>
							<option
								value="/category/${category_name}/id=${category_sort}&name=nameProduct&order=DESC">Tên
								(Z - A)</option>
							<option
								value="/category/${category_name}/id=${category_sort}&name=discount&order=ASC">Giá
								(Thấp &gt; Cao)</option>
							<option
								value="/category/${category_name}/id=${category_sort}&name=discount&order=DESC">Giá
								(Cao &gt; Thấp)</option>
						</select>
					</div>
				</div>
				<div class="card-columns">
					<c:forEach var="searchProduct" items="${searchProduct}">
						<div class="card">
							<div class="card-body">
								<div class="card-img">
									<span class="product-item__sale ">
										-${searchProduct.percentDiscount }% </span> <a href="/product/${searchProduct.id}-${searchProduct.name} "> <img
										class="card-img" src="${pageContext.request.contextPath}/img/${searchProduct.imgProduct}"
										alt=" ${searchProduct.name}" />
									</a>
								</div>
								<div class="card-title center">
									<a title="${searchProduct.name}"
										href="/product/${searchProduct.id}-${searchProduct.name}"
										class="text-dark card-title center ">
										${searchProduct.name}</a>
									<div class="card-text">
										<span class="price">${searchProduct.discount}đ</span> <strike
											class="discount ">${searchProduct.price}đ</strike>
									</div>
								</div>
								<div class="box-hover card-title center ">
									<a href="/addCart-${searchProduct.id}">
										<button class="btn btn-buy btn-cart btn-gray"
											title="Mua ngay ">
											<i class="fa fa-shopping-cart "></i>
										</button>
									</a> <a href="/product/${searchProduct.id}-${searchProduct.name}"
										class="quick-view " title="Xem "> <i class="fa fa-search "></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--end content-->
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script type="text/javascript">
		function handleSelect(Elm) {
			window.location = Elm.value;
		}
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!--End -->
</body>

</html>