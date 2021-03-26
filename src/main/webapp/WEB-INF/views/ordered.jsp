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
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<style>
table td, th {
	border: 1px solid #ddd;
	text-align: center;
	vertical-align: middle;
}

table tr td .btn {
	border: 1px solid springgreen;
	background: springgreen;
	color: snow;
	width: 60px;
	margin-right: 10px
}

table tr td .btn:hover {
	background: snow;
	color: springgreen;
}

table tr td, th {
	line-height: 40px;
}

table tr .price {
	color: red;
	font-weight: bold;
}

table tr:hover {
	background: white;
}

.product-title {
	text-decoration: none;
	color: #474C5F;
}

.product-title:hover {
	text-decoration: none;
	color: springgreen;
}
</style>
<title>Đơn hàng</title>
</head>

<body class="font">

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<div class="container-fluid col-md-12">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li>Đơn hàng</li>
			</ul>
		</div>
		<div class="wrapper-tab">
			<div class="title">
				<h4>ĐƠN HÀNG</h4>
			</div>

			<div class="container">
				<div class="row">
					<table class="col-md-12 col-12">
						<tr>
							<th>Đơn hàng</th>
							<th>Ngày</th>
							<th>Tình trạng</th>
							<th>Tổng tiền</th>
							<th>Các thao tác</th>
						</tr>
						<c:forEach var="order" items="${order}">
							<tr>
								<td><a href="/view-ordered/${order.id }"
									class="product-title"># ${order.id}</a></td>
								<td><fmt:formatDate value="${order.created}"
										pattern="dd/MM/yyyy" /></td>
								<td><c:if
										test="${order.status == 0 }">
								Đang chờ được sử lý...
								</c:if> <c:if test="${order.status == 1 }">
								Đã xác nhận đơn hàng
								</c:if> <c:if test="${order.status == 2 }">
								Đang chuyển hàng
								</c:if> <c:if test="${order.status == 3 }">
								Đã chuyển hàng
								</c:if></td>
								<td class="price">${order.totalMoney}đ</td>
								<td><a class="btn" href="/view-ordered/${order.id }">Xem</a></td>
							</tr>
						</c:forEach>
					</table>
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
	</script>
</body>

</html>