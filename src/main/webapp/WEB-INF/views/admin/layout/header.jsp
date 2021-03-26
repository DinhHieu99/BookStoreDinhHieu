<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- main wrapper -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- navbar -->
<!-- ============================================================== -->
<div class="dashboard-header">
	<nav class="navbar navbar-expand-lg bg-white fixed-top">
		<a class="navbar-brand" href="/admin"> <img alt="logo"
			src="${pageContext.request.contextPath}/img/logo.png" height="40px">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto navbar-right-top">
				<li class="nav-item dropdown notification"><a
					class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
					<ul class="dropdown-menu dropdown-menu-right notification-dropdown">
						<li>
							<div class="notification-title">Notification</div>
							<div class="notification-list">
								<div class="list-group">
									<c:forEach var="contactHeader" items="${contactHeader}"
										begin="0" end="4">
										<a href="/admin/sendMail/id=${contactHeader.id}"
											class="list-group-item list-group-item-action active">
											<div class="notification-info">
												<div class="notification-list-user-img">
													<img
														src="${pageContext.request.contextPath}/assets/images/avatar-2.jpg"
														alt="" class="user-avatar-md rounded-circle">
												</div>
												<div class="notification-list-user-block">
													<span class="notification-list-user-name">${contactHeader.fullName}
													</span>${contactHeader.content}
													<div class="notification-date">${contactHeader.createdDate}</div>
												</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</li>
						<li>
							<div class="list-footer">
								<a href="/admin/contacts">View all notifications</a>
							</div>
						</li>
					</ul></li>
				<li class="nav-item dropdown nav-user"><a
					class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
						src="${pageContext.request.contextPath}/assets/images/avatar-1.jpg"
						alt="" class="user-avatar-md rounded-circle"></a>
					<div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
						aria-labelledby="navbarDropdownMenuLink2">
						<div class="nav-user-info">
							<h5 class="mb-0 text-white nav-user-name">
								<%
								if (session.getAttribute("adminName") != null) {
								%>
								<%=session.getAttribute("adminName")%>
								<%
								} else {
								%>
								Tài khoản
								<%
								}
								%>
							</h5>
							<span class="status"></span><span class="ml-2">Available</span>
						</div>
						<a class="dropdown-item" href="/admin/account_information"><i
							class="fas fa-user mr-2"></i>Tài khoản</a> <a class="dropdown-item"
							href="#"><i class="fas fa-cog mr-2"></i>Cài đặt</a> <a
							class="dropdown-item" href="/admin/logout"><i
							class="fas fa-power-off mr-2"></i>Đăng xuất</a>
					</div></li>
			</ul>
		</div>
	</nav>
</div>
<!-- ============================================================== -->
<!-- end navbar -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- left sidebar -->
<!-- ============================================================== -->
<div class="nav-left-sidebar sidebar-dark">
	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="d-xl-none d-lg-none" href="#">Bảng điều khiển</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider">Menu</li>
					<li class="nav-item "><a class="nav-link active" href="#"><i
							class="fa fa-fw fa-user-circle"></i>Bảng điều khiển <span
							class="badge badge-success">6</span></a></li>
					<li class="nav-item "><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-4" aria-controls="submenu-4"><i
							class="fab fa-fw fa-wpforms"></i>Thống kê & Kho hàng</a>
						<div id="submenu-4" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="/admin/kho-hang">Kho sản phẩm</a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="collapse" aria-expanded="false"
									data-target="#submenu-1-1" aria-controls="submenu-1-1">Thống
										kê </a>
									<div id="submenu-1-1" class="collapse submenu" style="">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link"
												href="/admin/ban-hang">Bán hàng</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/thong-ke-nhap-hang">Nhập hàng</a></li>
										</ul>
									</div></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-5" aria-controls="submenu-5"><i
							class="fas fa-fw fa-table"></i>Các bảng quản lý</a>
						<div id="submenu-5" class="collapse submenu" style="">
							<ul class="nav flex-column">

								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="collapse" aria-expanded="false"
									data-target="#submenu-1-3" aria-controls="submenu-1-3">Bảng
										dữ liệu</a>
									<div id="submenu-1-3" class="collapse submenu" style="">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link"
												href="/admin/data-table-user">Quản lý người dùng</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/dataTables">Quản lý sản phẩm</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/post">Quản lý tin tức</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/data-table-category">Quản lý danh mục</a></li>
											<%
											if (Boolean.parseBoolean(session.getAttribute("position").toString()) == true) {
											%>
											<li class="nav-item"><a class="nav-link"
												href="/admin/data-table-admin">Quản lý nhân viên</a></li>
											<%
											}
											%>
											<li class="nav-item"><a class="nav-link"
												href="/admin/hoa-don">Quản lý đơn hàng</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/data-table-supplier">Nhà cung cấp</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/phieu-nhap-hang">Quản lý nhập hàng</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/admin/contacts">Phản hồi</a></li>
										</ul>
									</div></li>
							</ul>
						</div></li>
					<li class="nav-divider">Features</li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-6" aria-controls="submenu-6"><i
							class="fas fa-fw fa-file"></i> Các trang </a>
						<div id="submenu-6" class="collapse submenu" style="">
							<ul class="nav flex-column">

								<li class="nav-item"><a class="nav-link"
									href="pages/login.html">Đăng nhập</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/404-page.html">404 page</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/admin/register">Tạo tài khoản</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/forgot-password.html">Quên mật khẩu</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- ============================================================== -->
<!-- end left sidebar -->