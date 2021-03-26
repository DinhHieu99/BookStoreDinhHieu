<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
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
<title>Đơn hàng</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<style type="text/css">
.table-responsive table tr th {
	vertical-align: middle;
}
</style>
</head>

<body>
	<div class="dashboard-main-wrapper">
		<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
		<!-- ============================================================== -->
		<!-- pageheader -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="container-fluid  dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Bảng dữ liệu</h2>

							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Bảng điều khiển</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Các bảng</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Bảng dữ liệu</a></li>
										<li class="breadcrumb-item active" aria-current="page">Bảng
											đơn hàng</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>

				<!-- ============================================================== -->
				<!-- end pageheader -->
				<div class="row">
					<!-- ============================================================== -->
					<!-- basic table  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Bảng đơn hàng</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Mã hóa đơn</th>
												<th>Tổng tiền</th>
												<th>Người đặt hàng</th>
												<th>Số điện thoại</th>
												<th>Địa chỉ giao hàng</th>
												<th>Xác nhận đơn hàng</th>
												<th>Ngày đặt hàng</th>
												<th>Lời nhắn</th>
												<th>Hành động</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="hoaDon" items="${hoaDon}">
												<tr>
													<td>${hoaDon.id}</td>

													<td>${hoaDon.totalMoney}đ</td>
													<td>${hoaDon.fullName}</td>
													<td>${hoaDon.mobile}</td>
													<td>${hoaDon.deliveryAddress}</td>
													<td><c:if test="${hoaDon.status == 1}">
															<span class="badge-dot badge-success mr-1"></span>Xác nhận
														</c:if> <c:if test="${hoaDon.status == 0}">
															<span class="badge-dot badge-secondary mr-1"></span>Đang chờ xác nhận
														</c:if>
														<c:if test="${hoaDon.status == 2}">
															<span class="badge-dot badge-secondary mr-1"></span>Đang chuyển hàng
														</c:if> <c:if test="${hoaDon.status == 3}">
															<span class="badge-dot badge-success mr-1"></span>Đã chuyển hàng
														</c:if>
														</td>
													<td><fmt:formatDate value="${hoaDon.created}"
															pattern="hh:mm:ss dd/MM/yyyy" /></td>
													<td>${hoaDon.message}</td>
													<td>
														<div class="btn-group ml-auto">
															<c:if test="${hoaDon.status == 0 }">
																<a href="/admin/hoa-don/${hoaDon.id}-1"><button
																		class="btn btn-sm btn-outline-light"
																		onclick="return window.confirm('Xác nhận đơn hàng #${hoaDon.id} ');"
																		>Xác nhận đơn hàng</button></a>
															</c:if>
															<c:if test="${hoaDon.status == 1 }">
																<a href="/admin/hoa-don/${hoaDon.id}-2"><button
																		class="btn btn-sm btn-outline-light"
																		onclick="return window.confirm('Xác nhận đang chuyển đơn hàng #${hoaDon.id} ');"
																		>Xác nhận đang chuyển đơn hàng</button></a>
															</c:if>
															<c:if test="${hoaDon.status == 2 }">
																<a href="/admin/hoa-don/${hoaDon.id}-3"><button
																		class="btn btn-sm btn-outline-light"
																		onclick="return window.confirm('Xác nhận đơn hàng đã chuyển đến #${hoaDon.id} ');"
																		>Xác nhận đã chuyển đển</button></a>
															</c:if>

															<a href="/admin/remove-hoa-don/${hoaDon.id}"><button
																	class="btn btn-sm btn-outline-light"
																	onclick="return window.confirm('Bạn có chắc chắn muốn xoá đơn đặt hàng này không?');">
																	<i class="far fa-trash-alt"></i>
																</button></a>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end basic table  -->
					<!-- ============================================================== -->
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script
		src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script
		src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
	<script
		src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
</body>
</html>