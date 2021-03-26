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
	href="${pageContext.request.contextPath}/css/cart.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Giỏ hàng</title>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid col-md-12">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li>Giỏ hàng</li>
			</ul>
		</div>

		<div class="wrapper-tab">
			<div class="title">
				<span>GIỎ HÀNG</span>
			</div>

			<div class="content-web">
				<div class="container">
					<div class="row">
						<div class="container-left col-md-9">
							<c:forEach var="cart" items="${sessionScope.cart}">
								<form modelAttribute="cart" action="/editProduct-${cart.id}"
									method="post">
									<input name="products.id" type="hidden"
										value="${cart.products.id}" />
									<div class="row">
										<div class="col-xs-3">
											<a class="product-image" href="#"
												title="${cart.products.name}"> <img
												alt="${cart.products.name}"
												src="${pageContext.request.contextPath}/img/${cart.products.imgProduct}"
												width="180px">
											</a>
										</div>
										<div class="col-xs-3 box-info-product">
											<p class="name" style="width: 120px;">${cart.products.name}</p>
											<p class="action">
												<a class="btn btn-link" href="/removeProduct-${cart.id}"
													style="text-decoration: none;">Xóa</a>
											</p>
											<a href="/editProduct">
												<button type="submit" id="update" data-toggle="tooltip"
													title="Cập nhật" class="btn btn-primary">
													<i class="fa fa-refresh"></i>
												</button>
											</a>
										</div>
										<div class="col-xs-3 box-price" style="padding-left: 7%;">
											<p class="price" name="discount">${cart.discount}đ</p>
											<input name="discount" type="hidden" value="${cart.discount}" />

										</div>
										<div class="col-xs-3 box-button form-group">
											<button class="btn items-count btn_plus" type="button">+</button>
											<input name="quantity" id="quantity" type="number"
												maxlength="12" min="1" class="form-control input_pop"
												size="4" value="${cart.quantity}" style="width: 60px" />
											<button class="btn items-count btn_minus" type="button">–</button>
											<input name="money" type="hidden"
												value="${cart.discount*cart.quantity}" />
										</div>
									</div>
								</form>
							</c:forEach>
						</div>
						<div class="container-right col-md-3">
							<c:if test="${ThanhTien > 0}">
								<div class="row">
									<div class="col-md-12 box-cart-price">
										<p class="box-style">
											<span>Thành tiền:</span> <span class="price"><strong><c:choose>
														<c:when test="${ThanhTien > 0}">
															<c:out value="${ThanhTien}" />
														</c:when>
														<c:otherwise>0</c:otherwise>
													</c:choose>đ</strong></span>
										</p>
										<p class="box-style">
											<span>Tổng số:</span><span class="price"><strong><c:choose>
														<c:when test="${ThanhTien > 0}">
															<c:out value="${ThanhTien}" />
														</c:when>
														<c:otherwise>0</c:otherwise>
													</c:choose>đ</strong></span>
										</p>
										<a href="/pay" style="text-decoration: none">
											<button class="btn btn-large btn-block btn-danger"
												type="button" title="Tiến hành thanh toán">Tiến
												hành thanh toán</button>
										</a> <a href="/" style="text-decoration: none">
											<button class="btn btn-large btn-block btn-danger"
												type="button" title="Tiếp tục mua hàng">Tiếp tục
												mua hàng</button>
										</a>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="content-mob">
				<div class="container">
					<c:forEach var="cart" items="${sessionScope.cart}">
						<form method="post" action="/editProduct-${cart.id}"
							modelAttribute="cart">
							<input name="products.id" type="hidden"
								value="${cart.products.id}" />
							<div class="row">
								<div class="col-6">
									<a class="product-image " href="#"
										title="${cart.products.name}"> <img
										alt="${cart.products.name}"
										src="${pageContext.request.contextPath}/img/${cart.products.imgProduct}"
										width="100%">
									</a>
								</div>
								<div class="col-6 box-info-product">
									<p class="name">${cart.products.name}</p>
									<div class="col-xs-3 box-price">
										<p class="price">${cart.discount}đ</p>
										<input name="discount" type="hidden" value="${cart.discount}" />
									</div>
									<p class="action">
										<a class="btn btn-link" href="/removeProduct-${cart.id}">Xóa</a>
										<a href="/editProduct">
											<button type="submit" data-toggle="tooltip" title="Cập nhật"
												class="btn btn-primary">
												<i class="fa fa-refresh"></i>
											</button>
										</a>
									</p>
									<div class="box-button form-group col-12">
										<button class="btn items-count btn_plus" type="button"
											style="background: #fff; border: 1px solid #2edc7c; color: #000">+</button>
										<input name="quantity" type="number" maxlength="12" min="1"
											class="form-control input_pop" size="4"
											value="${cart.quantity}" style="width: 50px" />
										<button class="btn items-count btn_minus" type="button"
											style="background: #fff; border: 1px solid #2edc7c; color: #000">–</button>
										<input name="money" type="hidden"
											value="${cart.discount*cart.quantity}" />
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
					<c:if test="${ThanhTien > 0}">
						<div class="row">
							<div class="col-12 box-cart-price">
								<p class="box-style">
									<span>Thành tiền:</span> <span class="price"><strong>
											<c:choose>
												<c:when test="${ThanhTien > 0}">
													<c:out value="${ThanhTien}" />
												</c:when>
												<c:otherwise>0</c:otherwise>
											</c:choose>đ
									</strong></span>
								</p>
								<p class="box-style">
									<span>Tổng số:</span><span class="price"><strong><c:choose>
												<c:when test="${ThanhTien > 0}">
													<c:out value="${ThanhTien}" />
												</c:when>
												<c:otherwise>0</c:otherwise>
											</c:choose>đ</strong></span>
								</p>
								<a href="/pay/id=<%=session.getAttribute("idUser")%>"
									style="text-decoration: none">
									<button class="btn btn-large btn-block btn-danger"
										type="button" title="Tiến hành thanh toán">Tiến hành
										thanh toán</button>
								</a> </a> <a href="/" style="text-decoration: none">
									<button class="btn btn-large btn-block btn-danger"
										type="button" title="Tiếp tục mua hàng">Tiếp tục mua
										hàng</button>
								</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('button.items-count').on(
							'click',
							function() {
								var result = $(this).closest('.box-button')
										.find('input.input_pop');
								var qty = parseInt(result.val());
								if ($(this).hasClass('btn_minus'))
									if (!isNaN(qty) && qty > 1)
										result.val(--qty);
								if ($(this).hasClass('btn_plus'))
									if (!isNaN(qty))
										result.val(++qty);
							});
				});

		/* $("#update").click(function(e){
			e.preventDefault();
			var data = {
					"quantity": $("#quantity").val(),
				
			};
		//		data["email"] = $('#'+elementIdOfEmail).val();
			
			$.ajax({
				url: "/edit",
				type: "post",
				contentType: "application/json", // d? li?u g?i lên web-service có d?ng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // d? li?u t? web-service tr? v? là json.
				success: function(jsonResult) { // du?c g?i khi web-service tr? v? d? li?u.
					window.location.href = "http://127.0.0.1:8080/news/detail/${news.id}";
				}
			});
		}); */
	</script>
</body>

</html>