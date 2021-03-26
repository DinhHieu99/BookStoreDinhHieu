<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="vi">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/img/logo.png">
<title>Trang quản lý</title>
</head>

<body>
	<div class="dashboard-main-wrapper">
		<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

		<!-- wrapper  -->

		<div class="dashboard-wrapper">
			<div class="dashboard-influence">
				<div class="container-fluid dashboard-content">
					<!-- ============================================================== -->
					<!-- pageheader  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<h3 class="mb-2">Trang chủ</h3>
								<p class="pageheader-text">Proin placerat ante duiullam
									scelerisque a velit ac porta, fusce sit amet vestibulum mi.
									Morbi lobortis pulvinar quam.</p>

							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader  -->


				</div>
			</div>
			<!-- ============================================================== -->
			<%
			//@ include file="/WEB-INF/views/admin/layout/footer.jsp"
			%>
		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<!-- jquery 3.3.1 -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script
		src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
	<!-- morris-chart js -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morrisjs.html"></script>
	<!-- chart js -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/charts/charts-bundle/Chart.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/charts/charts-bundle/chartjs.js"></script>
	<!-- dashboard js -->
	<script
		src="${pageContext.request.contextPath}/assets/libs/js/dashboard-influencer.js"></script>
</body>

</html>