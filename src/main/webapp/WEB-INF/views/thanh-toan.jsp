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
	href="${pageContext.request.contextPath}/css/thanhToan.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<!-- icon trang thẻ web-->
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<!-- icon trang thẻ web-->


<title>Thanh Toán</title>
</head>

<body class="font">

	<!--header-->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!--header-->
	<div class="container-fluid">
		<div class="wrapper-tab">
			<ul class="breadcrumb">
				<li class="home"><a href="/"> <span><i
							class="fa fa-home"></i> Trang chủ</span>
				</a> <span><i class="fa">/&nbsp;</i></span></li>
				<li><a href="#"> <span>Thanh toán</span>
				</a></li>

			</ul>
		</div>
		<div class="container">
			<div calss="row">
				<div class="col-md-8" style="float: left;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h6 class="panel-title">
								<i class="fa fa-info-circle" aria-hidden="true"></i> Địa chỉ
								nhận hàng
							</h6>
						</div>
						<form action="/pay/addPay" method="post" modelAttribute="hoaDon">
							<div class="panel-body">
								<!-- Apply for VN -->
								<input name="user.id" type="hidden" value="${user.id}">
								<div class="form-group required" style="margin: 10px 5px;">
									<div class="row">
										<label class="control-label col-md-2">Tên đầy đủ</label>
										<div class="col-sm-10">
											<input type="text" id="input-firstname" name="fullName"
												value="${user.name}" placeholder="Nhập họ tên"
												class="form-control" required="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group required">
											<div class="row">
												<label class="control-label col-sm-4">Email</label>
												<div class="col-sm-8">
													<input type="email" id="input-email" name="email"
														value="${user.email}" placeholder="Nhập email"
														class="form-control" required="" />
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group required">
											<div class="row">
												<label class="control-label col-sm-4" for="input-telephone">Điện
													thoại</label>
												<div class="col-sm-8">
													<input type="text"  name="mobile"
														id="input-telephone" value="${user.mobile}"
														placeholder="Nhập số điện thoại" class="form-control"
														required="" />
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group required">
											<div class="row">
												<label class="control-label col-sm-4" for="input-telephone">Địa
													chỉ</label>
												<div class="col-sm-8">
													<input type="text" id="input-telephone"
														value="${user.address}" placeholder="Nhập địa chỉ"
														class="form-control" required="" />
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group required">
											<div class="row">
												<label class="control-label col-sm-4" for="input-telephone">Địa
													chỉ cần chuyển</label>
												<div class="col-sm-8">
													<input type="text" name="" id="input-telephone"
														value="${user.address}" placeholder="Nhập địa chỉ"
														class="form-control" required="" />
												</div>
											</div>

										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<div class="row">
												<label class="control-label col-md-2" for="input-address">Địa
													chỉ chi tiết</label>
												<div class="col-sm-10">
													<input type="text" name="deliveryAddress"
														id="input-telephone" value=""
														placeholder="Nhập chi tiết địa chỉ" class="form-control"
														required="" />
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="form-group">
									<label class="control-label col-md-2" for="input-zoneid"
										id="label-zone">Lời nhắn</label>
									<div class="col-sm-10">
										<textarea name="message" id="input-comment" rows="3"
											class="form-control" placeholder="Nếu có lời nhắn thì ghi"></textarea>
									</div>
								</div>

							</div>

							<div class="form-group">
								<div class="col-sm-12">
									<div class="adr-oms checkbox">
										<input type="checkbox" name="same_info_as_buyer_toggle"
											id="is-delivery-address" checked /> <label
											for="is-delivery-address"><strong>Địa chỉ
												nhận hàng và thanh toán giống nhau</strong></label>
									</div>
								</div>

							</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h6 class="panel-title">
								<i class="fa fa-credit-card" aria-hidden="true"></i> Phương thức
								thanh toán
							</h6>
						</div>
						<div class="panel-body">

							<div class="group">
								<div class="row">
									<input type="radio" id="payment-method-bank_transfer" value="true"
										name="pay" /> <label for="payment-method-bank_transfer">
										<div class="row">
											<div class="thumbnail col-md-2">
												<img alt="Chuyển khoản"
													src="${pageContext.request.contextPath}/img/bank_transfer.png" />
											</div>
											<div class="description col-md-10">
												<div class="title">Chuyển khoản</div>
												<div class="subtitle">Sử dụng thẻ ATM hoặc dịch vụ
													Internet Banking để tiến hành chuyển khoản cho chúng tôi</div>
												<div class="tkz-selection-info"></div>
											</div>
										</div>
									</label>
								</div>
							</div>
							<div class="group">
								<div class="row">
									<input type="radio" id="payment-method-cod" name="pay" value="false" checked/> <label
										for="payment-method-cod">
										<div class="row">
											<div class="thumbnail col-md-2">
												<img alt="Thu tiền tại nhà (COD)"
													src="${pageContext.request.contextPath}/img/cod.png" />
											</div>
											<div class="description col-md-10">
												<div class="title">Thu tiền tại nhà (COD)</div>
												<div class="subtitle">Khách hàng thanh toán bằng tiền
													mặt cho nhân viên giao hàng khi sản phẩm được chuyển tới
													địa chỉ nhận hàng</div>
												<div class="tkz-selection-info"></div>
											</div>
										</div>
									</label>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-4" style="float: right;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-shopping-cart" aria-hidden="true"></i> Đơn hàng</strong>
								(${SoLuongSanPham} sản phẩm)
							</h3>
						</div>
						<div class="panel-body">
							<table class="adr-oms table table_order_items">
								<tbody>
									<c:forEach var="cartProducts" items="${sessionScope.cart}">
										<tr class="group-type-1 item-child-0">
											<td class="row">
												<div class="col-3">
													<div class="thumbnail">
														<a target="_blank" rel="noopener" href="#"
															title="${cartProducts.products.name}"> <img
															src="${pageContext.request.contextPath}/img/${cartProducts.products.imgProduct}"
															alt="${cartProducts.products.name}" width="84" />
															
														</a>
													</div>
												</div>
												<div class="col-6">
													<div class="table_order_items-cell-title">
														<div class="table_order_items_product_name">
															<a target="_blank" rel="noopener" href="#"
																title="${cartProducts.products.name}"> <span
																class="title">${cartProducts.products.name}</span></a>
																
														</div>

													</div>
												</div>
												<div class="col-3 ">
													<div class="tt-price">${cartProducts.discount}đ</div>
													<div class="quantity text-right">x${cartProducts.quantity}</div>
													<div class="tt-price">${cartProducts.money}đ</div>
													<input type="hidden" name="money" value="${cartProducts.money}">
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-truck" aria-hidden="true"></i> Vận chuyển
							</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-sm-12">
									<span id="ajax-load-shipping-method">
										<div>
											<strong>Phí giao hàng tận nơi</strong>
										</div>
										<div class="radio">
											<label> <input type="radio" name="shipping_method"
												checked /> Phí giao hàng tận nơi - 0đ
											</label>
										</div>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table">
								<tbody>
									<tr>
										<td class="text-left">Thành tiền</td>
										<td class="text-right"><strong class=""
											style="font-size: 13px;">${ThanhTien}đ</strong> <input
											type="hidden" name="money" value="${ThanhTien}" /></td>

									</tr>
									<tr>
										<td class="text-left">Phí giao hàng tận nơi</td>
										<td class="text-right"><strong class="">0đ</strong></td>
									</tr>
									<tr>
										<td class="text-left">Tổng số</td>
										<td class="text-right"><strong class="text-danger">${ThanhTien}đ</strong>
											<input type="hidden" name="totalMoney" value="${ThanhTien}" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="text-center ">
						<a class="pull-left" href="/carts" title="Quay lại giỏ hàng">
							<i class="fa fa-mail-reply-all" aria-hidden="true"></i> Quay lại
							giỏ hàng
						</a>
						<button class="btn btn-primary pull-right" type="submit">
							Đặt hàng <i class="fa fa-angle-right"></i>
						</button>
					</div>
				</div>
			</div>
			</form>
			<!--footer-->
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
			<script>
				function hienThi(x, a) {
					document.getElementById(x).style.display = a;
				}
			</script>
			<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
			<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>