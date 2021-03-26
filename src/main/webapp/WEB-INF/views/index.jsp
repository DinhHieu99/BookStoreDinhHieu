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
	href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Nhà sách Online giá tốt nhất</title>

</head>

<body class="font">
	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- header -->
	<section class="awe-section-1">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner ">
				<div class="carousel-item active">
					<img
						src="https://vbooks.exdomain.net/image/cache/catalog/slider/slider_2-1349x460.jpg "
						alt="Banner #1" />
				</div>

				<div class="carousel-item ">
					<img
						src="https://vbooks.exdomain.net/image/cache/catalog/slider/slider_1-1349x460.jpg "
						alt="Banner #2" />
				</div>
			</div>

			<!--Left and right controls-->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon "></span>
			</a> <a class="carousel-control-next" href="#myCarousel"
				data-slide="next"> <span class="carousel-control-next-icon "></span>
			</a>
		</div>
	</section>
	<!-- container -->
	<div class="container-fluid">
		<div class="content">
			<div class="section-head ">
				<c:forEach var="category" items="${category}" begin="0" end="0">
					<h2>Sách mới ra mắt</h2>
					<a href="/category/${category.id}-${category.name}"
						class="view-more">XEM THÊM</a>
				</c:forEach>
			</div>
			<div class="wrapper-tab col-md-12">
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${product}">
							<div class="col-md-3 col-6">
								<div class="card-body col-md-12">
									<div class="card-img ">
										<span class="product-item__sale "> -${product.percentDiscount}% </span> <a
											href="/product/${product.id}-${product.name}"> <img
											class="card-img "
											src="${pageContext.request.contextPath}/img/${product.imgProduct}"
											alt="${product.name} " />
										</a>
									</div>

									<div class="center card-title">
										<a title="Bí mật cookies "
											href="/product/${product.id}-${product.name}"
											class="text-dark card-title center ">${product.name}</a>
										<div class="card-text ">
											<span class="price ">${product.discount}đ</span>
											<del class="discount ">${product.price}đ</del>
										</div>
									</div>
									<div class="box-hover card-title center">
										<a href="/addCart-${product.id}"><button
												class="btn btn-buy btn-cart btn-gray " title="Mua ngay ">
												<i class="fa fa-shopping-cart "></i>
											</button></a> <a href="/product/${product.id}-${product.name}"
											class="quick-view " title="Xem "> <i
											class="fa fa-search "></i>
										</a>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="our-service">
					<div class="col-md-12 card-deck">
						<div class="col-md-3">
							<div class="service">
								<img
									src="${pageContext.request.contextPath}/img/policy1_hover-0x0.png"
									alt=" " />
								<div class=" ">
									<p>
										<strong>GIAO HÀNG 24H</strong>
									</p>
									<div></div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service">
								<img
									src="${pageContext.request.contextPath}/img/policy2_hover-0x0.png"
									alt=" " />
								<div class=" ">
									<p>
										<strong>CHẤT LƯỢNG</strong>
									</p>
									<div></div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service">
								<img
									src="${pageContext.request.contextPath}/img/policy3_hover-0x0.png"
									alt=" " />
								<div class=" ">
									<p>
										<strong>NGUỒN GỐC</strong>
									</p>
									<div></div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service">
								<img
									src="${pageContext.request.contextPath}/img/policy4_hover-0x0.png"
									alt=" " />
								<div class=" ">
									<p>
										<strong>ĐỔI TRẢ</strong>
									</p>
									<div></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section-head ">
				<c:forEach var="product1" items="${product1}" begin="0" end="0">
					<h2>${product1.categories.name}</h2>
					<a
						href="/category/${product1.categories.id}-${product1.categories.name}"
						class="view-more">XEM THÊM</a>
				</c:forEach>
			</div>
			<div class="wrapper-tab col-md-12" style="padding-top: 25px;">
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${product1}">
							<div class="col-md-3 col-6">
								<div class="card-body col-md-12">
									<div class="card-img ">
										<span class="product-item__sale "> -${product.percentDiscount}% </span> <a
											href="/product/${product.id}-${product.name}"> <img
											class="card-img "
											src="${pageContext.request.contextPath}/img/${product.imgProduct}"
											alt="${product.name} " />
										</a>
									</div>

									<div class="center card-title">
										<a title="Bí mật cookies "
											href="/product/${product.id}-${product.name}"
											class="text-dark card-title center ">${product.name}</a>
										<div class="card-text ">
											<span class="price ">${product.discount}đ</span>
											<del class="discount ">${product.price}đ</del>
										</div>
									</div>
									<div class="box-hover card-title center">
										<a href="/addCart-${product.id}"><button
												class="btn btn-buy btn-cart btn-gray " title="Mua ngay ">
												<i class="fa fa-shopping-cart "></i>
											</button></a> <a href="/product/${product.id}-${product.name}"
											class="quick-view " title="Xem "> <i
											class="fa fa-search "></i>
										</a>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="section-head ">
				<c:forEach var="product2" items="${product2}" begin="0" end="0">
					<h2>${product2.categories.name}</h2>
					<a
						href="/category/${product2.categories.id}-${product2.categories.name}"
						class="view-more">XEM THÊM</a>
				</c:forEach>
			</div>
			<div class="wrapper-tab col-md-12" style="padding-top: 25px;">
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${product2}">
							<div class="col-md-3 col-6">
								<div class="card-body col-md-12">
									<div class="card-img ">
										<span class="product-item__sale "> -${product.percentDiscount}% </span> <a
											href="/product/${product.id}-${product.name}"> <img
											class="card-img "
											src="${pageContext.request.contextPath}/img/${product.imgProduct}"
											alt="${product.name} " />
										</a>
									</div>

									<div class="center card-title">
										<a title="Bí mật cookies "
											href="/product/${product.id}-${product.name}"
											class="text-dark card-title center ">${product.name}</a>
										<div class="card-text ">
											<span class="price ">${product.discount}đ</span>
											<del class="discount ">${product.price}đ</del>
										</div>
									</div>
									<div class="box-hover card-title center">
										<a href="/addCart-${product.id}"><button
												class="btn btn-buy btn-cart btn-gray " title="Mua ngay ">
												<i class="fa fa-shopping-cart "></i>
											</button></a> <a href="/product/${product.id}-${product.name}"
											class="quick-view " title="Xem "> <i
											class="fa fa-search "></i>
										</a>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		
		$(document).ready(function(){
			
			$("#searchProduct").keyup(function(){	
				var nameProductSearch = document.getElementById("searchProduct").value;
				
				$.ajax({
					url: "${pageContext.request.contextPath}/living-search",
					type: "get",
					data: {
						nameProduct: nameProductSearch
					},
					success: function(response){
						$("#resultLivingSearch").html(response);
					},
					error: function(xhr){
						alert('Error')
					}
				});
				
			});
			
			
			
		});
	</script>
	<!--  -->
	
<!--  -->
</body>

</html>