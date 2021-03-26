<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bán hàng</title>
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
										<li class="breadcrumb-item active" aria-current="page">Thống
											kê bán hàng</li>
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

							<h5 class="card-header">Thống kê bán hàng</h5>
							<div class="row">
								<div class="col-md-6">
									<h5 style="margin-left: 20px">Tìm kiếm theo ngày:</h5>
									<form action="/admin/search">

										<input type="date" name="search_date" min="2018-03"
											style="margin-left: 20px">
										<button class="btn icon-fallback-text ">
											<i class="fa fa-search "></i>
										</button>

									</form>
								</div>

								<div class="col-md-6">
									<h5 style="margin-left: 20px">Tìm kiếm theo tháng:</h5>
									<form action="/admin/searchMonth">

										<input type="month" name="search_month" min="2018-03"
											style="margin-left: 20px">
										<button class="btn icon-fallback-text ">
											<i class="fa fa-search "></i>
										</button>

									</form>
								</div>
								<div class="col-md-6">
									<h5 style="margin-left: 20px">
										Tổng thu nhập:
										<c:choose>
											<c:when test="${TongTien > 0}">
												<c:out value="${TongTien}" />
											</c:when>
											<c:otherwise>0</c:otherwise>
										</c:choose>
										đ
									</h5>
								</div>
							</div>
							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Mã hóa đơn</th>
												<th>Mã sản phẩm</th>
												<th>Hình ảnh</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng đặt</th>
												<th>Đơn giá</th>
												<th>Thành tiền</th>
												<th>Tổng tiền</th>
												<th>Nhà cung cấp</th>
												<th>Người đặt hàng</th>

												<th>Xác nhận đơn hàng</th>
												<th>Ngày đặt hàng</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="hoaDon" items="${hoaDon}">
												<tr>
													<td>${hoaDon.id}</td>
													<td>${hoaDon.idProduct}</td>
													<td><img
														src="${pageContext.request.contextPath}/img/${hoaDon.img}"
														alt=" lỗi ảnh" style="width: 100px; hight: 75px;"></td>
													<td>${hoaDon.nameProduct}</td>
													<td>${hoaDon.quantity}</td>
													<td>${hoaDon.price}đ</td>
													<td>${hoaDon.money}đ</td>
													<td>${hoaDon.totalMoney}đ</td>
													<td>${hoaDon.nameSupplier}</td>
													<td>${hoaDon.user.name}</td>

													<td><c:if test="${hoaDon.status == true}">
															<span class="badge-dot badge-success mr-1"></span>Xác nhận
														</c:if> <c:if test="${hoaDon.status == false}">
															<span class="badge-dot badge-secondary mr-1"></span>Chưa xác nhận
														</c:if></td>
													<td>${hoaDon.created}</td>
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
	<script>
		function hienThi(x, a) {
			document.getElementById(x).style.display = a;
		}
	</script>
</body>
</html>