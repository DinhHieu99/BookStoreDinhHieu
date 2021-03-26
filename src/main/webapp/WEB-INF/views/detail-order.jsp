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
	href="${pageContext.request.contextPath}/css/Thank.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">

<title>Chi tiết đơn hàng</title>
<style type="text/css">
h6 {
	font-size: 17px;
}
</style>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="#"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="/carts"> <span>Giỏ hàng</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Thanh toán</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Thành công</span>
				</a></li>
			</ul>
		</div>
		<div class="container">

			<div class="row">
				<div class="col-md-6">
					<c:forEach var="cart" items="${cart}" begin="0" end="0">
						<h6>
							Đơn hàng #${cart.order.id} đã được đặt lúc
							<fmt:formatDate value="${cart.order.created}"
								pattern="dd/MM/yyyy" />
							và hiện tại là
							<c:if test="${cart.order.status == 0 }">
								đang chờ được sử lý
								</c:if>
							<c:if test="${cart.order.status == 1 }">
								đã xác nhận đơn hàng
								</c:if>
							<c:if test="${cart.order.status == 2 }">
								đang chuyển hàng
								</c:if>
							<c:if test="${cart.order.status == 3 }">
								đã chuyển hàng
								</c:if>
							</td>
						</h6>
						<h4 class="title">Chi tiết đơn hàng</h4>
					</c:forEach>
					<table>
						<tr class="row">
							<th class="col-md-6 col-6">Sản phẩm</th>
							<th class="right col-md-6 col-6">Tổng</th>
						</tr>
						<c:forEach var="cart" items="${cart}">
							<tr class="row">
								<td class="col-md-6 col-6"><a
									href="/product/${cart.products.id}-${cart.products.name}"
									class="product-title">${cart.products.name}</a>
									x${cart.quantity}</td>
								<td class="right price col-md-6 col-6">${cart.discount}đ</td>
							</tr>
						</c:forEach>
						<c:forEach var="cart" items="${cart}" begin="0" end="0">
							<tr class="row">
								<td class="col-md-6 col-6">Phương thức thanh toán:</td>
								<td class="right col-md-6 col-6"><c:if
										test="${cart.order.status == 0 }">
								đang chờ được sử lý
								</c:if> <c:if test="${cart.order.status == 1 }">
								đã xác nhận đơn hàng
								</c:if> <c:if test="${cart.order.status == 2 }">
								đang chuyển hàng
								</c:if> <c:if test="${cart.order.status == 3 }">
								đã chuyển hàng
								</c:if></td>
							</tr>
							<tr class="row">
								<td class="col-md-6 col-6">Tổng cộng:</td>
								<td class="right price col-md-6 col-6">${cart.order.totalMoney}đ</td>
							</tr>
					</table>
				</div>
				<div class="col-md-5 thank">
					<p>Địa chỉ nhận hàng</p>
					<ul class="details">

						<li>Tên người đặt: ${cart.order.fullName}</li>
						<li>Số điện thoại: ${cart.order.mobile}</li>
						<li>Địa chỉ chuyển hàng: ${cart.order.deliveryAddress}</li>
						<li>Ngày đặt hàng: <fmt:formatDate
								value="${cart.order.created}" pattern="dd/MM/yyyy" /></li>
						<li>Lời nhắn: ${order.message}</li>

						</c:forEach>
					</ul>
				</div>
				<div class="col-md-12" style="margin-top: 10px;">
					<a class="btn btn-primary">Tiếp tục</a>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script type="text/javascript">
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
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>