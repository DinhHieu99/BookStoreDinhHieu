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
	href="${pageContext.request.contextPath}/css/sanPham.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<title>Sản phẩm</title>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Sản phẩm</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a
					href="/category/${product.categories.id}-${product.categories.name}">
						<span>${product.categories.name}</span>
				</a></li>
			</ul>
		</div>

		<form action="/addProduct" method="post" modelAttribute="product">
			<div class="content col-md-12">
				<div class="wrapper-tab col-md-8">
					<div class="content-left col-sm-4">
						<picture> <img class="card-img" alt="${product.name}"
							src="${pageContext.request.contextPath}/img/${product.imgProduct}"
							style="width: 260px" /> </picture>
					</div>
					<div class="col-sm-4 card-img" id="img_01">
						<picture> <img alt="${product.name}" width="100%"
							class="card-img"
							src="${pageContext.request.contextPath}/img/${product.imgProduct}" />
						</picture>
					</div>
					<div class="content-inner col-sm-7">
						<div class="title">
							<h4>${product.name}</h4>
							<input type="hidden" name="nameProduct" value="${product.name}">
						</div>
						<div class="statusText">
							<div class="inventory_quantity">
								<span class="stock-brand-title"><strong><i
										class="fa fa-check-circle"></i>Tình trạng: </strong></span> <span
									class="status-title">${status_product}</span>
							</div>
							<div class="price-box">
								<span class="special-price"> <span class="price">${product.discount}
										đ</span>
								</span> <span class="discount"><del>${product.price} đ</del> </span>

							</div>
							<div class="rating-top">
								<c:if test="${avgStar == 0 ||avgStar == null}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${(avgStar - 0)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
								<c:if test="${(avgStar -1)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
								<c:if test="${(avgStar -2)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
								<c:if test="${(avgStar - 3)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
								<c:if test="${(avgStar - 4)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
								<c:if test="${(avgStar - 5)>0 }">
									<i class="fa fa-star checked"></i>
								</c:if>
							</div>
						</div>
						<div class="form-product">
							<div id="product">
								<div class="form-group">
									<input type="hidden" name="id" value="${product.id}"> <input
										type="hidden" name="discount" value="${product.discount}">
									<button class="btn btn_num" type="button" onclick="minus();">-</button>
									<input name="quantity" type="number" id="input-quantity"
										maxlength="10" min="1" class="form-control amount" size="4"
										max="${product.quantity}" value="1" style="width: 70px">

									<button class="btn btn_num" type="button" onclick="plus();">+</button>
								</div>
								<p id="check"></p>
								<div class="button_actions">

									<button type="submit" id="button-cart" class="btn-buy">
										<span class="btn-content">Thêm vào giỏ</span>
									</button>

								</div>

							</div>
						</div>
					</div>
					<div class="content-main col-md-12">
						<div class="describe-title">
							<span>Mô tả</span>
						</div>
						<div class="describe-text" id="describe">${product.describe}</div>
					</div>
				</div>
		</form>

		<div class="content-right col-md-3">
			<div class="title">
				<span>Sách mới ra mắt</span>
			</div>
			<c:forEach var="mostView" items="${mostView}" begin="0" end="3">
				<div class="product-news col-md-12">
					<div class="product-img col-md-3">
						<a href="/product/${mostView.id}-${mostView.name}"> <img
							src="${pageContext.request.contextPath}/img/${mostView.imgProduct}"
							alt="${mostView.name}" style="height: 60px; width: 40px">
						</a>
					</div>
					<div class="product-name col-md-8">
						<div class="product-title">
							<a href="/product/${mostView.id}-${mostView.name}"> <span>${mostView.name}</span></a>
						</div>
						<div class="product-price">
							<span class="price">${mostView.discount}</span> <span
								class="discount"><del>${mostView.price}</del></span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="content-bottom col-md-12">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h4 class="col-md-12">${countComment}lượtbình luận</h4>
						<div class="row" style="max-height: 400px; overflow: auto;">

							<c:forEach var="rating" items="${rating}">
								<div class="col-md-12 row">
									<div class="comment-avatar col-md-2">
										<img src="${pageContext.request.contextPath}/img/avatar.png"
											alt="lỗi" />
									</div>

									<div class="comment col-md-10 rating-top">
										<c:if test="${(rating.rating - 0)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<c:if test="${(rating.rating -1)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<c:if test="${(rating.rating -2)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<c:if test="${(rating.rating - 3)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<c:if test="${(rating.rating - 4)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<c:if test="${(rating.rating - 5)>0 }">
											<i class="fa fa-star checked"></i>
										</c:if>
										<p>${rating.user.name}</p>
										<span>${rating.comment}</span>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
					<div class="col-md-3"
						style="border: 2px solid blue; margin-left: 30px">
						<h3>Thêm đánh giá</h3>
						<p>Đánh giá của bạn</p>
						<%
						if (session.getAttribute("idUser") != null) {
						%>
						<div class="rating" id="cate-rating">
							<a href="javascript:void(0)" class="star" id="star-1"><i
								class="fa fa-star"></i></a> <a href="javascript:void(0)"
								class="star" id="star-2"><i class="fa fa-star"></i></a> <a
								href="javascript:void(0)" class="star" id="star-3"><i
								class="fa fa-star"></i></a> <a href="javascript:void(0)"
								class="star" id="star-4"><i class="fa fa-star"></i></a> <a
								href="javascript:void(0)" class="star" id="star-5"><i
								class="fa fa-star"></i></a>
						</div>
						<div class="commen-user">
							<input type="hidden" id="star" value=""> <input
								type="text" id="comment_user" placeholder="bình luận" /><br>
							<input type="button" id="comment" class="btn btn-primary"
								value="Gửi">
						</div>
						<%
						} else {
						%>
						<p>
							Bạn phải <a href="/login" style="text-decoration: none">đăng
								nhập</a>
						</p>
						<%
						}
						%>
					</div>

				</div>
			</div>

		</div>
	</div>

	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<script type="text/javascript">
		function plus() {
			var a = document.getElementById('input-quantity');
			var quantity = a.value;
			if (!isNaN(quantity))
				a.value++;
			return false;
		}

		function minus() {
			var a = document.getElementById('input-quantity');
			var quantity = a.value;
			if (!isNaN(quantity) && quantity >= 1)
				a.value--;
			return false;
		}
		
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		
		$(document).ready(function() {
			$('a.star').mouseenter(function() {
				if ($('#cate-rating').hasClass('rating-ok') == false) {
					var eID = $(this).attr('id');
					eID = eID.split('-').splice(-1);
					$('a.star').removeClass('vote-hover');
					var rating=0;
					for (var i = 1; i <= eID; i++) {
						$('#star-' + i).addClass('vote-hover');	
						$("#star").val(i);
					}
				}
			});
		});
		
		$("#comment").click(function(e){
			e.preventDefault();
			
			var data = {
					"comment": $("#comment_user").val(),
					"rating": $("#star").val(),
					"idProduct": ${product.id}
			};
			
			$.ajax({
				url: "/comment",
				type: "post",
				contentType: "application/json", // d? li?u g?i lên web-service có d?ng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // d? li?u t? web-service tr? v? là json.
				success: function(jsonResult) { // du?c g?i khi web-service tr? v? d? li?u.
					window.location.href = "${pageContext.request.contextPath}/product/${product.id}-${product.name}";
					
				}
			});
		});
		
		function checkQuantity() {
			var quantity = $(product.quantity).val();
			var dat = $("#input-quantity").val();
			var s = (quantity.value -dat.value);

			if (s <=0) {
				$("#check").html("hết hàng");
			}


		}
		$(document).ready(function() {
			
			$("#input-quantity").keyup(checkQuantity);
		});
	</script>
</body>
</html>